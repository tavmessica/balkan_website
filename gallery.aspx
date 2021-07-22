<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="gallery.aspx.cs" Inherits="Tav_web.gallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .title
        {
            color:white;
            text-align:center;
            font-family:Arial;
            margin-top: 15px;
            font-size:70px;
            text-decoration:underline;
        }
        .imgCell{
            width:240px;
            height:160px;
            border:1px solid black;
        }
        .bigPicImg{
            width: 500px;
            height:340px;
            border: 1px solid black;
        }
        table{
            padding:20px;
        }
        h2{
            color:white;
            text-align:center;
        }
    </style>
    <script>
        function picShow (picSrc){
            bigPic.src = picSrc;//שם בסורס של ביק פיק את הכתובת שקיבלת
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="title">גלריית תמונות</h1>
    <h2>*לחץ על תמונה על מנת שתוצג באופן מוגדל</h2>
    <table style="margin:0px auto">
        <tr>
            <td><img class="imgCell" src="photos/bulgaria11.jpg" onclick="picShow('photos/bulgaria11.jpg')" /></td>
            <td><img class="imgCell" src="photos/GREC0001.jpg" onclick="picShow('photos/GREC0001.jpg')" /></td>
            <td><img class="imgCell" src="photos/KOSV0001.jpg" onclick="picShow('photos/KOSV0001.jpg')" /></td>
            <td><img class="imgCell" src="photos/MACE0001%20(1).jpg" onclick="picShow('photos/MACE0001%20(1).jpg')" /></td>
        </tr>
        <tr>
            <td><img class="imgCell" src="photos/bosnia-and-herzegovina-bosnian-flag-png-large.png" onclick="picShow('photos/bosnia-and-herzegovina-bosnian-flag-png-large.png')" /></td>
            <td rowspan="2" colspan="2">
                <img class="bigPicImg" id="bigPic" src="photos/bulgaria11.jpg"/>
            </td>
            <td><img class="imgCell" src="photos/MNGR0001.jpg" onclick="picShow('photos/MNGR0001.jpg')" /></td>
            
        </tr>
        <tr>
            <td><img class="imgCell" src="photos/SERB0001.jpg" onclick="picShow('photos/SERB0001.jpg')" /></td>
            <td><img class="imgCell" src="photos/albania-national-flag.jpg" onclick="picShow('photos/albania-national-flag.jpg')" /></td>
        </tr>
        <tr>
            <td><img class="imgCell" src="photos/155.jpg" onclick="picShow('photos/155.jpg')" /></td>
            <td><img class="imgCell" src="photos/151.jpg" onclick="picShow('photos/151.jpg')" /></td>
            <td><img class="imgCell" src="photos/152.png" onclick="picShow('photos/152.png')" /></td>
            <td><img class="imgCell" src="photos/153.jpg" onclick="picShow('photos/153.jpg')" /></td>
        </tr>
    </table>
    
</asp:Content>
