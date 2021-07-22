using System;

namespace Tav_web
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        public string loginMsg;
        public string menu;
        protected void Page_Load(object sender, EventArgs e)
        {
            //מחרוזת הברכה
            loginMsg = "<h3>שלום ";
            loginMsg += Session["userFName"].ToString();//נקח את הערך שבאובייקט הסשייין נעשה לו טוסורינג ונשים אותו באתר
            loginMsg += "</h3>";
            //נקח סטרינג ונשים בו את האפשרויות בהתאם למה שקבלנו
            if (Session["uName"].ToString() == "אורח")
            {
                menu = "<li><a href='new_reg.aspx'>רישום</a></li>" + "<li><a href = 'getin.aspx'> התחבר </a></li> "+" <li><a href='loginAdmin.aspx'>כניסת מנהל</a></li>";
                
            }
            else if(Session["admin"].ToString() == "yes")
            {
                menu = "<li><a href='admin_func.aspx'>דף ניהול</a></li>" + "<li><a href = 'logout.aspx'> התנתק </a></li> ";
            }
            else
            {
                menu = "<li><a href='updateUser.aspx'>עדכון פרטים</a></li>" + "<li><a href = 'logout.aspx'> התנתק </a></li> ";
            }

        }
    }
}