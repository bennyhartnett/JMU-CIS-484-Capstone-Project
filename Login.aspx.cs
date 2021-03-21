using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Drawing;

namespace CapstoneFinal
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblIncorrectLogin.ForeColor = Color.Red;
            if (Session["InvalidUsage"] != null)
            {
                lblIncorrectLogin.Text = Session["InvalidUsage"].ToString();
            }
            if (Session["LoggedOut"] != null)
            {
                lblIncorrectLogin.Text = Session["LoggedOut"].ToString();
            }

            if (Request.QueryString.Get("loggedout") == "true")
            {
                lblIncorrectLogin.ForeColor = Color.Green;
                lblIncorrectLogin.Text = "User Successfully Logged Out!";
            }
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
                sc.ConnectionString = @"Server=LOCALHOST;Database=AUTH;Trusted_Connection=Yes;";


                sc.Open();
                System.Data.SqlClient.SqlCommand findPass = new System.Data.SqlClient.SqlCommand();
                findPass.Connection = sc;

                findPass.CommandType = CommandType.StoredProcedure;
                findPass.CommandText = "JeremyEzelllab4";
                String un = "";
                if (txtEmail.Text.Length > 20)
                {
                    un = txtEmail.Text.Substring(0, 20);
                }
                else

                {
                    un = txtEmail.Text;
                }


                findPass.Parameters.Add(new SqlParameter("@Username", HttpUtility.HtmlEncode(un)));

                SqlDataReader reader = findPass.ExecuteReader(); // create a reader

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        string storedHash = reader["PasswordHash"].ToString();

                        if (PasswordHash.ValidatePassword(HttpUtility.HtmlEncode(txtPassword.Text), storedHash))
                        {

                            btnLogin.Enabled = false;
                            txtEmail.Enabled = false;
                            txtPassword.Enabled = false;
                            Session["UserName"] = HttpUtility.HtmlEncode(txtEmail.Text);
                            Response.Redirect("homeT.aspx");
                        }


                    }
                }
                else
                    lblIncorrectLogin.Text = "Incorrect Username and/or Password! Please try again!";

                sc.Close();
            }
            catch
            {

            }
        }

        

    }

}