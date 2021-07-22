<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="show_table.aspx.cs" Inherits="Tav_web.show_table" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        th, td, table{
            border: 1px solid black; margin: 0px auto; padding:5px;
            border-collapse:collapse;
        }
        h1,h2 {color:white; text-align:center; font-family:Arial;}
        body{direction:rtl;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>טבלת משתמשים</h1>
    <h2><%= sqlSelect %></h2><!--תציג לי את השאילתה-->
    <table >
       <%=st %><!--תשתול כאן את הטבלה-->
    </table>
    <h2><%= msg %></h2><!--תשתול כאן את ההודעה של כמה משתמשים= כמספר השורות/רשומות-->
</asp:Content>
