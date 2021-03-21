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
    public partial class Student : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String sqlQuery = "SELECT * FROM Teacher";

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
                teachers.Items.Add(queryResults["LastName"].ToString() + ": " + queryResults["TeacherID"].ToString());

                teachers.DataValueField = (queryResults["TeacherID"].ToString());
            }

            queryResults.Close();

            sqlQuery = "SELECT * FROM Event";

            sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;

            queryResults = sqlCommand.ExecuteReader();

            

            queryResults.Close();

            sqlQuery = "SELECT * FROM TShirtConfigurations";

            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;

            queryResults = sqlCommand.ExecuteReader();

            while (queryResults.Read())
            {
                //shirtsList.Items.Add(queryResults["ShirtSize"].ToString() + " " + queryResults["ShirtColor"].ToString() + ": " + queryResults["ShirtInfoID"].ToString());
            }

            queryResults.Close();
            sqlConnect.Close();
        }

        protected void ButPop_Click(object sender, EventArgs e)
        {
            Response.Redirect("Student2.aspx");
        }

        protected void ButClear_Click(object sender, EventArgs e)
        {
            txtFirstName.Text = String.Empty;
            Response.Redirect("student.aspx");
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
            if (CheckBox1.Checked)
            {
                check = 1;
            }
            int check2 = 0;
            if (CheckBox2.Checked)
            {
                check2 = 1;
            }


            String tID = teachers.SelectedValue.Substring(teachers.SelectedValue.IndexOf(':') + 2);
            //String sID = (shirtsList.SelectedValue.Substring(shirtsList.SelectedValue.IndexOf(':') + 2));
            
            sqlCommand = new SqlCommand();
            sqlQuery = "INSERT INTO STUDENT VALUES (" + counter + ", @FirstName , @LastName, @Age, @Notes, " + tID + ", @Gender, @Dietary, " + check + ", " + check2 + " , 0 , @ParentName, @ParentEmail);  ";
            sqlCommand.Parameters.AddWithValue("@FirstName", HttpUtility.HtmlEncode(txtFirstName.Text));
            sqlCommand.Parameters.AddWithValue("@LastName", HttpUtility.HtmlEncode(txtLastName.Text));
            sqlCommand.Parameters.AddWithValue("@Age", HttpUtility.HtmlEncode(txtAge.Text));
            sqlCommand.Parameters.AddWithValue("@Notes", HttpUtility.HtmlEncode(txtNotes.Text));
            sqlCommand.Parameters.AddWithValue("@Gender", HttpUtility.HtmlEncode(txtGender.Text));
            sqlCommand.Parameters.AddWithValue("@Dietary", HttpUtility.HtmlEncode(txtDiet.Text));
            sqlCommand.Parameters.AddWithValue("@ParentName", HttpUtility.HtmlEncode(txtParent.Text));
            sqlCommand.Parameters.AddWithValue("@ParentEmail", HttpUtility.HtmlEncode(txtEmail.Text));

           

            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;

            queryResults = sqlCommand.ExecuteReader();

            queryResults.Close();
            sqlConnect.Close();

            Response.Write("Success! Student Added");
            Response.Redirect("successPS.aspx");

        }
        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = CheckBox2.Checked;
        }
    }


}