using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration; //lets us access our webconfig file in C#


namespace CapstoneFinal
{
    public partial class Print : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void BtnLoadStudents(object sender, EventArgs e)
        {
            String sqlQuery = "Select student.FirstName, student.LastName, age, notes, student.gender, dietary, parentcoming, permission, tcheck, teacher.LastName AS " +
                "Teacher, name AS School FROM Student INNER JOIN Teacher ON Teacher.TeacherID = Student.TeacherID INNER JOIN School ON Teacher.SchoolID = School.SchoolID";

            sqlQuery += " where Teacher.SchoolID = " + ddlTeacher.SelectedValue;
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["lab4"].ToString());
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
            DataTable dtForGridView = new DataTable();
            sqlAdapter.Fill(dtForGridView);
            grdOrderResults.DataSource = dtForGridView;
            grdOrderResults.DataBind();

            sqlConnect.Close();


            sqlQuery = "Select  FirstName + ' ' + LastName AS Teacher, EmailAddress AS Email, grade AS Grade, Name AS School FROM School inner join Teacher ON Teacher.SchoolID = School.SchoolID ";

            sqlQuery += " where School.SchoolID = " + ddlTeacher.SelectedValue;
            SqlConnection sqlConnect1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["lab4"].ToString());
            SqlDataAdapter sqlAdapter1 = new SqlDataAdapter(sqlQuery, sqlConnect1);
            DataTable dtForGridView1 = new DataTable();
            sqlAdapter1.Fill(dtForGridView1);
            grdOrderResults2.DataSource = dtForGridView1;
            grdOrderResults2.DataBind();

            sqlConnect1.Close();


            sqlQuery = "Select student.ParentName, student.ParentEmail, student.FirstName + ' ' + student.LastName AS Child, " +
                "Teacher.lastname as ChildsTeacher, name AS School FROM Student INNER JOIN Teacher ON Teacher.TeacherID = Student.TeacherID INNER JOIN School ON Teacher.SchoolID = School.SchoolID ";

            sqlQuery += " where School.SchoolID = " + ddlTeacher.SelectedValue + " and parentcoming=1 ";
            SqlConnection sqlConnect2 = new SqlConnection(WebConfigurationManager.ConnectionStrings["lab4"].ToString());
            SqlDataAdapter sqlAdapter2 = new SqlDataAdapter(sqlQuery, sqlConnect2);
            DataTable dtForGridView2 = new DataTable();
            sqlAdapter2.Fill(dtForGridView2);
            grdOrderResults3.DataSource = dtForGridView2;
            grdOrderResults3.DataBind();
            sqlConnect2.Close();




        }

        protected void BtnShowAll_Click(object sender, EventArgs e)
        {
            String sqlQuery = "Select student.FirstName, student.LastName, age, notes, student.gender, dietary, parentcoming, permission, tcheck, teacher.LastName AS " +
                 "Teacher, name AS School FROM Student INNER JOIN Teacher ON Teacher.TeacherID = Student.TeacherID INNER JOIN School ON Teacher.SchoolID = School.SchoolID ";

            
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["lab4"].ToString());
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
            DataTable dtForGridView = new DataTable();
            sqlAdapter.Fill(dtForGridView);
            grdOrderResults.DataSource = dtForGridView;
            grdOrderResults.DataBind();

            sqlConnect.Close();


            sqlQuery = "Select  FirstName + ' ' + LastName AS Teacher, EmailAddress AS Email, grade AS Grade, Name AS School FROM School inner join Teacher ON Teacher.SchoolID = School.SchoolID ";

            
            SqlConnection sqlConnect1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["lab4"].ToString());
            SqlDataAdapter sqlAdapter1 = new SqlDataAdapter(sqlQuery, sqlConnect1);
            DataTable dtForGridView1 = new DataTable();
            sqlAdapter1.Fill(dtForGridView1);
            grdOrderResults2.DataSource = dtForGridView1;
            grdOrderResults2.DataBind();

            sqlConnect1.Close();


            sqlQuery = "Select student.ParentName, student.ParentEmail, student.FirstName + ' ' + student.LastName AS Child, " +
                "Teacher.lastname as ChildsTeacher, name AS School FROM Student INNER JOIN Teacher ON Teacher.TeacherID = Student.TeacherID INNER JOIN School ON Teacher.SchoolID = School.SchoolID  where parentcoming = 1";

            
            SqlConnection sqlConnect2 = new SqlConnection(WebConfigurationManager.ConnectionStrings["lab4"].ToString());
            SqlDataAdapter sqlAdapter2 = new SqlDataAdapter(sqlQuery, sqlConnect2);
            DataTable dtForGridView2 = new DataTable();
            sqlAdapter2.Fill(dtForGridView2);
            grdOrderResults3.DataSource = dtForGridView2;
            grdOrderResults3.DataBind();

        }
    }
}