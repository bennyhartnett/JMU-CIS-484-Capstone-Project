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
    public partial class SchoolC : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void BtnLoadTeachers(object sender, EventArgs e)
        {
            String sqlQuery = "Select Name AS School, FirstName + ' ' + LastName AS Teacher, EmailAddress AS Email, grade AS Grade FROM School inner join Teacher ON Teacher.SchoolID = School.SchoolID ";

            sqlQuery += " where School.SchoolID = " + ddlSchool.SelectedValue;
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["lab4"].ToString());
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
            DataTable dtForGridView = new DataTable();
            sqlAdapter.Fill(dtForGridView);
            grdOrderResults.DataSource = dtForGridView;
            grdOrderResults.DataBind();
        }

        protected void BtnShowAll_Click(object sender, EventArgs e)
        {
            String sqlQuery = "Select Name AS School, FirstName + ' ' + LastName AS Teacher, EmailAddress AS Email, grade AS Grade FROM School inner join Teacher ON Teacher.SchoolID = School.SchoolID ";

            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["lab4"].ToString());
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
            DataTable dtForGridView = new DataTable();
            sqlAdapter.Fill(dtForGridView);
            grdOrderResults.DataSource = dtForGridView;
            grdOrderResults.DataBind();

        }


    }
}
