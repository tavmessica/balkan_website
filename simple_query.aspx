<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="simple_query.aspx.cs" Inherits="Tav_web.simple_query" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
        
        th, td, table{
            border: 1px solid black; margin: 0px auto; padding:5px;
            border-collapse:collapse;
        }
        h1,h2 {color:white; text-align:center; font-family:Arial;}
        body{direction:rtl;}
        .all{ padding-right:100px;}
       
    </style>
    <script>
        function detectField() {
            if (document.getElementById("field").value == "gender")//נשתול בתוך הקוד את מה שאנחנו רוצים
            {
                document.getElementById("query").innerHTML =
                    "<input type='radio' name='value' value='male' checked='checked'/>זכר" +
                    
                    "<input type='radio' name='value' value='female' />נקבה";
            }
            else if (document.getElementById("field").value == "yearBorn")//אחרת אם זה שנת לידה..
            {
                var yearStr = "<select name ='value'><option value='0'>בחר שנה</option>";//פותח תיבת סלקט ששמה וליו
                var currYear = new Date().getFullYear();//צור אובייק date וקח את השנה הנוכחית
                var fromYear = currYear - 200;
                var toYear = currYear - 5;

                for (var i = fromYear; i < toYear; i++)//לולאה שיוצרת לנו את הסלקט של השנים.
                {
                    yearStr += "<option value='" + i + "'>" + i + "</option>\n";//האין אומר תרד שורה
                }
                document.getElementById("query").innerHTML = yearStr + "</select>";//שם את המחרוזת הזאת בתוך הדיב בקטע קוד ה.ט.מ.ל
            }
            else if (document.getElementById("field").value == "province") {
                var provinceStr = " <select name='value'>";//מכיל קוד ה.ט.מ.ל
                provinceStr += "<option value='Zafon'>  מחוז הצפון </option>";
                provinceStr += "<option value='Haifa' >מחוז חיפה </option>";
                provinceStr += "<option value='tel aviv' >מחוז תל אביב </option>";
                provinceStr += "<option value='mercaz' >מחוז המרכז </option>";
                provinceStr += "<option value='Jerusalem' >מחוז ירושליים </option>";
                provinceStr += "<option value='darom' >מחוז הדרום </option>";
                provinceStr += "</select>";

                document.getElementById("query").innerHTML = provinceStr;
            }
            else
                document.getElementById("query").innerHTML = "<input type='text' name='value' />";// אחרת פשוט תציג תיבת חיפוש
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>חיפוש פשוט</h1>
    <br />
    <br />
    <br />

    <div class="all">
    <form id="Form1" method="post" runat="server">
        <select name="field" id="field"  onclick="detectField();"><!--ברגע שנלחץ תפעל הפונקציה-->
            <option value="uName">שם משתמש</option><!--הערך ווליו יהיה בדיוק באותו שם כמו בטבלה-->
            <option value="fName">שם פרטי</option>
            <option value="lName">שם משפחה</option>
            <option value="email">אימייל</option>
            <option value="gender">מגדר</option>
            <option value="province">מחוז</option>
            <option value="yearBorn">שנת לידה</option>
            <option value="tel">מספר טלפון</option>
            <option value="pw">סיסמא</option>
        </select>
        <br />
        <br />
        
        <div id="query"><!--כאן יכנס המקום להקליד בהתאם למה שהלקוח יבחר-->
          
        </div>
        <br />
        <input type="submit" value="חפש" />
         <br />
        <br />
        
        <h2 dir:"ltr"><%=sqlSelect %></h2>
        
        <table>
            <%= st %>
        </table>
        
        <h2><%= msg %></h2>
           
       
    </form>
      
   </div>
</asp:Content>
