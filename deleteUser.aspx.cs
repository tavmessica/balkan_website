using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace Tav_web
{
    public partial class deleteUser : System.Web.UI.Page
    {
        public string st ="";
        public string msg = "";
        public string sqlDelete = "";//שאילתת מחיקה
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
            //בדיקת אבטחה
            if (Session["admin"].ToString() == "no")
            {
                Response.Redirect("errorpage.aspx");//שולח אותו לדף אחר
            }
            
            string tableName = "usersTbl";
            String fileName = "MyDataDB1.mdf";
            string sqlSelect = "SELECT * FROM " + tableName;
            DataTable table = Helper.ExecuteDataTable(fileName, sqlSelect);//טבלה שממנה יוכל המנהל להחליט את מי הוא מוחק ומי הוא לא מוחק
            string userToDelete = "";//משתנה השומר את שם המשתמש שאותו אנחנו רוצים למחוק
            int length = table.Rows.Count;
            if (length == 0)
                msg = "אין נרשמים";
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
                st += "<th style='width: 100px'></th>";//כאן יהיה כפתור המחיקה
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
                userToDelete = table.Rows[i]["uName"].ToString();//לוקחים את שם המשתמש של אותו אחד בשורה למקרה שהמנהל ירצה למחוק
                st += "<td style = 'text-align: center;'>";
                st += "<a href = 'DeleteRecord.aspx?uName=" + userToDelete + "'> [מחק] </a>";//הצמדנו לכל שורה את היוזרניימ שלה
                /*fileName.aspx?variable =value--->שליחת מידע בצורת גט
                 * המידע מופיע בגלוי בשורת היו אר אל
                 * בשיטת גט הפרטים נמצאים ביו אר אל 
                 * הוא מצמיד את המשתנה אל הקובץ במקרה שלנו מצמיד לטופס המוחק את המשתנה של שם המשתמש 
                 */
                /*לסיכום באמצעות סימן השאלה אנחנו שולחים את היוזרניימ לדף דליטרקורד בצורת גט*/
                st += "</td>";
                st += "</tr>";
            }

            msg = " מספר רשומים" + " "+length;
        }
    }
}