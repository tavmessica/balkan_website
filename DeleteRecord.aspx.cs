using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace Tav_web
{
    public partial class DeleteRecord : System.Web.UI.Page
    {
        
        public string sqlDelete = "";
        public string uName = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            
            //בדיקת אבטחה
            if (Session["admin"].ToString() == "no")
            {
                Response.Redirect("errorpage.aspx");//שולח אותו לדף אחר
            }
            
             uName = Request.QueryString["uName"].ToString();//לקיחת מידע בשיטת גט
            sqlDelete = "DELETE FROM usersTbl  WHERE uName ='" + uName + "'";//שאילתת מחיקה
            string fileName = "MyDataDB1.mdf";//שם המסד
            Helper.DoQuery(fileName, sqlDelete);//הפעלת שאילתת מחיקה
            Response.Redirect("deleteUser.aspx");//שולח לדף מחיקת משתמשים
        }
    }
}