using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Tav_web
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public string msg = "";
        public string sqlLogin;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.Form["submit"] != null)//נבדוק אם לחץ על סאבמיט
            {
                //לוקחים מידע מתוך הטופס
                string uName = Request.Form["uName"];
                string pw = Request.Form["pw"];

                //שם מסד הנתונים והטבלה
                string fileName = "MyDataDB1.mdf";
                string tableName = "usersTbl";


                //שאילתת הכניסה- בוחרים משתמש עם השם ועם הסיסמא - אם אין התאמה בין המשתמש לסיסמא לא ניתן למתחזה להיכנס
                //זוהי שאילתה שמחפשת משתמש אחד שגם הסיסמא שלו היא מה שהקליד וגם שם המשתמש קיים
                sqlLogin = "SELECT * FROM " + tableName + " WHERE uName = '" + uName + "' AND pw = '" + pw + "'";

                DataTable table = Helper.ExecuteDataTable(fileName, sqlLogin); // הפעלת השאילתה

                int length = table.Rows.Count;
                if (length == 0)
                {
                    msg = "לא נמצא משתמש / הסיסמא אינה נכונה";
                    //Response.Redirect("getin.aspx");// מחזיר אותי בחזרה לדף לוגין

                }
                else //אם כן מצא
                {
                    //תור כניסות-נבצע נעילה
                    Application.Lock();//אם כמה נכנסים ממש באותה שניה נצטרך לנעול את האובייקט ואחרכ לפתוח אותו
                    Application["counter"] = (int)Application["counter"] + 1;//עדכון מונה מבקרים
                    Application.UnLock();
                    Session["uName"] = table.Rows[0]["uName"];//בונה שני אובייקטים מסוג סיישין האחד שומר את שם המשתמש והשני שומר את שמו הפרטי של המשתמש
                    Session["userFName"] = table.Rows[0]["fName"];
                    Response.Redirect("mainpage.aspx"); //מעבר אוטומטי לדף אחר כשמתרחש אירוע כלשהו


                }

            }
        }
    }
}