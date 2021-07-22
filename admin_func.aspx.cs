using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tav_web
{
    public partial class admin_func : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //בדיקת אבטחה

            //mistakeif (Session["uName"].ToString() != "אורח"  && Session["userFName"].ToString() != "מנהל")
            if (Session["admin"].ToString() == "no")
            {
                Response.Redirect("errorpage.aspx");//שולח אותו לדף אחר
            }
            
        }
    }
}