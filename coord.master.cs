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
    public partial class coord : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                if (Session["Username"].ToString() == "conno3aj@jmu.edu" || Session["Username"].ToString() == "loughsr@jmu.edu" || Session["Username"].ToString() == "dillontw@jmu.edu")
                    {

                        
                    }
                else {

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