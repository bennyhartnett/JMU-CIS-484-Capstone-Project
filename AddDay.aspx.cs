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
    public partial class AddDay : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ButClear_Click(object sender, EventArgs e)
        {

            Response.Redirect("AddDay.aspx");
        }

        protected void ButInsert_Click(object sender, EventArgs e)
        {

            String sqlQuery = "SELECT * FROM Day";

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
            sqlQuery = "INSERT INTO Day VALUES (" + counter + ", @EventTitle , @Date )";
            sqlCommand.Parameters.AddWithValue("@EventTitle", HttpUtility.HtmlEncode(txtEventTitle.Text));
            sqlCommand.Parameters.AddWithValue("@Date", HttpUtility.HtmlEncode(Calendar1.SelectedDate));
            



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