using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace Tav_web
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            Application["counter"] = 0;//אתחול מונה מבקרים
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            //נגדיר שני אובייקטי סישיין
            Session["uName"] = "אורח";//ישמור שם משתמש
            Session["userFName"] = "אורח";//ישמור שם פרטי של המשתמש
            Session["admin"] = "no";
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {
            //נגדיר שני אובייקטי סישיין
            Session["uName"] = "אורח";
            Session["userFName"] = "אורח";
            Session["admin"] = "no";
        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}