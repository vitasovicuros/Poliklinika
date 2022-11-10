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

        }

        private void FillDropDownLists()
        {
            ddlBrojKnjizice.Items.Clear();
            ddlBrojKnjizice.Items.Add(new ListItem("Selektujte broj knjizice"));
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
                        ddlBrojKnjizice.Items.Add(item);
                    }
                    reader.Close();
                }
                catch(Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
            }
        }
    }
}