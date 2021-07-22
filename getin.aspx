<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="getin.aspx.cs" Inherits="Tav_web.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="stylesheet/getin_style.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="all111" style="text-align:center" dir="rtl">
        <br />
    <h1>כניסת משתמש:</h1>
        <br />
    <div class="getin">
       
    <form  method="post" runat="server"  >
            <label>שם משתמש:</label><br /><br />
            <input type="text" name="uName" id="uName" " /><br /><br />
            <p id="FnameMsg" class="valMsg"></p>
            <br />
            <label>סיסמא:</label><br /><br />
            <input type="text" name="pw" id="pw" /><br /><br />
            <br />
        <input type="submit" name="submit" value="התחבר" />
     </form>
        <h3><%=msg %></h3>
        </div>
         </div>
    
</asp:Content>
