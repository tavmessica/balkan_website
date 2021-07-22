<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="deleteUser.aspx.cs" Inherits="Tav_web.deleteUser" %>
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
    <h1>מחק משתמש</h1>
    <table>
            <%=st %>
    </table>
    <h2><%=msg %></h2>
    <br /><br /><br />

</asp:Content>
