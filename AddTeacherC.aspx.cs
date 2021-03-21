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
    public partial class AddTeacherC : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String sqlQuery = "SELECT * FROM School";


            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["lab4"].ToString());


            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;


            sqlConnect.Open();
            SqlDataReader queryResults = sqlCommand.ExecuteReader();
            int countTeach = 0;

            while (queryResults.Read())
            {
                countTeach++;
                lbSchools.Items.Add(queryResults["Name"].ToString() + ": " + queryResults["SchoolID"].ToString());

                lbSchools.DataValueField = (queryResults["SchoolID"].ToString());
            }

            queryResults.Close();

            lbGrade.Items.Add("K");

            for (int ii = 1; ii <= 12; ii++)
            {
                lbGrade.Items.Add(ii.ToString());
            }
            sqlQuery = "SELECT * FROM TShirtConfigurations";

            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;

            queryResults = sqlCommand.ExecuteReader();


            queryResults.Close();
            sqlConnect.Close();
        }

        protected void ButClear_Click(object sender, EventArgs e)
        {
            txtFirstName.Text = String.Empty;
            Response.Redirect("AddTeacher.aspx");
        }

        protected void ButInsert_Click(object sender, EventArgs e)
        {
            String un = "";
            if (txtEmail.Text.Length > 20)
            {
                un = txtEmail.Text.Substring(0, 20);
            }
            else

            {
                un = txtEmail.Text;
            }
            String sqlQuery = "SELECT * FROM Teacher";


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


            String sID = lbSchools.SelectedValue.Substring(lbSchools.SelectedValue.IndexOf(':') + 2);
            String gID = lbGrade.SelectedItem.ToString();



            sqlCommand = new SqlCommand();
            sqlQuery = "INSERT INTO Teacher VALUES ( '" + counter.ToString() + "' , '" + sID + "' , @FirstName , @LastName , @Email , '" + gID + " ') ";
            sqlCommand.Parameters.AddWithValue("@FirstName", HttpUtility.HtmlEncode(txtFirstName.Text));
            sqlCommand.Parameters.AddWithValue("@LastName", HttpUtility.HtmlEncode(txtLastName.Text));
            sqlCommand.Parameters.AddWithValue("@Email", HttpUtility.HtmlEncode(txtEmail.Text));


            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;
            queryResults = sqlCommand.ExecuteReader();
            queryResults.Close();
            sqlConnect.Close();

            if (txtFirstName.Text != "" && txtLastName.Text != "" && txtPassword.Text != "" && txtEmail.Text != "")
            {

                try
                {
                    System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
                    sc.ConnectionString = @"Server=LOCALHOST;Database=AUTH;Trusted_Connection=Yes;"; // connect to PBKDF2 Auth database


                    sc.Open();


                    System.Data.SqlClient.SqlCommand createUser = new System.Data.SqlClient.SqlCommand();
                    createUser.Connection = sc;
                    // INSERT USER RECORD
                    createUser.CommandText = "insert into[dbo].[Person] values(@FName, @LName, @Username)";
                    createUser.Parameters.Add(new SqlParameter("@FName", HttpUtility.HtmlEncode(txtFirstName.Text)));
                    createUser.Parameters.Add(new SqlParameter("@LName", HttpUtility.HtmlEncode(txtLastName.Text)));
                    createUser.Parameters.Add(new SqlParameter("@Username", HttpUtility.HtmlEncode(un)));
                    createUser.ExecuteNonQuery();

                    System.Data.SqlClient.SqlCommand setPass = new System.Data.SqlClient.SqlCommand();
                    setPass.Connection = sc;

                    setPass.CommandText = "insert into[dbo].[Pass] values((select max(userid) from person), @Username, @Password)";
                    setPass.Parameters.Add(new SqlParameter("@Username", HttpUtility.HtmlEncode(un)));
                    setPass.Parameters.Add(new SqlParameter("@Password", PasswordHash.HashPassword(HttpUtility.HtmlEncode(txtPassword.Text)))); // hash entered password
                    setPass.ExecuteNonQuery();

                    sc.Close();


                    txtFirstName.Enabled = false;
                    txtLastName.Enabled = false;
                    txtEmail.Enabled = false;
                    txtPassword.Enabled = false;

                    Response.Redirect("login.aspx");

                }
                catch
                {
                    Response.Redirect("login.aspx");
                }
            }

        }
        protected void Home_Click(object sender, EventArgs e)
        {
            Response.Redirect("Menu.aspx");
        }
    }


}