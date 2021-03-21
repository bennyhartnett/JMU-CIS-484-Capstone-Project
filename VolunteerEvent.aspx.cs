using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration; // Lets us access out Web.Config file!

namespace CapstoneFinal
{
    public partial class VolunteerEvent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnVolEvent_Click(object sender, EventArgs e)
        {
            System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection(WebConfigurationManager.ConnectionStrings["lab4"].ToString());

            sc.Open();
            System.Data.SqlClient.SqlCommand findInt = new System.Data.SqlClient.SqlCommand();
            findInt.Connection = sc;

            findInt.CommandType = CommandType.Text;
            findInt.CommandText = "SELECT PersonnelID FROM EventPersonnel WHERE EmailAddress LIKE '%" + Session["UserName"].ToString() + "%'";


            //SqlDataReader reader = findType.ExecuteReader();// create a reader
            int personnelID = Convert.ToInt32(findInt.ExecuteScalar());

            System.Data.SqlClient.SqlConnection sc2 = new System.Data.SqlClient.SqlConnection(WebConfigurationManager.ConnectionStrings["lab4"].ToString());

            sc2.Open();
            System.Data.SqlClient.SqlCommand findInt2 = new System.Data.SqlClient.SqlCommand();
            findInt2.Connection = sc;

            findInt2.CommandType = CommandType.Text;
            findInt2.CommandText = "SELECT * From EventPresenters";

            SqlDataReader queryResults = findInt2.ExecuteReader();
            int counter = 0;
            //SqlDataReader reader = findType.ExecuteReader();// create a reader
            while (queryResults.Read())
            {
                counter++;
            }
            //int eventPresenterID = Convert.ToInt32(findInt2.ExecuteScalar());

            //Define our connection to the Database
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["lab4"].ToString());

            // Create the SQL Command Object to send our query to the DB
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;

            sqlConnect.Open();

            // Update command
            System.Data.SqlClient.SqlCommand update = new System.Data.SqlClient.SqlCommand("insert into [dbo].[EventPresenters] values (" + counter + ", " + ddlEvent.SelectedValue + ", " + personnelID + ", 'Volunteer')" );
            update.Connection = sqlConnect;
            update.ExecuteNonQuery();

            // Tell the user the volunteer was assigned to the event
            lblUpdate.Text = "You have been assigned to the event! Thanks for volunteering!";

            //Close out the connection
            sqlConnect.Close();
        }
    }
}
