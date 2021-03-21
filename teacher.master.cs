using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration; //lets us access our webconfig file in C#
using System.Data;
using System.Data.SqlClient;

namespace CapstoneFinal
{
    public partial class teacher : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["UserName"] != null)
            {

                String sqlQuery = "SELECT EMAILADDRESS FROM TEACHER WHERE EMAILADDRESS  LIKE '%" + Session["UserName"].ToString() + "%'";

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



                queryResults.Close();
                sqlConnect.Close();
                if (counter< 1)
                {
                    Response.Redirect("homeV.aspx");
                }


            }
            else
            {
                Response.Redirect("homeP.aspx");
            }
        }
    }
}