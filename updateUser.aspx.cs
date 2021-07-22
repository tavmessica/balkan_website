using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace Tav_web
{
    public partial class upadteUser : System.Web.UI.Page
    {
        public string msg = "";//הצלחנו או לא הצלחנו
        public string sqlUpdate = "";//שאילתת עדכון
        public string sqlSelect = "";//שאילתה בוחרת

        public string yrBorn = "";// נתונים שנשלוף מהטבלה במסד
        public string uName, fName, lName, email, gender, province, tel, pw;
        public string yearList = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string fileName = "MyDataDB1.mdf";
            uName = Session["uName"].ToString();//נשלוף מאובייקט הסיישין את שם המשתמש בצורה של מחרוזת
            //נקח את הפרטים המעודכנים- זה יכנס לתנאי אם שינינו את הפרטים
            if(uName == "אורח")
            {
                msg = "אינך משתמש רשום במערכת";
                Response.Redirect("mainpage.aspx");
            }
            if (this.IsPostBack)//בודק אם חזרו מהטופס
            {
                //לקחת נתונים מהטופס
                fName = Request.Form["fName"];
                lName = Request.Form["lName"];
                email = Request.Form["email"];
                gender = Request.Form["gender"];
                province = Request.Form["province"];
                int yearBrn = int.Parse(Request.Form["yearBorn"]);//צריך להעביר למשתנה מסוג אינט
                tel = Request.Form["tel"];
                pw = Request.Form["pw"];
                //בניית שאילתת העדכון
                sqlUpdate = "UPDATE usersTbl ";
                sqlUpdate += " SET fName = '" + fName + "', ";
                sqlUpdate += "lName = '" + lName + "', ";
                sqlUpdate += "email = '" + email + "', ";
                sqlUpdate += "gender = '" + gender + "', ";
                sqlUpdate += "province = '" + province + "', ";
                sqlUpdate += "yearBorn = " + yearBrn + ", ";
                sqlUpdate += "tel = '" + tel + "', ";
                sqlUpdate += "pw = '" + pw + "' ";
                sqlUpdate += "WHERE uName = '" + uName + "'";

                //הפעלת שאילתת העדכון
                Helper.DoQuery(fileName, sqlUpdate);
                msg = "succses";//הודעה שתוצג בצד לקוח
                Response.Redirect("mainpage.aspx");

            }
            else //אם טרם שינינו זה ייכנס לכאן
            {
                //שליפת נתוני משתמש מהטבלה
                sqlSelect = "SELECT * FROM usersTbl WHERE uName ='" + uName + "'";//שאילתה שמחפשת את המשתמש שנמצא באובייקט סיישן
                DataTable table = Helper.ExecuteDataTable(fileName, sqlSelect);
                int length = table.Rows.Count;//האורך צריך להיות 1 כי שם משתמש זה שדה מפתח 
                //קיבלנו טבלה וירטואלית שיש לה שורה אחת והיא גם במקום 0
                if (length == 0)
                {
                    msg = "אינך משתמש רשום";
                }
                else
                {
                    //שליפת נתונים מהרשומה
                    fName = table.Rows[0]["fName"].ToString().Trim();//כך את הטוסטרינג כי אלו אובייקטים
                    //טרים זה אומר כך מידע ללא תווי רווח למשל הקצנו לשדה שלושים תווים והמשתמש השתמש ב12 אז כך את זה ללא הרווח של ה18 תווים
                    lName = table.Rows[0]["lName"].ToString().Trim();
                    email = table.Rows[0]["email"].ToString().Trim();
                    gender = table.Rows[0]["gender"].ToString().Trim();
                    province = table.Rows[0]["province"].ToString().Trim();
                    int yearBorn = Convert.ToInt16(table.Rows[0]["yearBorn"]);//העבר את זה לאינט
                    // שנת לידה כרשימה נגללת
                    var currYear = DateTime.Today.Year;//צור אובייק date וקח את השנה הנוכחית
                    
                    var toYear = currYear - 5;
                    for (int i = 1900; i < toYear; i++)
                    {
                        if (i == yearBorn)
                            yearList += "<option value='" + i + "' selected = 'selected' >" + i + "</option>";
                        else
                            yearList += "<option value='" + i + "'>" + i + "</option>";
                    }
                    tel = table.Rows[0]["tel"].ToString().Trim();
                    pw = table.Rows[0]["pw"].ToString().Trim();
                }

            }

        }
    }
}