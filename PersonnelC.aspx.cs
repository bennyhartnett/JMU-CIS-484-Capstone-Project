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
    public partial class PersonnelC : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void BtnPersonnelEvent(object sender, EventArgs e)
        {
            String sqlQuery = "Select EventPersonnel.FirstName, EventPersonnel.LastName , EventTitle , Role, Time, [End], Date, Location from EventPersonnel inner join EventPresenters ON EventPersonnel.PersonnelID = EventPresenters.PersonnelID INNER JOIN EVENT ON EVENT.EventID = EventPresenters.EventID INNER JOIN [DAY] ON [DAY].dayid=event.season ";

            sqlQuery += " where EventPresenters.PersonnelID = " + ddlVolunteer.SelectedValue;
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["lab4"].ToString());
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
            DataTable dtForGridView = new DataTable();
            sqlAdapter.Fill(dtForGridView);
            grdOrderResults.DataSource = dtForGridView;
            grdOrderResults.DataBind();
        }

        protected void BtnShowAll_Click(object sender, EventArgs e)
        {
            String sqlQuery = "Select EventPersonnel.FirstName, EventPersonnel.LastName , EventTitle , Role ,Time, [End], Date, Location from EventPersonnel inner join EventPresenters ON EventPersonnel.PersonnelID = EventPresenters.PersonnelID INNER JOIN EVENT ON EVENT.EventID = EventPresenters.EventID INNER JOIN [DAY] ON [DAY].dayid = event.season";

            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["lab4"].ToString());
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
            DataTable dtForGridView = new DataTable();
            sqlAdapter.Fill(dtForGridView);
            grdOrderResults.DataSource = dtForGridView;
            grdOrderResults.DataBind();



        }

    }
}
