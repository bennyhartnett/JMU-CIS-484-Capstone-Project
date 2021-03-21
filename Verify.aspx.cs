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
    public partial class Verify : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        



        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection(WebConfigurationManager.ConnectionStrings["lab4"].ToString());

            sc.Open();
            System.Data.SqlClient.SqlCommand findType = new System.Data.SqlClient.SqlCommand();
            findType.Connection = sc;

            findType.CommandType = CommandType.Text;
            findType.CommandText = "SELECT Type FROM Verify WHERE Code = @Code";
            findType.Parameters.AddWithValue("@Code", txtCode.Text);

            //SqlDataReader reader = findType.ExecuteReader();// create a reader
            int getType = Convert.ToInt32(findType.ExecuteScalar());
            //int getType = Convert.ToInt32(reader.Read());


            int parent = 1;
            int teacher = 2;
            int volunteer = 3;
            //string type = reader["Type"].ToString();
            Session["VerifyCode"] = txtCode.Text.Substring(0, 1);
            

            if (getType == parent)
            {
                //if (txtCode.Text == "0westspringpar")
                //{
                //    Response.Redirect("successP0.aspx");
                //}
                // else if (txtCode.Text == "1coopfall21par")
                //{
                //    Response.Redirect("successP1.aspx");
                // }
                //else if (txtCode.Text == "2longspringpar")
                //{
                //   Response.Redirect("successP2.aspx");
                //}
                Response.Redirect("successP.aspx");

                lblStatus.Text = "Parent Code Verified!";
                
            }
            else if (getType == teacher)
            {
                Response.Redirect("successT.aspx");
                lblStatus.Text = "Teacher Code Verified!";
                
            }
            else if (getType == volunteer)
            {
                Response.Redirect("successV.aspx");
                lblStatus.Text = "Volunteer Code Verified!";
               
            }
            else
            {
                lblStatus.Text = "Invalid Code! Please Try Again.";
                
            }

            sc.Close();

        }


        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

    }
}