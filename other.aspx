<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="other.aspx.cs" Inherits="Tav_web.other" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script>
        
        setInterval("myTimer()", 1000);//מפעילה כל פרק זמן את הפונקציה , המספר 1000 מייצג פרק זמן של שנייה
        function myTimer() {
            var d = new Date();//נדגום זמן רגעי
            var t = d.toLocaleTimeString();//ניקח את השעה העכשוית
            document.getElementById("myTime").innerHTML = t;//שים בתוך המחרוזת הריקה את המשתנה טי
        }
     </script>
     <style>
     h3{
            color:white;
            font-size:50px;
        }
        
        .all{
            padding-top:5px;
            padding-right:50px;
        }
        .all a{
            text-decoration:underline;
            color:white;
            font-size:50px;
            font-weight:bold;
        }
        a:hover{
            color:black;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="all">
     <h3><a href="mailto:tavmessica567@gmail.com">צור קשר-תו מסיקה</a></h3>
     <h3>מונה מבקרים באתר &nbsp;=&nbsp;<%= Application["counter"] %></h3>
     <h3 id="myTime"></h3>
        </div>
</asp:Content>
