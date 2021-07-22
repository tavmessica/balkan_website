<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="error_user.aspx.cs" Inherits="Tav_web.error_user" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
            font-size:30px;
            font-weight:bold;
        }
        a:hover{
            color:black;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="all">
     <h3>אינך משתמש רשום, אין לך הרשאה להיכנס לדף זה</h3><br/>
     <a href= 'mainpage.aspx'>חזור לדף ראשי</a>
        </div>
    
</asp:Content>
