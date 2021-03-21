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
    public partial class Event : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void BtnEventPresent(object sender, EventArgs e)
        {
            String sqlQuery = "Select EventTitle AS Event, Time, [End],Date, Location, FirstName, LastName, Role FROM Event inner join EventPresenters ON Event.EventID = EventPresenters.EventID inner join EventPersonnel ON EventPersonnel.PersonnelID = EventPresenters.PersonnelID INNER JOIN DAY ON DAY.dayid=event.season";

            sqlQuery += " where Event.EventID = " + ddlEvent.SelectedValue;
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["lab4"].ToString());
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
            DataTable dtForGridView = new DataTable();
            sqlAdapter.Fill(dtForGridView);
            grdOrderResults.DataSource = dtForGridView;
            grdOrderResults.DataBind();
        }

        protected void BtnEventAttend(object sender, EventArgs e)
        {
            String sqlQuery = "Select EventTitle as event, Time, Event.[End], Date, Location, student.FirstName, student.LastName FROM Event inner join [day] ON Event.season = [day].dayID inner join School ON school.[day] = event.season INNER JOIN teacher ON teacher.schoolID=school.schoolid INNER JOIN student ON student.teacherID=teacher.teacherid  ";

            sqlQuery += " where Event.EventID = " + ddlEvent.SelectedValue;
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["lab4"].ToString());
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
            DataTable dtForGridView = new DataTable();
            sqlAdapter.Fill(dtForGridView);
            grdOrderResults.DataSource = dtForGridView;
            grdOrderResults.DataBind();



        }

        
    }
}