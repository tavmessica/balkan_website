using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Tav_web
{
    public partial class complex_query : System.Web.UI.Page
    {
        public string st = "";//מחרוזת שתכיל את טבלת התוצאות
        public string msg = "";//מחרוזת שתציג כמה רשומות מתאימות לשאילתה
        public string sql = "";
        public string sqlSelect = "";//מחרוזת להצגת השאילתה ושמירתה
        protected void Page_Load(object sender, EventArgs e)
        {
            //בדיקת אבטחה
            if (Session["admin"].ToString() == "no")
            {
                Response.Redirect("errorpage.aspx");//שולח אותו לדף אחר
            }

            //שמירת שמות השדות והערכים שנבחרו
            string field1 = Request.Form["field1"];//השדה שנבחר בבחירה הראשונה
            string field2 = Request.Form["field2"];//השדה שנבחר בבחירה השנייה

            string value1 = Request.Form["value1"];//הערך שקיבלנו כלומר מה שהמשתמש הכניס בפעם הראשונה
            string value2 = Request.Form["value2"];//הערך שקיבלנו כלומר מה שהמשתמש הכניס בפעם השנייה

            string op = Request.Form["op"];//התנאי הלוגי שהמשתמש בחר

            //שמירת שם מסד הנתונים ושם הטבלה לשימוש השאילתה
            string fileName = "MyDataDB1.mdf";
            string tableName = "usersTbl";
            //אנחנו בונים קודם כל תת שאילתות ואז מחברים את זה בשאילתה אחת גדולה בסוף
            string qry1 = "", qry2 = "";//תנאים של שאילתה ראשונה ותנאים של שאילתה שניה
             if (Page.IsPostBack)//האם לחצו submit
            { 

            //תנאי ראשון
            if(value1 !=null && value1 != "")//תנאי זה הוא חשוב, הוא מוודא שלא קיבלנו נל אחרת היה יכול להווצר מצב שהיינו מקבלים נל וזה לא היה עובד (מנסיון
            {//נשים לב שיכול להיות שהמשתמש לא הקיש דבר וגם זה לא חוקי 

                if (field1 == "gender" || field1 == "province")//שדות עם ערך אחד
                    qry1 = field1 + " = '" + value1 + "'";
                else if (field1 == "yearBorn")//משתנה זה הוא מסוג מספרי לכן נטפל בו כמספר ולא כמחרוזת
                    qry1 = field1 + " = " + value1;
                else if (field1 == "email")
                    qry1 = field1 + " like '%" + value1 + "%'";
                else
                    qry1 = field1 + " like '" + value1 + "%'";

            }
            //תנאי שני
            if (value2 != null && value2!="")
            {

                if (field2 == "gender" || field2 == "province")
                    qry2 = field2 + " = '" + value2 + "'";
                else if (field2 == "yearBorn")
                    qry2 = field2 + " = " + value2;
                else if (field2 == "email")
                    qry2 = field2 + " like '%" + value2 + "%'";
                else
                    qry2 = field2 + " like '" + value2 + "%'";

            }

            //בניית השאילתה
            if (qry1 != "" || qry2 != "")//אם משתמש לחץ על האפשרויות ובעצם התת תנאים שלנו כן קיבלו אליהם ערך לפחות אחד מהם
                    //כאן אנחנו בודקים אם התת שאילתות לפחות אחת מהן אינה כמו במצב ההתחלתי שלה
                    //אם המשתמש לא בחר כלום אז התת תנאי כמחרוזת הוא ריק ופה אנחנו בודקים שלא קיבלנו שניים רקים
                    //במילים: אם הראשון לא ריק או השני לא ריק וזה כולל גם את המקרה ששניהם לא ריקים
            {
                if (qry1 != "" && qry2 == "")// אם נבחר רק תנאי אחד יפעל כמו שאילתה פשוטה
                {
                    sqlSelect = "SELECT * FROM " + tableName + " where (" + qry1 + ");";
                }
                else if (qry1 == "" && qry2 != "")
                {
                    sqlSelect = "SELECT * FROM " + tableName + " where (" + qry2 + ");";
                }
                else if (op == "and")
                {
                    sqlSelect = "SELECT * FROM " + tableName + " where (" + qry1 + " AND " + qry2 + ");";
                }
                else
                {
                    sqlSelect = "SELECT * FROM " + tableName + " where (" + qry1 + " OR " + qry2 + ");";
                }
                    sql = sqlSelect;//סטרינג שמכיל את השאילתה בצד לקוח
                    //הפעלת השאילתה
                    DataTable table = Helper.ExecuteDataTable(fileName, sqlSelect);

                    int length = table.Rows.Count;
                    if (length == 0)
                        msg = "לא נמאו תוצאות תאומות לחיפוש";
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
}