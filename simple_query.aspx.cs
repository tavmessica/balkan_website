using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Tav_web
{
    public partial class simple_query : System.Web.UI.Page
    { 
        public string st = "";//מחרוזת שתכיל את הטבלה
        public string msg = "";//מחרוזת שתציג כמה רשומות מתאימות לשאילתה
        public string sql = "";//מחרוזת להצגת השאילתה
        public string sqlSelect="";//השאילתה
        
        protected void Page_Load(object sender, EventArgs e)
        {
            //בדיקת אבטחה
            if (Session["admin"].ToString() == "no")
            {
                Response.Redirect("errorpage.aspx");//שולח אותו לדף אחר
            }

            //שמירת שם השדה וערך השדה שנבחרו
            string field = Request.Form["field"];//ערך של מה שבחרנו- אם בחרנו מגדר נקבל כאן מגדר וכו
            string value = Request.Form["value"];//זה מה שכתוב או מה שבחרנו...לשים לב בקוד גאווה קראנו לזה ווליו לשדות- לא להתבלבל 

            //שמירת שם מסד הנתונים ושם הטבלה לשימוש השאילתה
            string fileName = "MyDataDB1.mdf";
            string tableName = "usersTbl";

            if (Page.IsPostBack)//האם לחצו submit
            {


                if (field == "gender" || field == "province")
                {
                    sqlSelect = "SELECT * FROM " + tableName + " where (" + field + " = '" + value + "');";
                }
                else if (field == "yearBorn" )
                {
                    sqlSelect = "SELECT * FROM " + tableName + " where (" + field + " = " + value + ");";//אין גרש כי שמנו את השנה באינט
                }
                    
                else if (field == "email")
                    sqlSelect = "SELECT * FROM " + tableName + " where (" + field + " like '%" + value + "%');";

                else if (field == "tel")
                    sqlSelect = "SELECT * FROM " + tableName + " where (" + field + " like '" + value + "%');";
                else
                    sqlSelect = "SELECT * FROM " + tableName + " where (" + field + " like '" + value + "%');";//שם משתמש\פרטי\משפחה

                //הפעלת השאילתה
                DataTable table = Helper.ExecuteDataTable(fileName, sqlSelect);//מקבל טבלה עם הנתונים לפי השאילתה

                int length = table.Rows.Count;//אורך שורות
                if (length == 0)
                    msg = "לא נמצאו תוצאות תואמות לחיפוש";
                else
                {
                    st += "<tr>";
                    st += "<th>  שם משתמש </th>";
                    st += "<th>  שם פרטי </th>";
                    st += "<th>  שם משפחה </th>";
                    st += "<th>  אימייל </th>";
                    st += "<th>  מגדר </th>";
                    st += "<th>  מחוז </th>";
                    st += "<th>  שנת לידה </th>";
                    st += "<th>  טלפון </th>";
                    st += "<th>  סיסמא </th>";
                    st += "</tr>";

                }


                for (int i = 0; i < length; i++)
                {
                    st += "<tr>";
                    st += "<td>" + table.Rows[i]["uName"] + "</td>";//שורה אי עמודה יוניימ
                    st += "<td>" + table.Rows[i]["fName"] + "</td>";
                    st += "<td>" + table.Rows[i]["lName"] + "</td>";
                    st += "<td>" + table.Rows[i]["email"] + "</td>";
                    st += "<td>" + table.Rows[i]["gender"] + "</td>";
                    st += "<td>" + table.Rows[i]["province"] + "</td>";
                    st += "<td>" + table.Rows[i]["yearBorn"] + "</td>";
                    st += "<td>" + table.Rows[i]["tel"] + "</td>";
                    st += "<td>" + table.Rows[i]["pw"] + "</td>";
                    st += "</tr>";
                }
                msg = length + " אנשים עונים לתוצאות החיפוש";

            }

        }
    }
}