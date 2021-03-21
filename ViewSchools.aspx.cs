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
    public partial class ViewSchools : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)

        {
            String sqlQuery = "Select Name AS School,PhoneNumber AS Phone, PrimaryContactName AS Contact, Address1, Address2, City, State, Zip FROM School";

            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["lab4"].ToString());
            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);
            DataTable dtForGridView = new DataTable();
            sqlAdapter.Fill(dtForGridView);
            grdOrderResults.DataSource = dtForGridView;
            grdOrderResults.DataBind();
        }
        
    }
}