using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Poliklinika
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                FillDropDownListDoktor();
                FillDropDownListPacijent();
            }
        }

        protected void FillDropDownListDoktor()
        {
            ddlDoktor.Items.Clear();
            ddlDoktor.Items.Add(new ListItem("Selektujte doktora"));

            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = Connection.conString;
            SqlDataReader reader;

            SqlCommand cmd = new SqlCommand("Select IdDok, Ime, Prezime FROM Doktor  ",conn);

            using(conn)
            {
                try
                {
                    conn.Open();
                    reader = cmd.ExecuteReader();
                    while(reader.Read())
                    {
                        ListItem item = new ListItem();
                        item.Text = reader["Ime"].ToString() + " " +reader["Prezime"].ToString();
                        item.Value = reader["IdDok"].ToString();
                        ddlDoktor.Items.Add(item);
                    }
                    reader.Close();
                }
                catch(Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
            }
        }

        protected void FillDropDownListPacijent()
        {
            ddlPacijent.Items.Clear();
            ddlPacijent.Items.Add(new ListItem("Selektujte pacijenta"));

            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = Connection.conString;
            SqlDataReader reader;

            SqlCommand cmd = new SqlCommand("Select BrKnjizice, Ime, Prezime FROM Pacijent", conn);

            using (conn)
            {
                try
                {
                    conn.Open();
                    reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        ListItem item = new ListItem();
                        item.Text = reader["Ime"].ToString() + " " +reader["Prezime"].ToString();
                        item.Value = reader["BrKnjizice"].ToString();
                        ddlPacijent.Items.Add(item);
                    }
                    reader.Close();
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
            }
        }

        protected void btnPrikaz_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = Connection.conString;
            SqlDataReader reader;
            string SqlSelect = "Select Termin.IdDok AS IdDok, Termin.BrKnjizice AS BrKnjizice, Doktor.Ime + ' ' + Doktor.Prezime AS ImeDoktor, Pacijent.Ime + ' ' + Pacijent.Prezime AS ImePacijent, Datum, Vreme From Termin JOIN Pacijent ON Termin.BrKnjizice = Pacijent.BrKnjizice JOIN Doktor ON Termin.IdDok = Doktor.IdDok";
            if(ddlDoktor.SelectedItem.Text != "Selektujte doktora" && ddlPacijent.SelectedItem.Text != "Selektujte pacijenta")
            {
                SqlSelect += " WHERE Termin.IdDok= " + ddlDoktor.SelectedItem.Value + " AND Termin.BrKnjizice= " + ddlPacijent.SelectedItem.Value;
            }
            else if(ddlDoktor.SelectedItem.Text != "Selektujte doktora" && ddlPacijent.SelectedItem.Text == "Selektujte pacijenta")
            {
                SqlSelect += " WHERE Termin.IdDok= " + ddlDoktor.SelectedItem.Value;
            }
            else if(ddlDoktor.SelectedItem.Text == "Selektujte doktora" && ddlPacijent.SelectedItem.Text != "Selektujte pacijenta")
            {
                SqlSelect += " WHERE Termin.BrKnjizice= " + ddlPacijent.SelectedItem.Value;
            }
            
            SqlCommand cmd = new SqlCommand(SqlSelect, conn);
            
            
            using(conn)
            {
                conn.Open();
                reader = cmd.ExecuteReader();
                DataTable dataTable = new DataTable();
                dataTable.Columns.Add("IdDok");
                dataTable.Columns.Add("ImeDoktor");
                dataTable.Columns.Add("BrKnjizice");
                dataTable.Columns.Add("ImePacijent");
                dataTable.Columns.Add("Datum");
                dataTable.Columns.Add("Vreme");
                while (reader.Read())
                {
                    DataRow row = dataTable.NewRow();
                    row["IdDok"] = reader["IdDok"];
                    row["ImeDoktor"] = reader["ImeDoktor"];
                    row["BrKnjizice"] = reader["BrKnjizice"];
                    row["ImePacijent"] = reader["ImePacijent"];
                    row["Datum"] = reader["Datum"];
                    row["Vreme"] = reader["Vreme"];

                    dataTable.Rows.Add(row);
                }
                GridView1.DataSource = dataTable;
                GridView1.DataBind();
            }
        }
    }
}