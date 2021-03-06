<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="updateUser.aspx.cs" Inherits="Tav_web.upadteUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
         <style>
        body{direction:rtl;}
        
        td{width: 150px;}
        th {
            color:red;
            font-family:Arial;
        }
        .formTbl {direction:ltr; margin:0px auto; border:1px solid navy;}
        .formTd {border:1px solid navy;}
    </style>
    
    <style>
        .up {
                background: #594848;
                width: 700px;
                color: white;
                font-size: 18px;
                padding: 20px;
                margin-right: 420px;
            }

        h1, h2 {
                    text-align: center;
                    padding: 20px;
                    font-family: Arial
               }
        
    </style>
    <script>
        function chkForm()//בדיקת תקינות טופס
        {

            //בדיקת תקינות שם משתמש
            var uName = document.getElementById("uName").value;
            if (uName.length < 2) {
                document.getElementById("mUName").value = "שם משתמש קצר מידי או לא קיים";
                document.getElementById("mUName").style.display = "inline";
                return false;
            }
            else
                document.getElementById("mUName").style.display = "none";

            if (isHebrew(uName) == true) {
                document.getElementById("mUName").value = "אסור השימוש באותיות עבריות";
                document.getElementById("mUName").style.display = "inline";
                return false;
            }
            else
                document.getElementById("mUName").style.display = "none";

            //בדיקת תקינות שם פרטי
            var fName = document.getElementById("fName").value;
            if (fName.length < 2) {
                document.getElementById("mFName").value = "שם פרטי קצר מידי או לא קיים";
                document.getElementById("mFName").style.display = "inline";
                return false;
            }
            else
                document.getElementById("mFName").style.display = "none";
            if (isHebrew(fName) == true) {
                document.getElementById("mFName").value = "אסור השימוש באותיות עבריות";
                document.getElementById("mFName").style.display = "inline";
                return false;
            }
            else
                document.getElementById("mFName").style.display = "none";

            //בדיקת תקינות שם משפחה
            var lName = document.getElementById("lName").value;
            if (lName.length < 2) {
                document.getElementById("mLName").value = "שם משפחה קצר מידי או לא קיים";
                document.getElementById("mLName").style.display = "inline";
                return false;
            }
            else
                document.getElementById("mLName").style.display = "none";

            if (isHebrew(lName) == true) {
                document.getElementById("mLName").value = "אסור השימוש באותיות עבריות";
                document.getElementById("mLName").style.display = "inline";
                return false;
            }
            else
                document.getElementById("mLName").style.display = "none";
            //בדיקת תקינות דואר אלקטרוני
            /*
               -- דרישות לכתובת דוא"ל --
                אורך מינימלי 6 תווים *
                תכיל סימן @ אחד בלבד *
                מיקום @ לא יהיה לפני תו שלישי (השם הכי קצר חייב להיות שתי אותיות) ולא תו אחרון *
                יכיל נקודה אחת לפחות *
                יש נקודה אחרי ה@ במרחק של לפחות 2 תווים *
                הנקודה לא תהיה תו ראשון וגם לא תו אחרון בכתובת הדוא"ל *
                הכתובת לא תכיל אותיות בעברית וסימנים אסורים אחרים כמו תו רווח, פסיק וכדומה *
            */
            var email = document.getElementById("email").value;
            var size = email.length;
            var atSign = email.indexOf('@');
            var dotSign = email.indexOf('.', atSign);//מקום הנקודה אחרי הסימן שטרודל
            var msg = "";
            if (size < 6)
                msg = "כתובת דואר אלקטרוני קצרה מידי ";
            else if (size > 30)
                msg = "כתובת דואר אלקטרוני ארוכה מידי";
            else if (atSign == -1)
                msg = "סימן @ לא קיים בכתובת";
            else if (atSign != email.lastIndexOf('@'))// בודק אינדקס של שטרודל מהתחלה ומהסוף אם הם לא מתלכדים אז בהכרח יש יותר משטרודל אחד
                msg = "אסור יותר מ@ אחד בכתובת דואר אלקטרוני";
            else if (atSign < 2 || email.lastIndexOf('@') == size - 1)
                msg = "סימן ה-@ אינו יכול להיות במקום הראשון או האחרון";
            else if (email.indexOf('.') == -1)
                msg = "כתובת אימייל חייבת להכיל נקודה אחת לפחות";
            else if (email.indexOf('.') == 0 || email.lastIndexOf('.') == size - 1)
                msg = "נקודה לא יכולה להיות במקום הראשון או האחרון";
            else if (dotSign - atSign <= 1)
                msg = "נקודה חייבת להיות לפחות 2 תווים אחרי סימן ה-@";
            //בדיקת התווים האסורים באמצעות פונקציות עזר
            else if (isQuot(email) == true)
                msg = "כתובת דוא'ל לא יכולה להכיל גרש או גרשיים";
            else if (isHebrew(email) == true)
                msg = "כתובת דוא'ל לא יכולה להכיל עברית";
            else if (isValidString(email) == true)
                msg = "כתובת דו'אל לא יכולה להכיל תווים אסורים";
            if (msg != "") {
                document.getElementById("mEmail").value = msg;
                document.getElementById("mEmail").style.display = "inline";
                return false;
            }
            else
                document.getElementById("mEmail").style.display = "none";
            //בדיקה שנבחר מגדר
            var answer = document.getElementsByName("gender");//מתקבל מערך
            if (!answer[0].checked && !answer[1].checked)//אם במקום 1 וגם במקום 0 התכונה צק לא נבחרה 
            {
                document.getElementById("mGender").value = "חובה לסמן מגדר";
                document.getElementById("mGender").style.display = "inline";
                return false;
            }
            else
                document.getElementById("mGender").style.display = "none";
            //בדיקה שנבחר מחוז
            var province = document.getElementById("province").value;
            if (province == "other") {
                document.getElementById("mProvince").value = "יש לבחור באיזור מגורים";
                document.getElementById("mProvince").style.display = "inline";
                return false;
            }
            else
                document.getElementById("mProvince").style.display = "none";
            //בדיקת שנת לידה
            var yearBorn = document.getElementById("yearBorn").value;
            var d = new Date();//אובייקט תאריך נוכחי
            var year = d.getFullYear();//שנה נוכחית

            var msg = "";
            if (isNaN(yearBorn))//isNaN = is not a number
                msg = "שנת לידה חייבת להכיל ספרות בלבד";
            else if (yearBorn < 1900)
                msg = " שנת לידה חייבת להיות מספר 4 ספרתי גדול מ1900";
            else if (yearBorn > year - 5)
                msg = "צעיר מידי כדי להרשם לאתר";
            if (msg != "") {
                document.getElementById("mYearBorn").value = msg;
                document.getElementById("mYearBorn").style.display = "inline";
                return false;
            }
            else
                document.getElementById("mYearBorn").style.display = "none";
            //בדיקת תקינות טלפון
            var tel = document.getElementById("tel").value;
            if (isNaN(tel)) {
                document.getElementById("mTel").value = "מספר טלפון יכול להכיל רק מספרים";
                document.getElementById("mTel").style.display = "inline";
                return false;
            }

            else if (tel.length != 10) {
                document.getElementById("mTel").value = "מספר טלפון מכיל 10 ספרות בדיוק";
                document.getElementById("mTel").style.display = "inline";
                return false;
            }
            else
                document.getElementById("mTel").style.display = "none";

            //בדיקת סיסמא
            /*תנאים 
             *סיסמא חייבת להיות בין 6 ל10 תווים
             * סיסמא חייבת להיות באנגלית
            * בסיסמה חייב להיות תו אחד מיוחד
            * סיסמא חייבת להתחיל באות גדולה 
            */

            var pw = document.getElementById("pw").value;

            var msg = "";
            var length = pw.length;
            if (length < 6 || length > 10)
                msg = "סיסמא חייבת להיות בת 6 עד 10 תווים";
            else if (isHebrew(pw) == true)
                msg = "סיסמא צריכה להיות באנגלית";
            else if (isValidString(pw) == false)
                msg = "סיסמא צריכה להכיל תו אחד מיוחד לפחות";
            else if (isFirstBigLetter(pw) == false)
                msg = "אות ראשונה צריכה להיות גדולה";

            if (msg != "") {

                document.getElementById("mPW").value = msg;
                document.getElementById("mPW").style.display = "inline";
                return false;
            }
            else
                document.getElementById("mPW").style.display = "none";

            //בדיקה שאימות סיסמא זהה לסיסמא
            var Cpw = document.getElementById("Cpw").value;


            if (Cpw != pw) {

                document.getElementById("mCPW").value = "אימות סיסמא צריך להיות זהה לסיסמא";
                document.getElementById("mCPW").style.display = "inline";
                return false;
            }
            else
                document.getElementById("mCPW").style.display = "none";




        }//סוף הפונקציה הראשית


        //--אם מכיל גרש או גרשיים אז לא תקין--
        function isQuot(mail) {
            var quot = '\"', quot1 = "\'";
            if (mail.indexOf(quot) != -1 || mail.indexOf(quot1) != -1)
                return true;
            return false;
        }
        function isHebrew(mail) //בודקת אם המחרוזת בעברית
        //אם כן מחזיקה אמת אחרת מחזירה שקר
        {
            var len = mail.length;
            var i = 0, ch;
            while (i < len) //כל עוד לא הסתיימה בדיקת המחרוזת
            {

                ch = mail.charAt(i);// שים במשתנה את התו במקום האיי
                if (ch >= 'א' && ch <= 'ת')//בודקת האם התו בין א ו- ת
                    return true;
                i++;
            }
            return false;
        }
        //--בדיקה אם מכיל תויים אסורים--
        //מחזיר אמת אם יש תו אסור ושקר אחרת
        function isValidString(mail) {
            var badChr = "$%^&*()-! []{}<>?";//אחד התווים הוא תו רווח
            var len = mail.length;
            var i = 0, pos, ch;
            while (i < len)//כל עוד לא הסתיימה בדיקת המחרוזת
            {
                ch = mail.charAt(i);//שים בסי אייג את התו במקום האיי
                pos = badChr.indexOf(ch);//חפש את מיקום התו במחרוזת התווים האסורים
                if (pos != -1)//אם התו לא נמצא בחרוזת התווים הרעים 
                    return true;//החזר אמת והפעולה הסתיימה
                i++; //אחרת, התקדם לתו הבא במחרוזת
            }
            return false;//לא נמצא אפילו תו אסור אחד וכן החזר שקר וסיים
        }
        function isFirstBigLetter(pass)//מחריזה אמת אם אות ראשונה של מחרוזת היא גדולה ושקר אחרת
        {
            var ch = pass.charAt(0);
            if (ch >= 'A' && ch <= 'Z')
                return true;
            return false;
        }





    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="up">
    <h1>טופס עדכון פרטים</h1>
    <form method="post" runat="server" onsubmit="return chkForm();">
        <span style="color:red;"> * נא למלא את כל השדות באותיות לטניות (אנגלית) אם יש בכך צורך</span>
        <br /><br /><br />
        <table>
            <tr> 
                <td>שם משתמש</td>
                <!--מצב של מוצג ולא ניתן לשינוי-->
                <td><input type="text" id="uName" name="uName" disabled ="disabled" value="<%= uName %>"/></td><!--אי אפשר לשנות את שם המשתמש - בתוך הטופס הוא יופיע בצבע אפור-->
                <td>
                    <input type="text" id="mUName" size ="30"
                       style="display:none; background-color:silver; font-weight:bold;"
                        disabled ="disabled" />
                </td>
            </tr>
            
            <tr>
                <td><br /></td>
            </tr>
            <tr>
                <td>שם פרטי</td>
                <td><input type="text" id="fName" name="fName" value="<%=fName %>"/></td>
                <td>
                    <input type="text" id="mFName" size ="30"
                        style="display:none; background-color:silver; font-weight:bold;"
                        disabled ="disabled" />
                </td>
            </tr>
            <tr>
                <td><br /></td>
            </tr>
             <tr>
                <td>שם משפחה</td>
                <td><input type="text" id="lName" name="lName" value="<%= lName %>"/></td>
                 <td>
                    <input type="text" id="mLName" size ="30"
                        style="display:none; background-color:silver; font-weight:bold;"
                        disabled ="disabled" />
                </td>
            </tr>
            <tr>
                <td><br /></td>
            </tr>
             <tr>
                <td>כתובת דוא"ל</td>
                <td><input type="text" id="email" name="email" value="<%= email %>"/></td>
                 <td>
                    <input type="text" id="mEmail" size ="35"
                        style="display:none; background-color:silver; font-weight:bold;"
                        disabled ="disabled" />
                </td>
            </tr>
            <tr>
                <td><br /></td>
            </tr>
            <tr>
                <td>מגדר</td>
                
                <td><!--כל הוראה שהיא שפת תכנות שמים בתוך סוגרים אחוז-->
                    <% if (gender == "male"){ %>
                    <input type="radio" name="gender" value="male" checked/>זכר
                    <input type="radio" name="gender" value="female" />נקבה
                    <% } else { %>
                    <input type="radio" name="gender" value="male" />זכר
                    <input type="radio" name="gender" value="female" checked />נקבה
                    <% } %>
                </td>
                <td>
                    <input type="text" id="mGender" size ="35"
                        style="display:none; background-color:silver; font-weight:bold;"
                        disabled ="disabled" />
                </td>
            </tr>
            <tr>
                <td><br /></td>
            </tr>
            <tr>
                <td>מחוז מגורים</td>
                <td>
                    <select name="province" id="province">
                        <!--מה שרשום כמחוז הוא מה שיוצג כבחור-->
                        <%if (province == "Zafon") { %>
                        <option value="Zafon" selected>מחוז הצפון</option>
                        <% } else { %>
                            <option value="Zafon" >מחוז הצפון</option>
                        <% } %>
                        <%if (province == "Haifa") { %>
                        <option value="Haifa" selected>מחוז חיפה</option>
                        <% } else { %>
                            <option value="Haifa">מחוז חיפה</option>
                        <% } %>
                        <%if (province == "tel aviv") { %>
                            <option value="tel aviv" selected>מחוז תל אביב</option>
                        <% } else { %>
                            <option value="tel aviv">מחוז תל אביב</option>
                        <% } %>
                        <%if (province == "mercaz") { %>
                            <option value="mercaz" selected>מחוז המרכז</option>
                        <% } else { %>
                            <option value="mercaz">מחוז המרכז</option>
                        <% } %>
                        <%if (province == "Jerusalem") { %>
                            <option value="Jerusalem" selected>מחוז ירושליים</option>
                        <% } else { %>
                            <option value="Jerusalem">מחוז ירושליים</option>
                        <% } %>
                        <%if (province == "darom") { %>
                            <option value="darom" selected>מחוז הדרום</option>
                        <% } else { %>
                            <option value="darom">מחוז הדרום</option>
                        <% } %>
                    </select>
                </td>
                <td>
                    <input type="text" id="mProvince" size ="35"
                        style="display:none; background-color:silver; font-weight:bold;"
                        disabled ="disabled" />
                </td>
            </tr>
            <tr>
                <td><br /></td>
            </tr>
            <tr>
                <td>שנת לידה</td>
                <td>
                    <select name="yearBorn">
                        <%= yearList %>
                    </select>

                </td>
                 <td>
                    <input type="text" id="mYearBorn" size ="40"
                        style="display:none; background-color:silver; font-weight:bold;"
                        disabled ="disabled" />
                </td>
            </tr>
            <tr>
                <td><br /></td>
            </tr>
            <tr>
                <td>טלפון</td>
                <td><input type="text" id="tel" name="tel" size="20" value="<%=tel %>"/></td>
                 <td>
                    <input type="text" id="mTel" size ="40"
                        style="display:none; background-color:silver; font-weight:bold;"
                        disabled ="disabled" />
                </td>
            </tr>
            <tr>
                <td><br /></td>
            </tr>
            <tr>
                <td>סיסמא</td>
                <td><input type="text" id="pw" name="pw" size="10" value="<%=pw %>"/></td>
                    <td style="color:red;"> * 6-10 תווים</td>
                 <td>
                    <input type="text" id="mPW" size ="40"
                        style="display:none; background-color:silver; font-weight:bold;"
                        disabled ="disabled" />
                </td>
            </tr>
            <tr>
                <td><br /></td>
            </tr>
            <tr>
                <td>בדיקת סיסמא</td>
                <td><input type="text" id="Cpw" name="Cpw" size="10" value="<%=pw %>"/></td>
                 <td>
                    <input type="text" id="mCPW" size ="40"
                        style="display:none; background-color:silver; font-weight:bold;"
                        disabled ="disabled" />
                </td>
            </tr>
            <tr>
                <td><br /></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center;">
                    <input type="submit" name="submit" value=" עדכן "/>
                </td>
            </tr>
            <tr>
                <td><br /></td>
            </tr>
        </table>
    </form>
    <h3><%=sqlSelect %></h3><!--הצגת שאילתה לאיתור משתמש-->
    <h3><%=sqlUpdate %></h3><!--הצגת שאילתת העדכון-->
    <h3><%=msg %></h3><!--הצגת תוצאה-->
        </div>
</asp:Content>
