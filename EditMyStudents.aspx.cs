using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CapstoneFinal
{
    public partial class EditMyStudents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"].ToString()) != null)
            {
                srcStudents.SelectCommand = srcStudents.SelectCommand + "'" + (Session["UserName"].ToString()) + "'";
            }
            else
            {
                srcStudents.SelectCommand = srcStudents.SelectCommand + "'" + "Qdsfdsfdsfsdfsdfsdfsdfsd"+ "'";
            }
        }

        protected void Search_Click(object sender, EventArgs e)
        {

        }
        
    }
}