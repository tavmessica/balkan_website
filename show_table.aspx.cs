using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Tav_web
{
    public partial class show_table : System.Web.UI.Page
    {
        public string st = "";//משפטי מחרוזת שתוכנם יוצג בצד לקוח
        public string msg = "";//הודעה שמוצגת בצד לקוח
        public string sqlSelect = "";//מחרוזת לשאילתה לצורך בדיקה

        protected void Page_Load(object sender, EventArgs e)
        {
            //בדיקת אבטחה

            //mistake if (Session["uName"].ToString() != "אורח" && Session["userFName"].ToString() != "מנהל")
            if (Session["admin"].ToString() == "no")
            {
                Response.Redirect("errorpage.aspx");//שולח אותו לדף אחר
            }

            string fileName = "MyDataDB1.mdf"; //משתנה ששומר את שם מסד הנתונים
            string tableName = "usersTbl"; // משתנה ששומר את שם הטבלה במסד נתונים
            sqlSelect = "SELECT * FROM " + tableName; //משפט הסלקט

            DataTable table = Helper.ExecuteDataTable(fileName, sqlSelect);/*הפעל את הפעולה אקסיקיוט דאטא טייבל שנמצאת 
                                                                            * במחלקה הלפר עם שם הקובץ ומחרוזת המכילה את השאילתה
                                                                            * את התוצאה שמור בתוך אובייקט בשם טייבל מסוג דאטאטייבל
                                                                            */
            int length = table.Rows.Count;//מספר שורות
            if (length == 0)
                msg = "אין נרשמים";
            else
            {
                st += "<tr>";//פותח שורה
                st += "<th>  שם משתמש </th>";//יוצר עמודה
                st += "<th>  שם פרטי </th>";
                st += "<th>  שם משפחה </th>";
                st += "<th>  אימייל </th>";
                st += "<th>  מגדר </th>";
                st += "<th>  מחוז </th>";
                st += "<th>  שנת לידה </th>";
                st += "<th>  טלפון </th>";
                st += "<th>  סיסמא </th>";
                st += "</tr>";//סוגר שורה

            }

            for (int i = 0; i < length; i++)//לולאה
            {
                st += "<tr>";//פותח שורה
                st += "<td>" + table.Rows[i]["uName"] + "</td>";//קח מתוך המשתנה דטה-טייבל את השורה איי והעמודה ששמה מה שבתוך הסוגריים המרובעים
                st += "<td>" + table.Rows[i]["fName"] + "</td>";
                st += "<td>" + table.Rows[i]["lName"] + "</td>";
                st += "<td>" + table.Rows[i]["email"] + "</td>";
                st += "<td>" + table.Rows[i]["gender"] + "</td>";
                st += "<td>" + table.Rows[i]["province"] + "</td>";
                st += "<td>" + table.Rows[i]["yearBorn"] + "</td>";
                st += "<td>" + table.Rows[i]["tel"] + "</td>";
                st += "<td>" + table.Rows[i]["pw"] + "</td>";
                st += "</tr>";//סוגר שורה
            }
            msg = "נרשמו " + length + " אנשים";//מספר השורות כמספר האנשים הרשומים (שורה=רשומה





        }
    }
}