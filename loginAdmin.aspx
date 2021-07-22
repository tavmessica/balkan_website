<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="loginAdmin.aspx.cs" Inherits="Tav_web.loginAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        

h1, h2 {
    text-align: center;
    padding: 20px;
    font-family: Arial
}

.getin {
    background: #594848;
    width: 700px;
    
    color: white;
    font-size: 18px;
    padding: 20px;
}

.getin {
    margin-right: 420px;
}

label {
    color: white;
    font-family: Arial;
    font-size: 25px;
}

 #pass,  #uname {
    border-radius: 3px;
    width: 300px;
    border: none;
    outline: 0;
    padding: 7px;
}

#ph {
    border-radius: 3px;
    width: 65px;
    padding: 7px;
    border: none;
    outline: 0;
}

#Pnum {
    width: 230px;
    border-radius: 3px;
    border: none;
    outline: 0;
    padding: 7px;
}

#submit, #reset {
    width: 200px;
    padding: 7px;
    font-size: 25px;
    font-family: Arial;
    font-weight: 600;
    border: none;
    border-radius: 3px;
}

    #submit a:hover {
        background: skyblue;
        color: black;
    }

p {
    color: red;
}

* {
    box-sizing: border-box;
}


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="all111" style="text-align:center" dir="rtl">
        <br />
    <h1>כניסת מנהל:</h1>
        <br />
    <div class="getin">
       
    <form  method="post" runat="server"  >
            <label>שם מנהל:</label><br /><br />
            <input type="text" name="mName" id="mName" " /><br /><br />
            <p id="FnameMsg" class="valMsg"></p>
            <br />
            <label>סיסמא:</label><br /><br />
            <input type="password" name="pw" id="pw" /><br /><br />
            <br />
        <input type="submit" name="submit" value="התחבר" />
     </form>
        <%= msg %>
        </div>
         </div>
    
</asp:Content>
