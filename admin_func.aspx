<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="admin_func.aspx.cs" Inherits="Tav_web.admin_func" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        h1,h2{
            color:white;
            font-size:50px;
        }
        h1{
            text-decoration:underline;
        }
        .all{
            padding-top:5px;
            padding-right:50px;
        }
        a{
            text-decoration:none;
            color:white;
        }
        a:hover{
            color:black;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="all">
                <h1>דף ניהול</h1>
                <h2><a href='show_table.aspx'>[הצג טבלה]</a></h2>
                <h2><a href='simple_query.aspx'>[חיפוש פשוט]</a></h2>
                <h2><a href='complex_query.aspx'>[חיפוש מורכב]</a></h2>
                <h2><a href="deleteUser.aspx">[מחיקת משתמשים]</a></h2>
    </div>
</asp:Content>
