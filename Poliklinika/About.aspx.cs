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
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FillDropDownListPacijent();
            FillDropDownListDoktor();
        }

        private void FillDropDownListPacijent()
        {
            ddlBrKnjizice.Items.Clear();
            ddlBrKnjizice.Items.Add(new ListItem("Selektujte broj knjizice"));
            SqlConnection con = new SqlConnection();
            con.ConnectionString = Connection.conString;
            SqlDataReader reader;

            SqlCommand cmd = new SqlCommand("Select Ime, Prezime, BrKnjizice FROM Pacijent", con);

            using(con)
            {
                try
                {
                    con.Open();
                    reader = cmd.ExecuteReader();
                    while(reader.Read())
                    {
                        ListItem item = new ListItem();
                        item.Text = reader["Ime"].ToString() + " " + reader["Prezime"].ToString();
                        item.Value = reader["BrKnjizice"].ToString();
                        ddlBrKnjizice.Items.Add(item);
                    }
                    reader.Close();
                }
                catch(Exception ex)
                {
                    ListItem item = new ListItem();
                    item.Text = "Greska!";
                    ddlBrKnjizice.Items.Add(item);
                }
            }
        }

        private void FillDropDownListDoktor()
        {
            ddlIDdoktora.Items.Clear();
            ddlIDdoktora.Items.Add(new ListItem("Selektujte doktora"));
            SqlConnection con = new SqlConnection();
            con.ConnectionString = Connection.conString;
            SqlDataReader reader;

            SqlCommand cmd = new SqlCommand("Select Ime, Prezime, IdDok FROM Doktor", con);

            using (con)
            {
                try
                {
                    con.Open();
                    reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        ListItem item = new ListItem();
                        item.Text = reader["Ime"].ToString() + " " + reader["Prezime"].ToString();
                        item.Value = reader["IdDok"].ToString();
                        ddlIDdoktora.Items.Add(item);
                    }
                    reader.Close();
                }
                catch (Exception ex)
                {
                    ListItem item = new ListItem();
                    item.Text = "Greska!";
                    ddlIDdoktora.Items.Add(item);
                }
            }
        }

    }
}