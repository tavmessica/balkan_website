using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tav_web
{
    public partial class logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Abandon();//תחסל את כל האובייקטים
            Response.Redirect("mainpage.aspx");//שולח אותנו בחזרה לדף הראשי
        }
    }
}