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
    public partial class PCodeT : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //Label2.Text = Session["VerifyCode"].ToString();
            //SqlDataSource1.SelectParameters["VCode"].DefaultValue = Session["VerifyCode"].ToString();




            System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection(WebConfigurationManager.ConnectionStrings["lab4"].ToString());

            sc.Open();
            System.Data.SqlClient.SqlCommand findInt = new System.Data.SqlClient.SqlCommand();
            findInt.Connection = sc;

            findInt.CommandType = CommandType.Text;
            findInt.CommandText = "SELECT SchoolID FROM Teacher WHERE EmailAddress LIKE '%" + Session["UserName"].ToString() + "%'";


            //SqlDataReader reader = findType.ExecuteReader();// create a reader
            int schoolID = Convert.ToInt32(findInt.ExecuteScalar());

            Label2.Text = schoolID.ToString();
            SqlDataSource1.SelectParameters["VCode"].DefaultValue = schoolID.ToString();

        }
    }
}