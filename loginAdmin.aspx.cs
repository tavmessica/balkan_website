using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace Tav_web
{
    public partial class loginAdmin : System.Web.UI.Page
    {
        public string msg = "";//הודעה
        public string sqlAdmin = "";//שאילתת מנהל
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form["submit"] != null)//כל עוד המשתמש לחץ על כפתור סבמיט
            {
                //לוקחים נתונים מהטופס
                string mName = Request.Form["mName"];
                string pw = Request.Form["pw"];
                string fileName = "MyDataDB1.mdf";//שם של המסד

                sqlAdmin = "SELECT * FROM managerTbl WHERE ( mName ='" + mName + "' AND pw ='" + pw + "')";//מחפש את המנהל בטבלת המנהלים

                DataTable table = Helper.ExecuteDataTable(fileName, sqlAdmin);//מקבל טבלה וירטואלית
                int length = table.Rows.Count;
                if(length == 0)//לא נמצא שום רשומה לכן לא מצאנו מנהל
                {
                    msg = "<div style='text-align: center;'>";
                    msg += "<h3>אינך מנהל, נסה שנית</h3>";
                    msg += "<a href='mainpage.aspx' style='color:white;'>לדף הראשי</a>";
                    msg += "</div>";
                }
                else
                {
                    Session["uName"] = mName;
                    Session["userFName"] = "מנהל";//משנים את אובייקט סיישין למנהל
                    Session["admin"] = "yes";//קובעים את הסיישין אדמין להיות יס
                    Response.Redirect("mainpage.aspx");
                }
            }   
        }
    }
}