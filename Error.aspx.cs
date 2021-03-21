using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Net;
using System.Text;

using System.Text.RegularExpressions;

namespace CapstoneFinal
{
    public partial class Error : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Timer1_Tick(object sender, EventArgs e)
        {
            Response.Redirect("HomeC.aspx");
        }

        
    }
}