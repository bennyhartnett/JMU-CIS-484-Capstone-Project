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
    public partial class Roster : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnTC_Click(object sender, EventArgs e)
        {
            String sqlQuery = "SELECT StudentID, student.FirstName, student.LastName, Age, ParentComing, Permission, TCheck FROM Student inner join teacher on student.teacherID=teacher.teacherID where TCheck = '0' AND teacher.EmailAddress = " + Session["Username"].ToString();

            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["lab4"].ToString());
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
            DataTable dtForGridView = new DataTable();
            sqlAdapter.Fill(dtForGridView);
            gvStudent.DataSource = dtForGridView;
            gvStudent.DataBind();
        }

        protected void btnTU_Click(object sender, EventArgs e)
        {
            String sqlQuery = "SELECT StudentID, student.FirstName, student.LastName, Age, ParentComing, Permission, TCheck FROM Student, teacher  WHERE student.teacherID=teacher.teacherID and TCheck = '1' AND teacher.EmailAddress=" + Session["Username"].ToString();

            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["lab4"].ToString());
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
            DataTable dtForGridView = new DataTable();
            sqlAdapter.Fill(dtForGridView);
            gvStudent.DataSource = dtForGridView;
            gvStudent.DataBind();
        }

        protected void btnAll_Click(object sender, EventArgs e)
        {
            String sqlQuery = "SELECT StudentID, student.FirstName, student.LastName, Age, ParentComing, Permission, TCheck FROM Student, teacher  WHERE student.teacherID=teacher.teacherID  AND teacher.EmailAddress=" + Session["Username"].ToString() ;

            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["lab4"].ToString());
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
            DataTable dtForGridView = new DataTable();
            sqlAdapter.Fill(dtForGridView);
            gvStudent.DataSource = dtForGridView;
            gvStudent.DataBind();
        }

        protected void gvStudent_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvStudent.EditIndex = e.NewEditIndex;

            gvStudent.DataBind();
        }

        protected void gvStudent_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            CheckBox cbTC = (CheckBox)gvStudent.Rows[e.RowIndex].Cells[7].Controls[0];

            int TC;

            if (cbTC.Checked == true)
            {
                TC = 1;
            }
            else
            {
                TC = 0;
            }

            int studentid = Convert.ToInt32(gvStudent.Rows[e.RowIndex].Cells[1].Text);
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["lab4"].ToString());
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;

            String sqlQuery = "UPDATE [dbo].[Student]  SET [TCheck] = '" + TC + "' WHERE StudentID = '" + studentid + "'";
            sqlCommand.CommandText = sqlQuery;
            sqlConnect.Open();


            //SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["lab4"].ToString());
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
            DataTable dtForGridView = new DataTable();
            sqlAdapter.Fill(dtForGridView);
            gvStudent.DataSource = dtForGridView;
            gvStudent.DataBind();
            gvStudent.DataBind();
            sqlConnect.Close();
        }

        protected void gvStudent_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvStudent.EditIndex = -1;
            gvStudent.DataBind();
        }
    }
}
    