<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="complex_query.aspx.cs" Inherits="Tav_web.complex_query" %>
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
    
    <script >
        //הפונקציות כמעט זהות ואפילו זהות לפונקציה שעשינו בחיפוש הפשוט אבל הן עם הבדלים קטנים בראשונה שמות הרכיבים יהיו עם סיומת אחת ובשניה עם סיומת שתיים
        function detectField1() {
            if (document.getElementById("field1").value == "gender") {
                document.getElementById("query1").innerHTML =
                    "<input type='radio' name='value1' value='male' checked='checked' /> זכר" +
                    "<input type='radio' name='value1' value='female'  /> נקבה";

            }

            else if (document.getElementById("field1").value == "yearBorn") {
                var yearStr = "<select name='value1'><option value='0'>בחר שנה</option>";
                var currYear = new Date().getFullYear();//השנה הנוכחית
                var fromYear = currYear - 200;
                var toYear = currYear - 5;

                for (var i = fromYear; i < toYear; i++)
                    yearStr += "<option value='" + i + "'>" + i + "</option>\n";

                document.getElementById("query1").innerHTML = yearStr + "</select>";
            }
            else if (document.getElementById("field1").value == "province") {
                var provinceStr = "<select name='value1'>";
                provinceStr += "<option value='Zafon'>  מחוז הצפון </option>";
                provinceStr += "<option value='Haifa' >מחוז חיפה </option>";
                provinceStr += "<option value='tel aviv' >מחוז תל אביב </option>";
                provinceStr += "<option value='mercaz' >מחוז המרכז </option>";
                provinceStr += "<option value='Jerusalem' >מחוז ירושליים </option>";
                provinceStr += "<option value='darom' >מחוז הדרום </option>";
                provinceStr += "</select>";

                document.getElementById("query1").innerHTML = provinceStr;

            }
            else
                document.getElementById("query1").innerHTML = "<input type='text' name='value1' />";
        }
        function detectField2() {
            if (document.getElementById("field2").value == "gender") {
                document.getElementById("query2").innerHTML =
                    "<input type='radio' name='value2' value='male' checked='checked' /> זכר" +
                    "<input type='radio' name='value2' value='female'  /> נקבה";
            }

            else if (document.getElementById("field2").value == "yearBorn") {
                var yearStr = "<select name='value2'><option value='0'>בחר שנה</option>";
                var currYear = new Date().getFullYear();
                var fromYear = currYear - 200;
                var toYear = currYear - 5;

                for (var i = fromYear; i < toYear; i++)
                    yearStr += "<option value='" + i + "'>" + i + "</option>\n";

                document.getElementById("query2").innerHTML = yearStr + "</select>";
            }
            else if (document.getElementById("field2").value == "province") {
                var provinceStr = "<select name='value2'>";
                provinceStr += "<option value='Zafon'>  מחוז הצפון </option>";
                provinceStr += "<option value='Haifa' >מחוז חיפה </option>";
                provinceStr += "<option value='tel aviv' >מחוז תל אביב </option>";
                provinceStr += "<option value='mercaz' >מחוז המרכז </option>";
                provinceStr += "<option value='Jerusalem' >מחוז ירושליים </option>";
                provinceStr += "<option value='darom' >מחוז הדרום </option>";
                provinceStr += "</select>";

                document.getElementById("query2").innerHTML = provinceStr;
            }
            else
                document.getElementById("query2").innerHTML = "<input type='text' name='value2' />";

        }



    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>הצגת משתמשים המקיימים תנאי אחד או שני תנאים</h1>
    <div class="all">
    <form id="Form2" method="post" runat="server">
        <table border="1">
            <tr>
                <td style="width: 20px;">
                    <select name="field1" id="field1"  onclick="detectField1();"><!--תיבה נגללת ראשונה-->
                    <option value="uName">שם משתמש</option>
                    <option value="fName">שם פרטי</option><!--השמות תואמים את מה שיש לנו במסד הנתונים-->
                    <option value="lName">שם משפחה</option>
                    <option value="email">אימייל</option>
                    <option value="gender">מגדר</option>
                    <option value="province">מחוז</option>
                    <option value="yearBorn">שנת לידה</option>
                    <option value="tel">מספר טלפון</option>
                    <option value="pw">סיסמא</option>
                    </select>
                </td>
                <td style="width: 150px;">
                    <div id="query1" style="text-align: center;"></div><!--נשתול כאן את הרכיב המתאים בהתאם למה שהלקוח בחר-->
                </td>
                </tr>
            <tr><!--שם לב כאן הלקוח יוכל לבחור וגם או או אחת מהאפשרויות נבחרה כבחירת מחדל-->
                <td colspan="2" style="text-align: center; direction:ltr; ">
                    <input type="radio" name="op" value="and" checked="checked" />AND
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="op" value="or" />OR
                </td>
            </tr><!--נשים לב לשמות של הרכיבים ואין הכוונה בשם שם אלה בתכונה ניימ של כל רכיב לפי הניימ הזה נקח דברים בקוד מאחור-->
            <tr><!--פשוט עוד פעם את אותו דבר כי זה בעצם שני תנאים שמחוברים זה לזה בקשר לוגי-->
                <!--גם נרצה לשים לב לאיי דיי עם האיי דיי נשתמש בסקריפט שלנו-->
                <td style="width: 20px;">
                    <select name="field2" id="field2"  onclick="detectField2();"><!--תיבה נגללת שנייה-->
                    <option value="uName">שם משתמש</option>
                    <option value="fName">שם פרטי</option>
                    <option value="lName">שם משפחה</option>
                    <option value="email">אימייל</option>
                    <option value="gender">מגדר</option>
                    <option value="province">מחוז</option>
                    <option value="yearBorn">שנת לידה</option>
                    <option value="tel">מספר טלפון</option>
                    <option value="pw">סיסמא</option>
                    </select>
                </td>
                <td>
                    <div id="query2" style="text-align: center;"></div><!--כאן נשתול את הרכיב לפי מה שהמשתמש בחר-->
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <input type="submit" name="submit" value="חפש" />
                </td>
            </tr>
        </table>
    </form>
        <h2 style="direction:ltr;"><%= sql %></h2>
        <table>
            <%= st %><!--השרשור של קוד הטבלה-->
        </table>
        <h2><%=msg %></h2><!--השרשור של הודעה של כמה אנשים ענו על התנאים-->
        </div>
</asp:Content>
