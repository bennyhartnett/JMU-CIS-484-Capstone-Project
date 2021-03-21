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
    public partial class AddSchool : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ddlStates.Items.Add(new ListItem("VA"));
            ddlStates.Items.Add(new ListItem("DC"));
            ddlStates.Items.Add(new ListItem("MD"));
            ddlStates.Items.Add(new ListItem("WV"));
        }
        protected void ButClear_Click(object sender, EventArgs e)
        {

            Response.Redirect("AddEvent.aspx");
        }

        protected void ButInsert_Click(object sender, EventArgs e)
        {

            String sqlQuery = "SELECT * FROM School";

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
            sqlQuery = "INSERT INTO School VALUES (" + counter + ", @Name , @PhoneNumber, @PrimaryContactName, @Address1, @Address2, @City, @State, @Zip, @Day );  " +
                " INSERT INTO Verify VALUES(@Par, 1);  " +
                " INSERT INTO Verify VALUES(@Tea, 2); ";
            sqlCommand.Parameters.AddWithValue("@Name", HttpUtility.HtmlEncode(txtSchoolName.Text));
            sqlCommand.Parameters.AddWithValue("@PhoneNumber", HttpUtility.HtmlEncode(txtPhone.Text));
            sqlCommand.Parameters.AddWithValue("@PrimaryContactName", HttpUtility.HtmlEncode(txtPCN.Text));
            sqlCommand.Parameters.AddWithValue("@Address1", HttpUtility.HtmlEncode(txtAddress1.Text));
            sqlCommand.Parameters.AddWithValue("@Address2", HttpUtility.HtmlEncode(txtAddress2.Text));
            sqlCommand.Parameters.AddWithValue("@City", HttpUtility.HtmlEncode(txtCity.Text));
            sqlCommand.Parameters.AddWithValue("@State", HttpUtility.HtmlEncode(ddlStates.SelectedValue));
            sqlCommand.Parameters.AddWithValue("@Zip", HttpUtility.HtmlEncode(txtZip.Text));
            sqlCommand.Parameters.AddWithValue("@Day", HttpUtility.HtmlEncode(ListBox1.SelectedValue));
            sqlCommand.Parameters.AddWithValue("@Par", HttpUtility.HtmlEncode(counter + txtSchoolName.Text + "par"));
            sqlCommand.Parameters.AddWithValue("@Tea", HttpUtility.HtmlEncode(counter + txtSchoolName.Text + "tea"));

            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;

            queryResults = sqlCommand.ExecuteReader();

            queryResults.Close();
            sqlConnect.Close();

            Response.Write("Success! School Added");
            Response.Redirect("HomeC.aspx");

        }
        
    }
}