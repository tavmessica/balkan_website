using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Tav_web
{
    
    public partial class new_reg : System.Web.UI.Page
    {
        public string st = "";//משתנים שאנחנו שמים בצד לקוח ובגלל זה הם פבליק
        public string msg = "";//משתנים שאנחנו שמים בצד לקוח ובגלל זה הם פבליק
        public string sqlMsg = "";//משתנים שאנחנו שמים בצד לקוח ובגלל זה הם פבליק
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.Form["submit"] != null)//הצגת טבלה רק אחרי שהמשתמש שלח
            {
                st += "<table dir = 'ltr' border = '1' >";
                st += "<tr><th colspan='2'>הפרטים שהתקבלו</th></tr>";
                string uName = Request.Form["uName"];
                string fName = Request.Form["fName"];
                string lName = Request.Form["lName"];
                string email = Request.Form["email"];
                string gender = Request.Form["gender"];
                string province = Request.Form["province"];
                string yearBorn = Request.Form["yearBorn"];
                string pw = Request.Form["pw"];
                string Cpw = Request.Form["Cpw"];
                string tel = Request.Form["tel"];
                st += "<tr><td>user name: </td><td>" + uName + "</td></tr>";
                st += "<tr><td>first name: </td><td>" + fName + "</td></tr>";
                st += "<tr><td>last name: </td><td>" + lName + "</td></tr>";
                st += "<tr><td>email: </td><td>" + email + "</td></tr>";
                st += "<tr><td>gender: </td><td>" + gender + "</td></tr>";
                st += "<tr><td>province: </td><td>" + province + "</td></tr>";
                st += "<tr><td>year born: </td><td>" + yearBorn + "</td></tr>";
                st += "<tr><td>telephone: </td><td>" + tel + "</td></tr>";
                st += "<tr><td>password: </td><td>" + pw + "</td></tr>";
                st += "<tr><td>password validation: </td><td>" + Cpw + "</td></tr>";
                
                st += "</table>";



                int yearBorn_int = int.Parse(yearBorn);//ממירים את המחרוזת למשתנה מספרי
                                                        
                //שמירת שם מסד הנתונים ושם הטבלה לשימוש השאילתה
                string fileName = "MyDataDB1.mdf";
                string tableName = "usersTbl";
                //בדיקה האם משתמש קיים
                string sqlSelect = "SELECT * FROM " + tableName + " WHERE uName = '" + uName + "'";//תביא את כל הרשומות שבהן שם המשתמש הוא השם שקיבלנו בטופס
                
                if(Helper.IsExist(fileName,sqlSelect))//בדיקה האם השם המשתמש שנתנו קיים במסד
                {
                    msg = "user name has been taken";
                    sqlMsg = sqlSelect;
                }
                else
                {
                    sqlSelect =" INSERT INTO " + tableName;
                    sqlSelect += " VALUES ('" + uName + "' , '" + fName + "' , '" + lName + "' , '";
                    sqlSelect += email + "' , '" + gender + "' , '" + province + "' , " + yearBorn_int + " , '" + tel + "' , '" + pw+ "')";
                    sqlMsg = sqlSelect;
                    Helper.DoQuery(fileName, sqlSelect);//פונקציה שמפעילה את שאילתת ההוספה
                    msg = "Succses";
                    sqlMsg = sqlSelect;

                }
                //else if (uName!=null && fName!=null && lName!=null && email!=null && gender!=null && province!=null &&
                   // yearBorn_int!=null && tel!=null && pw!=null)



            }
        }
    }
}