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
    public partial class AddCode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DropDownList1.Items.Add(new ListItem("Parent", "1"));
            DropDownList1.Items.Add(new ListItem("Teacher", "2"));
            DropDownList1.Items.Add(new ListItem("Volunteer", "3"));



        }

        protected void ButClear_Click(object sender, EventArgs e)
        {
           
            Response.Redirect("AddCode.aspx");
        }

        protected void ButInsert_Click(object sender, EventArgs e)
        {

            String sqlQuery = "SELECT * FROM Student";

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
            int check = 0;
            

            sqlCommand = new SqlCommand();
            sqlQuery = "INSERT INTO VERIFY VALUES ( @Code , @Type);"  ;
            sqlCommand.Parameters.AddWithValue("@Code", HttpUtility.HtmlEncode(txtCode.Text));
            sqlCommand.Parameters.AddWithValue("@LastName", HttpUtility.HtmlEncode(DropDownList1.SelectedValue));
            



            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;

            queryResults = sqlCommand.ExecuteReader();

            queryResults.Close();
            sqlConnect.Close();

            Response.Write("Success! Verification Code Added");
            Response.Redirect("#");

        }
        
    }


}