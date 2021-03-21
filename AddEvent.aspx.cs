using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace CapstoneFinal
{
    public partial class AddEvent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ButClear_Click(object sender, EventArgs e)
        {

            Response.Redirect("AddEvent.aspx");
        }

        protected void ButInsert_Click(object sender, EventArgs e)
        {

            String sqlQuery = "SELECT * FROM Event";

            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["lab4"].ToString());

            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;

            sqlConnect.Open();
            SqlDataReader queryResults = sqlCommand.ExecuteReader();
            int counter = 0;

            while (queryResults.Read())
            {
                counter++;
            }



            queryResults.Close();
            sqlCommand = new SqlCommand();
            sqlQuery = "INSERT INTO Event VALUES (" + counter + ", @EventTitle , @Time, @End, @Location, @Season )";
            sqlCommand.Parameters.AddWithValue("@EventTitle", HttpUtility.HtmlEncode(txtEventTitle.Text));
            
            sqlCommand.Parameters.AddWithValue("@Time", HttpUtility.HtmlEncode(txtTime.Text));
            sqlCommand.Parameters.AddWithValue("@End", HttpUtility.HtmlEncode(txtEnd.Text));
            sqlCommand.Parameters.AddWithValue("@Location", HttpUtility.HtmlEncode(txtLocation.Text));
            sqlCommand.Parameters.AddWithValue("@Season", HttpUtility.HtmlEncode(ListBox1.SelectedValue));



            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;

            queryResults = sqlCommand.ExecuteReader();

            queryResults.Close();
            sqlConnect.Close();

            Response.Write("Success! Event Added");
            Response.Redirect("HomeC.aspx");

        }
       
    }
}