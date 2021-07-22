<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="new_reg.aspx.cs" Inherits="Tav_web.new_reg" %>
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
        .reg {
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
    <script >
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
            var email = document.getElementById("email").value;//ניקח את המשתנה
            var size = email.length;//ניקח את אורך האימייל
            var atSign = email.indexOf('@');//מיקום של התו שטרודל
            var dotSign = email.indexOf('.', atSign);//מקום הנקודה אחרי הסימן שטרודל
            var msg = "";// נשים כל פעם הודעה אחרת
            if (size < 6)
                msg = "כתובת דואר אלקטרוני קצרה מידי ";
            else if (size > 30)//יש מקום מוגבל של תווים במסד
                msg = "כתובת דואר אלקטרוני ארוכה מידי";
            else if (atSign == -1)//אם לא קיים במחרוזת פונקציה מחזירה מינוס אחד
                msg = "סימן @ לא קיים בכתובת";
            else if (atSign != email.lastIndexOf('@'))// בודק אינדקס של שטרודל מהתחלה ומהסוף אם הם לא מתלכדים אז בהכרח יש יותר משטרודל אחד
                msg = "אסור יותר מ@ אחד בכתובת דואר אלקטרוני";
                //כעת נבדוק אם השטרונדל נמצא לפני התו השלישי או בתו האחרון
            else if (atSign < 2 || email.lastIndexOf('@') == size - 1)//size-1 = the last char of the string because we count from zero
                msg = "סימן ה-@ אינו יכול להיות במקום הראשון או האחרון";
            else if (email.indexOf('.') == -1)//האם קיימת נקודה בכתובת האימייל?
                msg = "כתובת אימייל חייבת להכיל נקודה אחת לפחות";
                //נקודה לא יכולה להיות לא התו הראשון ולא התו האחרון
            else if (email.indexOf('.') == 0 || email.lastIndexOf('.') == size - 1)//נקודה נמצאת בהתחלה או בסוף?
                msg = "נקודה לא יכולה להיות במקום הראשון או האחרון";
                //נקח את הנקודה אחרי השטרודל אם המרחק בין הנקודה לשטרודל הוא אחד או קטן יותר יש בעיה כי אין שרת מייל שהוא שתי אותיות
            else if (dotSign - atSign <= 3)
                msg = "נקודה חייבת להיות לפחות 2 תווים אחרי סימן ה-@";
            //בדיקת התווים האסורים באמצעות פונקציות עזר
            else if (isQuot(email) == true)//האם כתובת האימייל מכילה גרש או גרשיים? אם כן שים משהו במסג
                msg = "כתובת דוא'ל לא יכולה להכיל גרש או גרשיים";
            else if (isHebrew(email) == true)//האם מכיל אותיות בעברית
                msg = "כתובת דוא'ל לא יכולה להכיל עברית";
            else if (isValidString(email) == true)//האם מכיל תווים אסורים? הפונקציה מחזירה אמת אם מכיל תווים אסורים לכן
                msg = "כתובת דו'אל לא יכולה להכיל תווים אסורים";
            if (msg != "")// אם יש לנו מחרוזת בהודעה אז זה אומר שיש בעיה ולכן אנחנו שמים בתוך המשתנה את ההודעה
            {
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
            var province = document.getElementById("province").value;//התשובה שסומנה
            if (province == "other")//האם נבחרה האפשרות הראשונה
            {
                document.getElementById("mProvince").value = "יש לבחור באיזור מגורים";
                document.getElementById("mProvince").style.display = "inline";
                return false;
            }
            else
                document.getElementById("mProvince").style.display = "none";
            //בדיקת שנת לידה
            // THE DATE OBJECT
            var yearBorn = document.getElementById("yearBorn").value;
            var d = new Date();//אובייקט תאריך נוכחי
            var year = d.getFullYear();//שנה נוכחית

            var msg = "";
            if (isNaN(yearBorn))//isNaN = is not a number
                msg = "שנת לידה חייבת להכיל ספרות בלבד";
            else if (yearBorn < 1900)
                msg = " שנת לידה חייבת להיות מספר 4 ספרתי גדול מ1900";
            else if (yearBorn > year - 5)// התנאי הוא נכון - אמנם מבלבל אבל לבן אדם בוגר יותר שנת לידה קטנה יותר
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
            if (isNaN(tel))//נבדוק אם מכיל אותיות או תווים אחרים שהם לא מספרים
            {
                document.getElementById("mTel").value = "מספר טלפון יכול להכיל רק מספרים";
                document.getElementById("mTel").style.display = "inline";
                return false;
            }

            else if (tel.length != 10)//נבדוק אם מחרוזת הטלפון היא באורך 10- טלפון חייב להיות באורך 10 
            {
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
            if (length < 6 || length > 10)//בדיקת אורך הסיסמא
                msg = "סיסמא חייבת להיות בת 6 עד 10 תווים";
            else if (isHebrew(pw) == true)//סיסמא לא יכולה להכיל אותיות בעברית
                msg = "סיסמא צריכה להיות באנגלית";
            else if (isValidString(pw) == false)//הפונקציה מחזירה שקר אם אין תו מיוחד
                msg = "סיסמא צריכה להכיל תו אחד מיוחד לפחות";
            else if (isFirstBigLetter(pw) == false)//בודק אות ראשונה
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
            if (mail.indexOf(quot) != -1 || mail.indexOf(quot1) != -1)//אחד מהשנים מספיק שיתקיים
                return true;
            return false;
        }
        function isHebrew(mail) //בודקת אם המחרוזת בעברית
        //אם כן מחזיקה אמת אחרת מחזירה שקר
        {
            var len = mail.length;//אורך מחרוזת של המייל
            var i = 0, ch;//מחרוזת מתחילה במקום האפס
            while (i < len) //כל עוד לא הסתיימה בדיקת המחרוזת
            {

                ch = mail.charAt(i);// שים במשתנה את התו במקום האיי
                if (ch >= 'א' && ch <= 'ת')//בודקת האם התו בין א ו- ת
                    return true;
                i++;
            }
            return false;//מחזירים שקר כי לא מצאנו תו בעברית
        }
        //--בדיקה אם מכיל תויים אסורים--
        //מחזיר אמת אם יש תו אסור ושקר אחרת
        function isValidString(mail) {
            var badChr = "$%^&*()-! []{}<>?";//אחד התווים הוא תו רווח
            //יצרנו מחרוזת עם כל התוים שאנחנו לא רוצים
            var len = mail.length;
            var i = 0, pos, ch;
            while (i < len)//כל עוד לא הסתיימה בדיקת המחרוזת
            {
                ch = mail.charAt(i);//שים בסי אייג את התו במקום האיי
                pos = badChr.indexOf(ch);//חפש את מיקום התו במחרוזת התווים האסורים
                if (pos != -1)//אם התו נמצא במחרוזת התווים הרעים 
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
    
     <div class="reg">
    <h1>טופס רישום</h1>
    <form  method="post" runat="server" onsubmit ="return chkForm();">
        <span style="color:red;"> * נא למלא את כל השדות באותיות לטניות (אנגלית) אם יש בכך צורך</span>
        <br /><br /><br />
        <table>
            <tr> 
                <td>שם משתמש</td>
                <td><input type="text" id="uName" name="uName"/></td>
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
                <td><input type="text" id="fName" name="fName"/></td>
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
                <td><input type="text" id="lName" name="lName"/></td>
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
                <td><input type="text" id="email" name="email"/></td>
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
                <td>
                    <input type="radio" name="gender" value="male" />זכר
                    <input type="radio" name="gender" value="female" />נקבה
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
                        <option value="other">בחר מחוז מגורים</option>
                        <option value="Zafon">מחוז הצפון</option>
                        <option value="Haifa">מחוז חיפה</option>
                        <option value="tel aviv">מחוז תל אביב</option>
                        <option value="mercaz">מחוז המרכז</option>
                        <option value="Jerusalem">מחוז ירושליים</option>
                        <option value="darom">מחוז הדרום</option>
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
                <td><input type="text" id="yearBorn" name="yearBorn"/></td>
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
                <td><input type="text" id="tel" name="tel" size="20"/></td>
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
                <td><input type="text" id="pw" name="pw" size="10"/></td>
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
                <td><input type="text" id="Cpw" name="Cpw" size="10"/></td>
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
                    <input type="submit" name="submit" value=" שלח "/>
                </td>
            </tr>
            <tr>
                <td><br /></td>
            </tr>
        </table>
    </form>
   <%=st %>
         <h3><%=msg %></h3>
         <h3><%=sqlMsg %></h3>
 </div >
</asp:Content>
