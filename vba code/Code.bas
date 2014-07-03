
Public Database_Directory As String
Public Database_Temp_Directory As String
Public Database_Template_Directory As String
Public Database_Checkpoint_Directory As String

Public SendEmail As Boolean

Sub CreateRegisters()
Call Registers(False)
End Sub

Sub Registers_SeniorsOnly()

Database_Directory = "D:\RugbyClub\"
Database_Temp_Directory = Database_Directory & "Temp\"
Database_Template_Directory = Database_Directory & "Template\"
Database_Checkpoint_Directory = Database_Directory & "Checkpoint\"

Dim SendEmail As Boolean
'False - dont send email
'True - send email
SendEmail = True

'Send Outstanding Membership confirmations
'Send Membership Breakdown
'Send Coaching Qualifications
'Send Medical Conditions
'Send Referees
'Send Registers

Dim File_Found As String
Dim Monthly_Reports_File_No As Integer
Dim Monthly_Reports_Last_Sent As String
Dim Monthly_Reports_To_Be_Sent As Boolean
Dim DataLine  As String

File_Found = ""
 Monthly_Reports_File_No = 0
Monthly_Reports_Last_Sent = ""
Monthly_Reports_To_Be_Sent = False
DataLine = ""



'GoTo Restart:
File_Found = Dir(Database_Checkpoint_Directory & "MonthlyReportsLastSent.Txt")
If File_Found = "" Then
   'Reports Never sent
   Monthly_Reports_To_Be_Sent = True
Else
    Monthly_Reports_File_No = FreeFile
    Open (Database_Checkpoint_Directory & "MonthlyReportsLastSent.Txt") For Input As #Monthly_Reports_File_No
    Line Input #Monthly_Reports_File_No, DataLine
    Close #Monthly_Reports_File_No
    
    If Left(DataLine, 6) = Mid(Now(), 4, 2) & Mid(Now(), 7, 4) Then
      'Already sent this month - do not send again
      Monthly_Reports_To_Be_Sent = False
    Else
      Monthly_Reports_To_Be_Sent = True
    End If
End If

'
Restart:
'End

Dim DutyRota_Week1$
Dim DutyRota_Week2$
Dim DutyRota_Week3$

DutyRota_Week1$ = ""
DutyRota_Week2$ = ""
DutyRota_Week3$ = ""

Close ' Close all files




'Call Read_Club_Diary(DutyRota_Week1$, DutyRota_Week2$, DutyRota_Week3$)

'If an Age Group has an admin manager the email is sent to the admin manger and .cc'd to the coach.
'If the Age Group doesnt have an admin manager the admin email address is forwarded to the coach.

'Parameters.
'1 Display Name for Age Group - characters must be valid for file names
'2 SQL parameters for search.
'3 To email address.
'4 .CC email address.


Call CreateRegister("Seniors", "AGE_Group = 'Senior'", "senior.captains@grfc.co.uk", "senior.chairman@grfc.co.uk", "", "", "", SendEmail)


EndOfProcess:

If SendEmail = True Then
   MsgBox ("The sending out of Registers has been completed.")
Else
   MsgBox ("The Registers has been created but not sent out, they are located in : " & Database_Temp_Directory)
   
End If



End Sub


Sub Registers(ByVal SendEmail As Boolean)

Database_Directory = "D:\RugbyClub\"
Database_Temp_Directory = Database_Directory & "Temp\"
Database_Template_Directory = Database_Directory & "Template\"
Database_Checkpoint_Directory = Database_Directory & "Checkpoint\"

'False - dont send email
'True - send email
'SendEmail = True

'GoTo Restart:
'Send Outstanding Membership confirmations
'Send Membership Breakdown
'Send Coaching Qualifications
'Send Medical Conditions
'Send Referees
'Send Registers

'Call Bulk_Email_Membership_Conf.Email_Membership_Conf

If Day(Now()) <= 7 Or (Day(Now()) >= 15 And Day(Now()) <= 22) Then
    'Call [Module - Membership Breakdown].Membership_Breakdown
    
    Call [Coaching Qualification].Qualifications
    
    DoCmd.RunMacro "Macro - Medical Conditions"
    
    DoCmd.RunMacro "Macro - Email Referees Details"

'DoCmd.RunMacro "Macro - Age Group Coaches"
End If
Restart:
'End

Dim DutyRota_Week1$
Dim DutyRota_Week2$
Dim DutyRota_Week3$

DutyRota_Week1$ = ""
DutyRota_Week2$ = ""
DutyRota_Week3$ = ""

Close ' Close all files

Call Read_Club_Diary(DutyRota_Week1$, DutyRota_Week2$, DutyRota_Week3$)

'If an Age Group has an admin manager the email is sent to the admin manger and .cc'd to the coach.
'If the Age Group doesnt have an admin manager the admin email address is forwarded to the coach.

'Parameters.
'1 Display Name for Age Group - characters must be valid for file names
'2 SQL parameters for search.
'3 To email address.
'4 .CC email address.


'GoTo EndOfProcess:
'Call CreateRegister("Seniors", "AGE_Group = 'Senior'", "simon.p.davies@btconnect.com", "", "", "", "")

'Call CreateRegister("U14s", "AGE_Group = 'U14'", "U14.admin@grfc.co.uk", "U14.coach@grfc.co.uk", DutyRota_Week1$, DutyRota_Week2$, DutyRota_Week3$, SendEmail)
'MsgBox ("End")
'End

Call CreateRegister("Micros", "AGE_Group = 'Micros'", "micros.admin@grfc.co.uk", "micros.coach@grfc.co.uk", DutyRota_Week1$, DutyRota_Week2$, DutyRota_Week3$, SendEmail)
Call CreateRegister("U6s", "AGE_Group = 'U6'", "U6.admin@grfc.co.uk", "U6.coach@grfc.co.uk", DutyRota_Week1$, DutyRota_Week2$, DutyRota_Week3$, SendEmail)
Call CreateRegister("U7s", "AGE_Group = 'U7'", "U7.admin@grfc.co.uk", "U7.coach@grfc.co.uk", DutyRota_Week1$, DutyRota_Week2$, DutyRota_Week3$, SendEmail)
Call CreateRegister("U8s", "AGE_Group = 'U8'", "U8.admin@grfc.co.uk", "U8.coach@grfc.co.uk", DutyRota_Week1$, DutyRota_Week2$, DutyRota_Week3$, SendEmail)
Call CreateRegister("U9s", "AGE_Group = 'U9'", "U9.admin@grfc.co.uk", "U9.coach@grfc.co.uk", DutyRota_Week1$, DutyRota_Week2$, DutyRota_Week3$, SendEmail)
Call CreateRegister("U10s", "AGE_Group = 'U10'", "U10.admin@grfc.co.uk", "U10.coach@grfc.co.uk", DutyRota_Week1$, DutyRota_Week2$, DutyRota_Week3$, SendEmail)
Call CreateRegister("U11s", "AGE_Group = 'U11'", "U11.admin@grfc.co.uk", "U11.coach@grfc.co.uk", DutyRota_Week1$, DutyRota_Week2$, DutyRota_Week3$, SendEmail)
Call CreateRegister("U12s", "AGE_Group = 'U12'", "U12.admin@grfc.co.uk", "U12.coach@grfc.co.uk", DutyRota_Week1$, DutyRota_Week2$, DutyRota_Week3$, SendEmail)
Call CreateRegister("U13s", "AGE_Group = 'U13'", "U13.admin@grfc.co.uk", "U13.coach@grfc.co.uk", DutyRota_Week1$, DutyRota_Week2$, DutyRota_Week3$, SendEmail)
Call CreateRegister("U14s", "AGE_Group = 'U14'", "U14.admin@grfc.co.uk", "U14.coach@grfc.co.uk", DutyRota_Week1$, DutyRota_Week2$, DutyRota_Week3$, SendEmail)
Call CreateRegister("U15s", "AGE_Group = 'U15'", "U15.admin@grfc.co.uk", "U15.coach@grfc.co.uk", DutyRota_Week1$, DutyRota_Week2$, DutyRota_Week3$, SendEmail)
Call CreateRegister("U16s", "AGE_Group = 'U16'", "U16.admin@grfc.co.uk", "U16.coach@grfc.co.uk", DutyRota_Week1$, DutyRota_Week2$, DutyRota_Week3$, SendEmail)
Call CreateRegister("U17s", "AGE_Group = 'U17'", "U17.admin@grfc.co.uk", "U17.coach@grfc.co.uk", DutyRota_Week1$, DutyRota_Week2$, DutyRota_Week3$, SendEmail)
'Call CreateRegister("Colts", "AGE_Group = 'Colts'", "colts.admin@grfc.co.uk", "colts.coach@grfc.co.uk", DutyRota_Week1$, DutyRota_Week2$, DutyRota_Week3$, SendEmail)
Call CreateRegister("Girls U15s and U18s", "AGE_Group = 'U15Girls' or AGE_Group = 'U18Girls'", "girls.coach@grfc.co.uk", "", DutyRota_Week1$, DutyRota_Week2$, DutyRota_Week3$, SendEmail)
Call CreateRegister("Seniors", "AGE_Group = 'Senior'", "senior.captains@grfc.co.uk", "senior.chairman@grfc.co.uk", "", "", "", SendEmail)


EndOfProcess:

If SendEmail = True Then
   MsgBox ("The sending out of Registers has been completed.")
Else
   MsgBox ("The Registers has been created but not sent out, they are located in : " & Database_Temp_Directory)
End If



End Sub

Sub CreateRegister(Age_Group$, SQL$, EmailTo$, EmailCC$, DutyRota_Week1$, DutyRota_Week2$, DutyRota_Week3$, SendEmail)

'use for testing
'EmailTo$ = "simon.p.davies@btconnect.com"
'EmailCC$ = "spud72@btconnect.com"

Dim Players_Cnt&
Dim Players_Paid_Cnt&
Dim Players_Form_Cnt&

Dim DutyRota_Week1_Txt$
Dim DutyRota_Week2_Txt$
Dim DutyRota_Week3_Txt$


Dim Age_Group_Shortened As String
Age_Group_Shortened = Trim(UCase(Age_Group$))
If Right(Age_Group_Shortened, 1) = "S" Then
   'Remove character s from the end of the string as stored on the diary withut it.
   Age_Group_Shortened = Left(Age_Group_Shortened, Len(Age_Group_Shortened) - 1)
End If
Dim Data_Parents_Names As String

Players_Cnt& = 0
Players_Paid_Cnt& = 0
Players_Form_Cnt& = 0

Dim AgeGroup_Fixtures(20) As String
Dim AgeGroup_Fixtures_Cnt As Integer
Dim AgeGroup_Email_Addresses(999) As String
Dim AgeGroup_Email_Addresses_Cnt As Integer

Dim Excel_Row As Integer
Excel_Row = 18

Dim Session_Date As String
Dim Session_Date_Seniors As String
Session_Date = Format(DateAdd("d", (7 - (Weekday(Now()))) + 1, Now()), "dd/mm/yyyy")

For AgeGroup_Email_Addresses_Cnt = 0 To 999
   AgeGroup_Email_Addresses(AgeGroup_Email_Addresses_Cnt) = ""
Next

Call Read_Age_Group_Fixtures(AgeGroup_Fixtures, Age_Group$)


RegFile& = 1
EmailFile& = 2
Open Database_Temp_Directory & "Register_" & Age_Group$ & ".html" For Output As #RegFile&
Open Database_Temp_Directory & "Emails_" & Age_Group$ & ".txt" For Output As #EmailFile&


'Write HTML file for report.

Print #RegFile&, "<html>"
Print #RegFile&, "<head>"
If Age_Group$ = "Seniors" Then
   Print #RegFile&, "<title>Guildfordians RFC Register - " & Age_Group$ & " Session : " & Format(DateAdd("d", (6 - (Weekday(Now()))) + 1, Now()), "dd/mm/yy") & "</title>"

   Set XL = CreateObject("Excel.Application")
   'Open Template
   Set ExcelSheet = XL.Workbooks.Open(Database_Template_Directory & "Blank Senior Master Match Fee Sheet v1.4.xls")
   ExcelSheet.Sheets(1).Cells((6), 2).Value = (Format(DateAdd("d", (6 - (Weekday(Now()))) + 1, Now()), "dd/mm/yy"))
   
   Session_Date_Seniors = (Format(DateAdd("d", (6 - (Weekday(Now()))) + 1, Now()), "yyyy_mm_dd"))

    'Delete the previous file if it exists
   If Dir(Database_Temp_Directory & "Senior Match Fee Sheet_" & Session_Date_Seniors & ".xls") <> "" Then
      Kill Database_Temp_Directory & "Senior Match Fee Sheet_" & Session_Date_Seniors & ".xls"
   End If

Else
   Print #RegFile&, "<title>Guildfordians RFC Register - " & Age_Group$ & " Session : " & Format(DateAdd("d", (7 - (Weekday(Now()))) + 1, Now()), "dd/mm/yy") & "</title>"
End If
Print #RegFile&, "</head>"
Print #RegFile&, "<table border=1 width=100% cellspacing=0 cellpadding=0 RULES=ROWS FRAME=BOX>"
Print #RegFile&, "<thead>"
Print #RegFile&, "<tr>"
Print #RegFile&, "<th width=10% align=left valign=bottom BGCOLOR=SILVER><font size=-1>Name</font></th>"
Print #RegFile&, "<th width=1% valign=bottom BGCOLOR=SILVER><font size=-1>F<br>o<br>r<br>m</font></th>"
Print #RegFile&, "<th width=1% valign=bottom BGCOLOR=SILVER><font size=-1>P<br>a<br>i<br>d</font></th>"
If Age_Group$ <> "Seniors" Then
   Print #RegFile&, "<th width=1% valign=bottom BGCOLOR=SILVER><font size=-2>A<br>t<br>t<br>e<br>n<br>d</font></th>"
End If
Print #RegFile&, "<th width=32% align=left valign=bottom BGCOLOR=SILVER><font size=-1><u>Register for : " & Age_Group$ & "</u></font><br><br><br><font size=-1>Contact Number(s)</font></th>"
If Age_Group$ = "Seniors" Then
   Print #RegFile&, "<th width=22% align=left valign=bottom BGCOLOR=SILVER><font size=-1>Match Day<br>" & Format(DateAdd("d", (6 - (Weekday(Now()))) + 1, Now()), "dd/mm/yy") & "<br><br>Email Address</font></th>"
Else
   Print #RegFile&, "<th width=22% align=left valign=bottom BGCOLOR=SILVER><font size=-1>Coaching Session<br>" & Format(DateAdd("d", (7 - (Weekday(Now()))) + 1, Now()), "dd/mm/yy") & "<br><br>Email Address</font></th>"
End If
Print #RegFile&, "<th align=left valign=bottom BGCOLOR=SILVER><font size=-1>RFU No \ DOB</font></th>"
Print #RegFile&, "<th width=15% align=left valign=bottom BGCOLOR=SILVER><font size=-1>Known Medical Conditions</font></th>"
Print #RegFile&, "</tr>"
Print #RegFile&, "</thead>"


Dim rst As DAO.Recordset
Dim db As DAO.Database
Dim hold_alrgy As String

Set db = CurrentDb


Debug.Print "SELECT * from Q_Registers Where " & SQL$ & " Or Also_Playing_Senior_Rugby = -1"
'Authorised_To_Play_Senior_Rugby
If Age_Group$ = "Seniors" Then
   Set rst = db.OpenRecordset("SELECT * from Q_Registers Where " & SQL$ & " Or Also_Playing_Senior_Rugby = -1")
Else
   Set rst = db.OpenRecordset("SELECT * from Q_Registers Where " & SQL$)
End If

'Q_Coaches_Contact_List
AAA:
If rst.BOF Then
   'No results returned
   GoTo NoRecs:
Else
rst.MoveFirst
End If

'rst.MoveFirst

Dim BirthDate_Alert_Str As String
Dim BirthDate_Alert_Dt As Date
Dim Birthday_Date_Diff As Long
Dim Data_Senior_Match_Fees_Paid As Currency
Dim Data_Senior_Match_Fees_Due As Currency
Dim Data_Student_Type As String
Dim Data_Also_Playing_Senior_Rugby As Integer
Dim Data_Comment As String


'GoTo AAA:
Do While Not rst.EOF

    Players_Cnt& = Players_Cnt& + 1
    Data_Parents_Names = ""
    DetailsNeedAttn$ = ""
    Data_Comment = ""
    Birthday_Date_Diff = 0
    Data_Senior_Match_Fees_Paid = 0
    Data_Senior_Match_Fees_Due = 0
    
    Data_Surname = rst("Surname").Value
    Data_First_Name = Trim(rst("First_Name").Value)
    Data_Home_Phone = Trim(rst("Home_Phone").Value)
    Data_Emergency_Contact_Phone = Trim(rst("Emergency_Contact_Phone").Value)
    Data_GMRFC_Form_Date = rst("GMRFC_Form_Date").Value
    Data_Subscription_Date = rst("Subscription_Date").Value
    Data_Email = Trim(rst("Email").Value)
    Data_2nd_EMail = Trim(rst("2nd E-mail").Value)
    Data_Medical_Condition = Trim(rst("Medical_Condition").Value)
    'Data_Student_Type = Trim(rst("Student_Membership").Value)
    Data_Also_Playing_Senior_Rugby = rst("Also_Playing_Senior_Rugby").Value
    'Data_RFU_Number = Trim(rst("RFU_Number").Value)
    
    If IsNull(rst("SumOfMatchFeePaid").Value) = True Then
       Data_Senior_Match_Fees_Paid = 0
    Else
       Data_Senior_Match_Fees_Paid = rst("SumOfMatchFeePaid").Value
    End If
    
    If IsNull(rst("SumOfMatchFeeDue").Value) = True Then
       Data_Senior_Match_Fees_Due = 0
    Else
       Data_Senior_Match_Fees_Due = rst("SumOfMatchFeeDue").Value
    End If
    
    If IsNull(rst("Student_Membership").Value) = True Then
        Data_Student_Type = ""
    Else
        Data_Student_Type = rst("Student_Membership").Value
    End If
    
    If IsNull(rst("Birth_Date").Value) = True Then
       Data_DOB = ""
    Else
       Data_DOB = Trim(rst("Birth_Date").Value)
       If Data_DOB <> "" Then
          BirthDate_Alert_Str = Data_DOB
          BirthDate_Alert_Str = Left(BirthDate_Alert_Str, 6) & Year(Now())
          If Left(BirthDate_Alert_Str, 6) = "29/02/" Then
             BirthDate_Alert_Str = "28/02/" & Mid(BirthDate_Alert_Str, 7)
          End If
          Data_DOB = Format(Data_DOB, "dd/mm/yy")
          
          If Age_Group$ = "Seniors" Then
             Birthday_Date_Diff = DateDiff("Y", Session_Date, Data_DOB)
             If Birthday_Date_Diff = 17 Then
                DetailsNeedAttn$ = DetailsNeedAttn$ & "Information - Player is only 17 years old.<br>"
             End If
          End If
          
          Birthday_Date_Diff = DateDiff("d", Session_Date, BirthDate_Alert_Str)
          
          If Birthday_Date_Diff >= -10 And Birthday_Date_Diff <= 10 Then
             'Recent \ up coming birthday
             Data_DOB = "<b>" & Data_DOB & "</b>"
          End If
       End If
    End If
          
    If IsNull(rst("RFU_Number").Value) = True Then
       Data_RFU_Number = ""
    Else
       Data_RFU_Number = Trim(rst("RFU_Number").Value)
    End If
    
    'Data_Parents_Names = Trim(rst("Parents_Forename").Value)
    
    If Data_RFU_Number = "" Then
      If Data_DOB <> "" Then
         Data_RFU_Number = Data_DOB
      Else
         Data_RFU_Number = "&nbsp"
      End If
    Else
      If Data_DOB = "" Then
         'Just display RFU number
      Else
         Data_RFU_Number = Data_RFU_Number & " - " & Data_DOB
      End If
    End If
      
    If Age_Group$ = "Seniors" Then
      Data_Parents_Names = ""
    Else
      If IsNull(rst("Parents_Forename")) = True Then
         Data_Parents_Names = ""
      Else
         Data_Parents_Names = " (" & Trim(rst("Parents_Forename")) & ")"
      End If
    End If
    
    If Data_Medical_Condition <> "None" Then
      Data_Medical_Condition = "<b>" & Data_Medical_Condition & "</b>"
    End If
    
    Print #RegFile&, "<tr>"
    Print #RegFile&, "<td width=10% valign=top><font size=-2>" & Data_First_Name & "&nbsp;" & Data_Surname & "</font></td>"
    
    
    If IsNull(Data_GMRFC_Form_Date) = False Then
      Players_Form_Cnt& = Players_Form_Cnt& + 1
      Print #RegFile&, "<td width=1% valign=top><font size=-2><INPUT TYPE=CHECKBOX NAME=GFORM VALUE=COMP CHECKED=True ></font></td>"
    Else
      Print #RegFile&, "<td width=1% valign=top><font size=-2><INPUT TYPE=CHECKBOX NAME=GFORM VALUE=COMP ></font></td>"
      'No Form, if they have attended they must complete a form
      If rst("Times Attended").Value > 0 Then
         DetailsNeedAttn$ = DetailsNeedAttn$ & "The above person has attended but has not completed a form. Attended " & Trim(Str$(rst("Times Attended").Value)) & " times.<br>"
      End If
    End If
    
    If IsNull(Data_Subscription_Date) = False Then
      Players_Paid_Cnt& = Players_Paid_Cnt& + 1
      Print #RegFile&, "<td width=1% valign=top><font size=-2><INPUT TYPE=CHECKBOX NAME=SUBS VALUE=PAID CHECKED=True ></font></td>"
    Else
      Print #RegFile&, "<td width=1% valign=top><font size=-2><INPUT TYPE=CHECKBOX NAME=SUBS VALUE=PAID ></font></td>"
    End If
    
    If Age_Group$ <> "Seniors" Then
      Print #RegFile&, "<td width=1% valign=top><INPUT TYPE=CHECKBOX NAME=ATTEND VALUE=ATTEND></td>"
    Else
        'Seniors
    
        If Data_Student_Type <> "" Then
           If Data_Student_Type <> "" Then
              Data_Comment = Data_Student_Type
           End If
        Else
           If Data_Also_Playing_Senior_Rugby = -1 Then
              Data_Comment = "Junior Member"
           End If
        End If
         
        Excel_Cell = "A" & Trim(Str(Excel_Row))
        ExcelSheet.Sheets(1).Cells((Excel_Row), 1).Value = (Data_First_Name & " " & Data_Surname)
          
          If IsNull(Data_Subscription_Date) = False Then
            'membership paid
                    
            If rst("Payment_Method").Value = "Pay as You Play" Or rst("Payment_Method").Value = "Standing Order" Then
                ExcelSheet.Sheets(1).Cells((Excel_Row), 7).Value = rst("Payment_Method").Value
            Else
                'Lump sum paid - may be student rate
                If rst("Payment").Value >= 80 Or (rst("Payment_Method").Value <> "Part Payment" And rst("Payment_Method").Value <> "") Then
                   ExcelSheet.Sheets(1).Cells((Excel_Row), 7).Value = "Paid no match fees"
                End If
            End If
        Else
           'Null not paid
           If IsNull(rst("LastSeasonAttended").Value) = True Then
              'New member this season
              If rst("Times Attended").Value >= 3 Then
                 'Played 3 games - membership owed
                 ExcelSheet.Sheets(1).Cells((Excel_Row), 7).Value = "Due !!"
              Else
                 ExcelSheet.Sheets(1).Cells((Excel_Row), 7).Value = " "
              End If
           Else
              'Previous member
              If rst("Times Attended").Value > 1 Then
                 'Played more than 1 game played & were a previous member
                 ExcelSheet.Sheets(1).Cells((Excel_Row), 7).Value = "Due !!"
              Else
                 ExcelSheet.Sheets(1).Cells((Excel_Row), 7).Value = " "
              End If
           End If
        End If
      
        If Data_Senior_Match_Fees_Paid = Data_Senior_Match_Fees_Due Then
           'Match fees up todate
           ExcelSheet.Sheets(1).Cells((Excel_Row), 6).Value = Data_Comment
        Else
        'Debug.Print Data_Senior_Match_Fees_Paid
          'Debug.Print Data_Senior_Match_Fees_Due
          'Debug.Print Format((Data_Senior_Match_Fees_Paid - Data_Senior_Match_Fees_Due), "Currency")
          
             If Data_Senior_Match_Fees_Paid > Data_Senior_Match_Fees_Due Then
                   'Debug.Print "Match Fee Bal : " & Format((Data_Senior_Match_Fees_Paid - Data_Senior_Match_Fees_Due), "Currency") & " ( in Credit ) "
                   ExcelSheet.Sheets(1).Cells((Excel_Row), 6).Value = "Match Fee Bal : " & Format((Data_Senior_Match_Fees_Paid - Data_Senior_Match_Fees_Due), "Currency") & " (Credit) " & Data_Comment
             Else
                   ExcelSheet.Sheets(1).Cells((Excel_Row), 6).Value = "Match Fee Bal : " & Format((Data_Senior_Match_Fees_Paid - Data_Senior_Match_Fees_Due), "Currency") & " (Debt) " & Data_Comment
             End If
        End If
    
        Excel_Row = Excel_Row + 1
    End If
       
    If rst("Email1Error").Value = True Or rst("Email2Error").Value = True Or IsNull(Data_Subscription_Date) = True Then
      If rst("Email1Error").Value = True Then
          DetailsNeedAttn$ = DetailsNeedAttn$ & "1st Email address is rejecting - please confirm the above email address.<br>"
      End If
      If rst("Email2Error").Value = True Then
          DetailsNeedAttn$ = DetailsNeedAttn$ & "2nd Email address is rejecting - please confirm the above email address.<br>"
      End If
      
      If IsNull(Data_Subscription_Date) = True Then
         'Temp member - check if membership fee is due
         If IsNull(rst("LastSeasonAttended").Value) = True Then
            'Not a previous member - new member this year
            If rst("Times Attended").Value > 2 Then
               DetailsNeedAttn$ = DetailsNeedAttn$ & "The above person is a New Member and has now completed their 3 Trial Sessions, their Membership Fee is now Due. Attended " & Trim(Str$(rst("Times Attended").Value)) & " times.<br>"
            End If
         Else
            'Previous member
            If rst("Times Attended").Value > 1 Then
               DetailsNeedAttn$ = DetailsNeedAttn$ & "The above person is a Previous Member and their Membership Fee is now Due. Attended " & Trim(Str$(rst("Times Attended").Value)) & " times.<br>"
            End If
         End If
      End If
   End If

   If Age_Group$ = "Seniors" Then
      If Data_Home_Phone <> "" And Data_Emergency_Contact_Phone <> "" Then
         Print #RegFile&, "<td width=32% valign=top><font size=-2>" & Data_Home_Phone & " <b>Emerg</b> " & Data_Emergency_Contact_Phone & "</font></td>"
      Else
         If Len(Data_Emergency_Contact_Phone) > 10 Then
            Print #RegFile&, "<td width=32%><font size=-2>" & "<b>Emerg</b> " & Data_Emergency_Contact_Phone & "&nbsp;" & "</font></td>"
         Else
            Print #RegFile&, "<td width=32% valign=top><font size=-2>" & Data_Home_Phone & "&nbsp;" & "</font></td>"
            DetailsNeedAttn$ = DetailsNeedAttn$ & "No Emergency Contact Name and Number.<br>"

         End If
      End If
   Else
      If Data_Home_Phone <> "" And Data_Emergency_Contact_Phone <> "" Then
         Print #RegFile&, "<td width=32% valign=top><font size=-2>" & Data_Home_Phone & " / " & Data_Emergency_Contact_Phone & Data_Parents_Names & "</font></td>"
      Else
         Print #RegFile&, "<td width=32% valign=top><font size=-2>" & Data_Home_Phone & Data_Emergency_Contact_Phone & "&nbsp;" & Data_Parents_Names & "</font></td>"
      End If
   End If
   
   If Data_Email <> "" And Data_2nd_EMail <> "" Then
      Print #RegFile&, "<td width=22% valign=top><font size=-2>" & Data_Email & "<br>" & Data_2nd_EMail & "</font></td>"
   Else
      Print #RegFile&, "<td width=22% valign=top><font size=-2>" & Data_Email & "&nbsp;" & "</font></td>"
   End If
   'Print #RegFile&, "<td width=12%><font size=-2>" & Data_RFU_Number & "&nbsp;" & "</font></td>"
   Print #RegFile&, "<td valign=top><font size=-2>" & Data_RFU_Number & "</font></td>"

   Print #RegFile&, "<td width=15% valign=top><font size=-2>" & Data_Medical_Condition & "</font></td>"

   'Amended 16th July to prevent duplicate email addresses appearing in the email list.
   If Data_Email <> "" Then
      For AgeGroup_Email_Addresses_Cnt = 0 To 999
         If AgeGroup_Email_Addresses(AgeGroup_Email_Addresses_Cnt) = Data_Email Then
            'Email address already record, do not add to list again
            Exit For
         Else
            If AgeGroup_Email_Addresses(AgeGroup_Email_Addresses_Cnt) = "" Then
               'All the populated array elements have been searched, therefore this email address can't exist in the array so print it on the list.
               AgeGroup_Email_Addresses(AgeGroup_Email_Addresses_Cnt) = Data_Email
               Print #EmailFile&, Data_Email & ";"
               Exit For
            End If
         End If
      Next
   End If
   If Data_2nd_EMail <> "" Then
      For AgeGroup_Email_Addresses_Cnt = 0 To 999
         If AgeGroup_Email_Addresses(AgeGroup_Email_Addresses_Cnt) = Data_2nd_EMail Then
            'Email address already record, do not add to list again
            Exit For
         Else
            If AgeGroup_Email_Addresses(AgeGroup_Email_Addresses_Cnt) = "" Then
               'All the populated array elements have been searched, therefore this email address can't exist in the array so print it on the list.
               AgeGroup_Email_Addresses(AgeGroup_Email_Addresses_Cnt) = Data_2nd_EMail
               Print #EmailFile&, Data_2nd_EMail & ";"
               Exit For
            End If
         End If
      Next
   End If

   Print #RegFile&, "</tr>"

  
   
   If DetailsNeedAttn$ > "" Then
      Print #RegFile&, "<tr>"
      
      'Seniors dont have the attend field so needs to span 1 less columns
      If Age_Group$ <> "Seniors" Then
         Print #RegFile&, "<td colspan=8 valign=top><font size=-2>Action needed for above player : <b>" & DetailsNeedAttn$ & "</font></b></td>"
      Else
         Print #RegFile&, "<td colspan=7 valign=top><font size=-2>Action needed for above player : <b>" & DetailsNeedAttn$ & "</font></b></td>"
      End If
      Print #RegFile&, "</tr>"
   End If
   
  rst.MoveNext
Loop

NoRecs:

rst.Close


Print #RegFile&, "</table>"

Print #RegFile&, "<table width=100%>"
Print #RegFile&, "<tr>"
Print #RegFile&, "<td width=25%><b><font size=-1>Number of Players</b></font></td>"
Print #RegFile&, "<td width=8% align=left><b><font size=-1>" & Str$(Players_Cnt&) & "</b></font></td>"
Print #RegFile&, "<td width=25%><b><font size=-1>Forms Completed</b></font></td>"
Print #RegFile&, "<td width=8% align=left><b><font size=-1>" & Str$(Players_Form_Cnt&) & "</b></font></td>"
Print #RegFile&, "<td width=25%><b><font size=-1>Full Members (Paid)</b></font></td>"
Print #RegFile&, "<td width=8% align=left><b><font size=-1>" & Str$(Players_Paid_Cnt&) & "</b></font></td>"
Print #RegFile&, "</tr>"

Print #RegFile&, "<tr>"
Print #RegFile&, "<td width=25% >&nbsp;</td>"
Print #RegFile&, "<td width=8% >&nbsp;</td>"
Print #RegFile&, "<td width=25%><b><font size=-1>Forms Required</b></font></td>"
Print #RegFile&, "<td width=8% align=left><b><font size=-1>" & Str$(Players_Cnt& - Players_Form_Cnt&) & "</b></font></td>"
Print #RegFile&, "<td width=25%><b><font size=-1>Temporary Members</b></font></td>"
Print #RegFile&, "<td width=8% align=left><b><font size=-1>" & Str$(Players_Cnt& - Players_Paid_Cnt&) & "</b></font></td>"
Print #RegFile&, "</b></tr>"

Print #RegFile&, "</table>"
Print #RegFile&, "<br>"

'Now look for email addresses of people who help with the Age Group ( coache etc ) to ensure that their email address
'is included in the email file.

Set rst = db.OpenRecordset("SELECT * from [Q_Query Qualifications] Where " & SQL$)
If rst.BOF Then
   'No results returned
   
Else
   rst.MoveFirst
   Do While Not rst.EOF
      Data_Email = Trim(rst("Email").Value)
      Data_2nd_EMail = Trim(rst("2nd E-mail").Value)

   
      If Data_Email <> "" Then
         For AgeGroup_Email_Addresses_Cnt = 0 To 999
            If AgeGroup_Email_Addresses(AgeGroup_Email_Addresses_Cnt) = Data_Email Then
               'Email address already record, do not add to list again
               Exit For
            Else
               If AgeGroup_Email_Addresses(AgeGroup_Email_Addresses_Cnt) = "" Then
                  'All the populated array elements have been searched, therefore this email address can't exist in the array so print it on the list.
                  AgeGroup_Email_Addresses(AgeGroup_Email_Addresses_Cnt) = Data_Email
                  Print #EmailFile&, Data_Email & ";"
                  Exit For
               End If
            End If
         Next
      End If
      
      'Amended 11/01/2013 to exclude 2nd email address for coaches in case the coach is coaching out of age group & dont need their partner to be informed.
      'If Data_2nd_EMail <> "" Then
      '   For AgeGroup_Email_Addresses_Cnt = 0 To 999
      '      If AgeGroup_Email_Addresses(AgeGroup_Email_Addresses_Cnt) = Data_2nd_EMail Then
      '         'Email address already record, do not add to list again
      '         Exit For
      '      Else
      '         If AgeGroup_Email_Addresses(AgeGroup_Email_Addresses_Cnt) = "" Then
      '            'All the populated array elements have been searched, therefore this email address can't exist in the array so print it on the list.
      '            AgeGroup_Email_Addresses(AgeGroup_Email_Addresses_Cnt) = Data_2nd_EMail
      '            Print #EmailFile&, Data_2nd_EMail & ";"
      '            Exit For
      '         End If
      '      End If
      '   Next
      'End If

      rst.MoveNext
   Loop
End If

rst.Close
Close (EmailFile&)



If Age_Group$ = "Seniors" Then
   'Extract Supporters email addresses
   EmailFile& = FreeFile
   Open Database_Temp_Directory & "Emails_Senior_Supporters.txt" For Output As #EmailFile&
   
   
   'Clear array
   For AgeGroup_Email_Addresses_Cnt = 0 To 999
      AgeGroup_Email_Addresses(AgeGroup_Email_Addresses_Cnt) = ""
   Next

   Set rst = db.OpenRecordset("SELECT Email, [2nd E-mail], Email1SeniorNewsletter, Email2SeniorNewsletter From Contacts WHERE (Contacts.Email1SeniorNewsletter = Yes or Contacts.Email2SeniorNewsletter = Yes) AND (Contacts.Membership_Type <=10) ")
   
   If rst.BOF Then
      'No results returned
   Else
      rst.MoveFirst
      Do While Not rst.EOF
         Data_Email = Trim(rst("Email").Value)
         Data_2nd_EMail = Trim(rst("2nd E-mail").Value)
   
      
         If Data_Email <> "" And rst("Email1SeniorNewsletter").Value = True Then
            'Email address is not blank and senior newsletter is wanted.
            For AgeGroup_Email_Addresses_Cnt = 0 To 999
               If AgeGroup_Email_Addresses(AgeGroup_Email_Addresses_Cnt) = Data_Email Then
                  'Email address already record, do not add to list again
                  Exit For
               Else
                  If AgeGroup_Email_Addresses(AgeGroup_Email_Addresses_Cnt) = "" Then
                     'All the populated array elements have been searched, therefore this email address can't exist in the array so print it on the list.
                     AgeGroup_Email_Addresses(AgeGroup_Email_Addresses_Cnt) = Data_Email
                     Print #EmailFile&, Data_Email & ";"
                     Exit For
                  End If
               End If
            Next
         End If
         
         If Data_2nd_EMail <> "" And rst("Email2SeniorNewsletter").Value = True Then
            'Email address is not blank and senior newsletter is wanted.
            For AgeGroup_Email_Addresses_Cnt = 0 To 999
               If AgeGroup_Email_Addresses(AgeGroup_Email_Addresses_Cnt) = Data_2nd_EMail Then
                  'Email address already record, do not add to list again
                  Exit For
               Else
                  If AgeGroup_Email_Addresses(AgeGroup_Email_Addresses_Cnt) = "" Then
                     'All the populated array elements have been searched, therefore this email address can't exist in the array so print it on the list.
                     AgeGroup_Email_Addresses(AgeGroup_Email_Addresses_Cnt) = Data_2nd_EMail
                     Print #EmailFile&, Data_2nd_EMail & ";"
                     Exit For
                  End If
               End If
            Next
         End If
   
         rst.MoveNext
      Loop
   End If
   
   rst.Close
   Close (EmailFile&)
End If

Set rst = Nothing

If Age_Group$ = "Seniors" Then
   'No Duty rota or look ahead needed
   'Close Spreadsheet
   ExcelSheet.Application.DisplayAlerts = False
   ExcelSheet.SaveAs Database_Temp_Directory & "Senior Match Fee Sheet_" & Session_Date_Seniors & ".xls"
   ExcelSheet.Application.DisplayAlerts = True
   ExcelSheet.Application.Quit
Else
   Print #RegFile&, "<b><u>Club House Duty Rota</u><font size=-1></b><br>"
   
   '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
   ' Duty Rota
   '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
   
   'Dim Duty_Rota_Header_Printed As Boolean
   'Duty_Rota_Header_Printed = False
   
   If InStr(DutyRota_Week1$, " Age Group : ") > 0 Then
      'Age Group found for this week.
      
      If InStr(DutyRota_Week1$, Age_Group_Shortened) > 0 Or InStr(DutyRota_Week1$, "ALL") > 0 Or ((Age_Group_Shortened = "MICROS" Or Age_Group_Shortened = "U6" Or Age_Group_Shortened = "U7" Or Age_Group_Shortened = "U8" Or Age_Group_Shortened = "U9" Or Age_Group_Shortened = "U10" Or Age_Group_Shortened = "U11" Or Age_Group_Shortened = "U12") And InStr(DutyRota_Week1$, "ALL MINIS") > 0) Then
         Print #RegFile&, "<b><u>" & DutyRota_Week1$ & "</u></b> - Your Age Group is on Duty.<br>"
         DutyRota_Week1_Txt$ = DutyRota_Week1$ & " - Your Age Group is on Duty."
         
         Call SendAgeGroupDutyRotaEmail(DutyRota_Week1$, Age_Group$, SQL$, EmailTo$, EmailCC$, SendEmail)
      Else
         Print #RegFile&, DutyRota_Week1$ & "<br>"
         DutyRota_Week1_Txt$ = DutyRota_Week1$
      End If
   End If
   
   If InStr(DutyRota_Week2$, " Age Group : ") > 0 Then
      'Age Group found for this week.
      If (InStr(DutyRota_Week2$, Age_Group_Shortened) > 0 Or InStr(DutyRota_Week2$, "ALL") > 0) Or ((Age_Group_Shortened = "MICROS" Or Age_Group_Shortened = "U6" Or Age_Group_Shortened = "U7" Or Age_Group_Shortened = "U8" Or Age_Group_Shortened = "U9" Or Age_Group_Shortened = "U10" Or Age_Group_Shortened = "U11" Or Age_Group_Shortened = "U12") And InStr(DutyRota_Week2$, "ALL MINIS") > 0) Then
         Print #RegFile&, "<b><u>" & DutyRota_Week2$ & "</u></b> - Your Age Group is on Duty.<br>"
         DutyRota_Week2_Txt$ = DutyRota_Week2$ & " - Your Age Group is on Duty."
      
         Call SendAgeGroupDutyRotaEmail(DutyRota_Week2$, Age_Group$, SQL$, EmailTo$, EmailCC$, SendEmail)
      Else
         Print #RegFile&, DutyRota_Week2$ & "<br>"
         DutyRota_Week2_Txt$ = DutyRota_Week2$
      End If
   End If
   
   If InStr(DutyRota_Week3$, " Age Group : ") > 0 Then
      'Age Group found for this week.
      If InStr(DutyRota_Week3$, Age_Group_Shortened) > 0 Or InStr(DutyRota_Week3$, "ALL") > 0 Or ((Age_Group_Shortened = "MICROS" Or Age_Group_Shortened = "U6" Or Age_Group_Shortened = "U7" Or Age_Group_Shortened = "U8" Or Age_Group_Shortened = "U9" Or Age_Group_Shortened = "U10" Or Age_Group_Shortened = "U11" Or Age_Group_Shortened = "U12") And InStr(DutyRota_Week3$, "ALL MINIS") > 0) Then
         Print #RegFile&, "<b><u>" & DutyRota_Week3$ & "</u></b> - Your Age Group is on Duty.<br>"
         DutyRota_Week3_Txt$ = DutyRota_Week3$ & " - Your Age Group is on Duty."
         
         If SendEmail = True Then
            Call SendAgeGroupDutyRotaEmail(DutyRota_Week3$, Age_Group$, SQL$, EmailTo$, EmailCC$, SendEmail)
         End If
      Else
         Print #RegFile&, DutyRota_Week3$ & "<br>"
         DutyRota_Week3_Txt$ = DutyRota_Week3$
      End If
   End If
   Print #RegFile&, "<br></font size>"
   
   If AgeGroup_Fixtures(0) <> "" Then
      Print #RegFile&, "<b><u>Age Group look ahead</u></b><font size=-1><br>"
   
      For AgeGroup_Fixtures_Cnt = 0 To 15
         If AgeGroup_Fixtures(AgeGroup_Fixtures_Cnt) <> "" Then
            Print #RegFile&, AgeGroup_Fixtures(AgeGroup_Fixtures_Cnt) & "<br>"
         End If
      Next
      Print #RegFile&, "</font><br>"
   End If
End If

Print #RegFile&, "<b>*** All Data is in the Strictest Confidence ***</b><font size=-1>"
Print #RegFile&, "<br>Anyone attending who isn't shown as having Completed a Registration Form must do so before they train or play."
'Print #RegFile&, "<br>If a player who has not paid their membership fee is no longer attending please indicate this on the register so that we do not chase them for their membership."
'Print #RegFile&, "<br>Any Highlighted details need attention. Please mark any updated details on the register so that the clubs records can be corrected."
If Age_Group$ = "Seniors" Then
  ' Print #RegFile&, "<br><br>Please put the Completed Register in the Folder in the Kitchen - Many Thanks"
   Print #RegFile&, "<br>If a player who has not paid their membership fee is no longer attending please advise our <b>membership sec *</b> so that we do not chase them for their membership."
   Print #RegFile&, "<br><b>Any highlighted details need attention.</b> Please advise our <b>membership sec *</b>of any missing information so that the details on the register can be updated."
   Print #RegFile&, "<br><b>*</b> Membership Sec : email membership@grfc.co.uk"
Else
   Print #RegFile&, "<br>If a player who has not paid their membership fee is no longer attending please indicate this on the register so that we do not chase them for their membership."
   Print #RegFile&, "<br>Any highlighted details need attention. Please mark any updated details on the register so that the clubs records can be corrected."
   Print #RegFile&, "<br><br>Please put the Completed Register (and any membership forms / payments etc) in the post box behind the door in kit room at the end of the coaching session or email me relevant info - Many Thanks"
End If
Print #RegFile&, "</font>"
Print #RegFile&, "</body>"
Print #RegFile&, "</html>"
Close #RegFile&


If SendEmail = True Then
   Call Email_Register(EmailTo$, EmailCC$, Age_Group$, DutyRota_Week1_Txt$, DutyRota_Week2_Txt$, DutyRota_Week3_Txt$, AgeGroup_Fixtures)
Else
   'Do not send emails
End If


End Sub

Private Sub Email_Register(EmailTo$, EmailCC$, Age_Group$, ByVal DutyRota_Week1_Txt$, ByVal DutyRota_Week2_Txt$, ByVal DutyRota_Week3_Txt$, ByRef AgeGroup_Fixtures)

'
' MS Outlook API VBA Send Email example programming code
'
Dim Mess_body As String

Dim appOutlook As Outlook.Application
Dim MailOutLook As Outlook.MailItem
Set appOutlook = CreateObject("Outlook.Application", "localhost")
Set MailOutLook = appOutlook.CreateItem(olMailItem)

With MailOutLook
   .To = EmailTo$
   If EmailCC$ <> "" Then
      .CC = EmailCC$
   End If
 
   If Age_Group$ <> "Seniors" Then
      .Subject = "Guildfordians RFC Register - Age Group : " & Age_Group$ & " - Coaching Session : " & Format(DateAdd("d", (7 - (Weekday(Now()))) + 1, Now()), "dd mmmm yyyy")

      Mess_body = "Please find attached the Register for your Age Groups next session." & vbCrLf & vbCrLf & _
      "Please write the names of any new players on the Register." & vbCrLf & _
      "If any players no longer attends or their details need updating please note this on the Register." & vbCrLf & vbCrLf

      Mess_body = Mess_body & "Please place the completed Register (and any membership forms / payments etc) in the post box behind the door in kit room at the end of the coaching session or email me relevant info." & vbCrLf & vbCrLf
   Else
      'Seniors
      .Subject = "Guildfordians RFC Register - Age Group : " & Age_Group$ & " - Match Day : " & Format(DateAdd("d", (6 - (Weekday(Now()))) + 1, Now()), "dd mmmm yyyy")

      Mess_body = "Please find attached the Register for your Age Groups next session." & vbCrLf & vbCrLf & _
         "Please email me the names of any new players, players who longer attends or any amended details." & vbCrLf & vbCrLf
   End If
   
    Mess_body = Mess_body & "Please also find attached a list of email addresses for your Age Group, the list can be copied and pasted in to your Email tool to save you having to maintain your own list." & _
   " Whenever an email address is updated on the club records or a new member joins it will automatically be added to the list." & vbCrLf & vbCrLf
   If Age_Group$ <> "Seniors" Then
      Mess_body = Mess_body & "Club House Duty Rota " & vbCrLf$ & _
      DutyRota_Week1_Txt$ & vbCrLf$ & _
      DutyRota_Week2_Txt$ & vbCrLf$ & _
      DutyRota_Week3_Txt$ & vbCrLf & vbCrLf
   
   
      'Add Fixtures to email.
      If AgeGroup_Fixtures(0) <> "" Then
         Mess_body = Mess_body & "Age Group look ahead" & vbCrLf
      
         For AgeGroup_Fixtures_Cnt = 0 To 15
            If AgeGroup_Fixtures(AgeGroup_Fixtures_Cnt) <> "" Then
               Mess_body = Mess_body & AgeGroup_Fixtures(AgeGroup_Fixtures_Cnt) & vbCrLf
            End If
         Next
         Mess_body = Mess_body
      End If
   End If
   
   
   If Age_Group$ = "Seniors" Then
      Mess_body = Mess_body & "Supporters email addresses are also attached."
   End If
   
   Mess_body = Mess_body & vbCrLf & vbCrLf & "Many thanks" & vbCrLf & _
   "Tracy Davies" & vbCrLf & _
   "Membership Secretary" & vbCrLf & vbCrLf & _
   " ** Data is in Strictest Confidence **" & vbCrLf & vbCrLf
   
   If Age_Group$ <> "Seniors" Then
      Mess_body = Mess_body & "Instructions on how to complete the register electronically " & vbCrLf & _
      "Open the .html attachment containing the register." & vbCrLf & _
      "Highlight the register and copy all of the entries." & vbCrLf & _
      "Open a new MS Word document ( other document types may work but I cant test them ) " & vbCrLf & _
      "Paste the register into the Word document." & vbCrLf & _
      "Tick the boxes to show who attended." & vbCrLf & _
      "Save the document." & vbCrLf & _
      "Email the document to this email address."
   End If

   
   
   
   .body = Mess_body
   
   'If Left(Me.Mail_Attachment_Path, 1) <> "<" Then
   .Attachments.Add (Database_Temp_Directory & "Register_" & Age_Group$ & ".html")
   .Attachments.Add (Database_Temp_Directory & "Emails_" & Age_Group$ & ".txt")
   
   If Age_Group$ = "Seniors" Then
      
      Dim Session_Date_Seniors As String
      Session_Date_Seniors = (Format(DateAdd("d", (6 - (Weekday(Now()))) + 1, Now()), "yyyy_mm_dd"))
   
      'Also attach match fees spreadsheet
      .Attachments.Add (Database_Temp_Directory & "Senior Match Fee Sheet_" & Session_Date_Seniors & ".xls")
      
      'Also attach supporters emails addresses
      .Attachments.Add (Database_Temp_Directory & "Emails_Senior_Supporters.txt")
   End If
   .Send
   
End With


If Age_Group$ = "Seniors" Then
   'Send file of email addresses to the Google mail account.
   'Dim appOutlook As Outlook.Application
   'Dim MailOutLook As Outlook.MailItem
   Set appOutlook = CreateObject("Outlook.Application", "localhost")
   Set MailOutLook = appOutlook.CreateItem(olMailItem)
   
   With MailOutLook
      .To = "seniorrugby@grfc.co.uk"
      .Subject = "Guildfordians RFC Email List - Age Group : " & Age_Group$ & " - Match Day : " & Format(DateAdd("d", (6 - (Weekday(Now()))) + 1, Now()), "dd mmmm yyyy")
      .Attachments.Add (Database_Temp_Directory & "Emails_" & Age_Group$ & ".txt")
      .Attachments.Add (Database_Temp_Directory & "Emails_Senior_Supporters.txt")

      .body = "Attached is your players and supporters email address list for our email account (seniorrugby@grfc.co.uk)." & vbCrLf & vbCrLf & "Many thanks" & vbCrLf & _
         "Tracy Davies" & vbCrLf & "Membership Secretary" & vbCrLf & vbCrLf & _
         " ** Data is in Strictest Confidence **" & vbCrLf & vbCrLf
      .Send
   End With
End If

End Sub

Sub Read_Club_Diary(ByRef DutyRota_Week1 As String, ByRef DutyRota_Week2 As String, ByRef DutyRota_Week3 As String)

Dim strDirectoryList As String

Dim lInt_FreeFile01 As Integer
Dim lInt_FreeFile02 As Integer
Dim X As Date
Dim Next_Sundays_Date As String

DutyRota_Week1 = ""
DutyRota_Week2 = ""
DutyRota_Week3 = ""

Next_Sundays_Date = Format(DateAdd("d", (7 - (Weekday(Now()))) + 1, Now()), "dd-mmm-yyyy")

'GoTo bye:

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Download database from GMRFC website to the local C Drive using FTP.
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
On Error GoTo Err_Handler

lInt_FreeFile01 = FreeFile

'Delete completion file
If Dir(Database_Temp_Directory & ".out") <> "" Then Kill (Database_Temp_Directory & ".out")

'Delete the pevious copy of the DB if it exists
If Dir(Database_Temp_Directory & "diary.mdb") <> "" Then Kill (Database_Temp_Directory & "diary.mdb")


' Create text file with FTP commands
Open Database_Temp_Directory & "Directory.txt" For Output As #lInt_FreeFile01
Print #lInt_FreeFile01, "open ftp.grfc.co.uk"
Print #lInt_FreeFile01, "grfc.co.uk"
'Print #lInt_FreeFile01, "Stokeb1s0n"; gh1Exfine
Print #lInt_FreeFile01, "gh1Exfine"
Print #lInt_FreeFile01, "cd htdocs/App_Data"
Print #lInt_FreeFile01, "binary"
'Print #lInt_FreeFile01, "send " & ThisWorkbook.Path & "\Picture.gif targetdir/Picture.gif"

' To receive a file, replace the above line with this one
Print #lInt_FreeFile01, "recv grfc.mdb " & Database_Temp_Directory & "diary.mdb"
Print #lInt_FreeFile01, "bye"
Close #lInt_FreeFile01

'' Create Batch program
lInt_FreeFile01 = FreeFile
Open Database_Temp_Directory & "dwnld.bat" For Output As #lInt_FreeFile01
Print #lInt_FreeFile01, "ftp -s:" & Database_Temp_Directory & "Directory.txt"
Print #lInt_FreeFile01, "Echo ""Complete"" > " & Database_Temp_Directory & ".out"
Close #lInt_FreeFile01

Dim rc As Double
'' Invoke Directory List generator
rc = Shell(Database_Temp_Directory & "dwnld.bat", vbNormalFocus)

'Wait for completion file to be written
Do While Dir(Database_Temp_Directory & ".out") = ""
    DoEvents
Loop

'Allow locks to be released to allow the process to continue
X = Now()
Do While DateDiff("n", X, Now()) < 1
Loop

'' Clean up files
If Dir(Database_Temp_Directory & "dwnld.bat") <> "" Then Kill (Database_Temp_Directory & "dwnld.bat")
If Dir(Database_Temp_Directory & ".out") <> "" Then Kill (Database_Temp_Directory & ".out")
'If Dir(strDirectoryList & ".txt") <> "" Then Kill (strDirectoryList & ".txt")

bye:

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Read the Duty Rota for the next 3 Sundays.
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

'Read the access Db.
Dim rst_Dy As DAO.Recordset
Dim db_Dy As DAO.Database
Set db_Dy = OpenDatabase(Database_Temp_Directory & "diary.mdb")

Dim Date1 As String
Dim Date2 As String
Dim Date3 As String

Date1 = Next_Sundays_Date
Date2 = DateAdd("d", 7, Date1)
Date2 = Format(Date2, "dd-mmm-yyyy")
Date3 = DateAdd("d", 14, Date1)
Date3 = Format(Date3, "dd-mmm-yyyy")

DutyRota_Week1 = "Duty Rota : " & Date1
DutyRota_Week2 = "Duty Rota : " & Date2
DutyRota_Week3 = "Duty Rota : " & Date3

Date1 = "#" & Date1 & "#"
Date2 = "#" & Date2 & "#"
Date3 = "#" & Date3 & "#"
'MsgBox (Date1)
'MsgBox (Date2)
'MsgBox (Date3)

'Set rst_Dy = db_Dy.OpenRecordset("SELECT Date as RotaDate, Rota from Diary Where RotaDate = DateValue(" & Chr$(34) & "18-NOV-2007" & Chr$(34) & ")  ")
Set rst_Dy = db_Dy.OpenRecordset("SELECT Date as RotaDate, Rota from Diary Where Date = " & Date1 & " Or Date = " & Date2 & " or Date = " & Date3)

'rst_Dy.MoveFirst
Do While Not rst_Dy.EOF
   If IsNull(rst_Dy("Rota").Value) = False Then
      Data_Rota = rst_Dy("Rota").Value
      Data_Rota = UCase(Trim(Data_Rota))
      If Data_Rota <> "" Then
      'A$ = Format(rst_Dy("RotaDate").Value, "dd-mmm-yyyy")
      'B$ = Mid(Date1, 2, 11)
         If Format(rst_Dy("RotaDate").Value, "dd-mmm-yyyy") = Mid(Date1, 2, 11) Then
            DutyRota_Week1 = DutyRota_Week1 & " Age Group : " & Data_Rota
         End If
         If Format(rst_Dy("RotaDate").Value, "dd-mmm-yyyy") = Mid(Date2, 2, 11) Then
            DutyRota_Week2 = DutyRota_Week2 & " Age Group : " & Data_Rota
         End If
         If Format(rst_Dy("RotaDate").Value, "dd-mmm-yyyy") = Mid(Date3, 2, 11) Then
            DutyRota_Week3 = DutyRota_Week3 & " Age Group : " & Data_Rota
         End If
      End If
   End If
   rst_Dy.MoveNext
Loop

rst_Dy.Close
Set rst_Dy = Nothing
db_Dy.Close
Set db_Dy = Nothing

'MsgBox (DutyRota_Week1)
'MsgBox (DutyRota_Week2)
'MsgBox (DutyRota_Week3)

Exit Sub

Err_Handler:
    MsgBox "Error : " & Err.Number & vbCrLf & "Description : " & Err.Description, vbCritical
    'Resume bye
'bye:
End
End Sub

Sub Read_Age_Group_Fixtures(ByRef AgeGroup_Fixtures, ByVal Age_Group$)

'''''''''''Exit Sub

Dim Next_Sundays_Date As String
Dim AgeGroup_Fixtures_Cnt As Integer
Dim Age_Group_Test$
Dim SQL$

Dim Date1 As String
Dim Date2 As String
Dim Date3 As String

Next_Sundays_Date = Format(DateAdd("d", (7 - (Weekday(Now()))) + 1, Now()), "dd-mmm-yyyy")
AgeGroup_Fixtures_Cnt = 0
SQL$ = ""



Date1 = Next_Sundays_Date
Date3 = DateAdd("d", 23, Date1)
Date3 = Format(Date3, "dd-mmm-yyyy")

Date1 = "#" & Date1 & "#"
Date3 = "#" & Date3 & "#"

GoTo bye:


bye:

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Read the Duty Rota for the next 3 Sundays.
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''




Age_Group_Test$ = UCase(Trim(Age_Group$))
If Left$(Age_Group_Test$, 5) = "GIRLS" Then
   Age_Group_Test$ = "GIRLS"
End If

Select Case Age_Group_Test$
   Case "GIRLS": Exit Sub
   Case "MICROS": Exit Sub
   Case "U6S": Exit Sub
   Case "U7S", "U8S", "U9S", "U10S", "U11S", "U12S": SQL$ = "SELECT Date as FixtureDate, FixtureMinisHA, FixtureMinisDetail from Diary Where Date >= " & Date1 & " and Date <= " & Date3
   Case "U13S": SQL$ = "SELECT Date as FixtureDate, FixtureU13HA, FixtureU13Detail from Diary Where Date >= " & Date1 & " and Date <= " & Date3
   Case "U14S": SQL$ = "SELECT Date as FixtureDate, FixtureU14HA, FixtureU14Detail from Diary Where Date >= " & Date1 & " and Date <= " & Date3
   Case "U15S": SQL$ = "SELECT Date as FixtureDate, FixtureU15HA, FixtureU15Detail from Diary Where Date >= " & Date1 & " and Date <= " & Date3
   Case "U16S": SQL$ = "SELECT Date as FixtureDate, FixtureU16HA, FixtureU16Detail from Diary Where Date >= " & Date1 & " and Date <= " & Date3
   Case "U17S": SQL$ = "SELECT Date as FixtureDate, FixtureU17HA, FixtureU17Detail from Diary Where Date >= " & Date1 & " and Date <= " & Date3

End Select

If SQL$ = "" Then
   'No SQL created
   Exit Sub
End If

Exit Sub

'Read the access Db.
Dim rst_Dy As DAO.Recordset
Dim db_Dy As DAO.Database
Set db_Dy = OpenDatabase(Database_Temp_Directory & "diary.mdb")

Set rst_Dy = db_Dy.OpenRecordset(SQL$)
Do While Not rst_Dy.EOF

   If IsNull(rst_Dy.Fields(2).Value) = False Then
      If Trim(rst_Dy.Fields(2).Value) <> "" Then
         'Fixture Found, load into array
         If AgeGroup_Fixtures_Cnt < 15 Then
            AgeGroup_Fixtures(AgeGroup_Fixtures_Cnt) = rst_Dy.Fields(0).Value & " - " & Trim(rst_Dy.Fields(2).Value)
            If UCase(Trim(rst_Dy.Fields(2).Value)) <> "HOLIDAY" Then
               If Trim(rst_Dy.Fields(1).Value) = "H" Then
                  AgeGroup_Fixtures(AgeGroup_Fixtures_Cnt) = AgeGroup_Fixtures(AgeGroup_Fixtures_Cnt) & " ( Home )"
               End If
               If Trim(rst_Dy.Fields(1).Value) = "A" Then
                  AgeGroup_Fixtures(AgeGroup_Fixtures_Cnt) = AgeGroup_Fixtures(AgeGroup_Fixtures_Cnt) & " ( Away )"
               End If
            End If
            AgeGroup_Fixtures_Cnt = AgeGroup_Fixtures_Cnt + 1
         End If
      End If
   End If
      
   rst_Dy.MoveNext
Loop

rst_Dy.Close
Set rst_Dy = Nothing
db_Dy.Close
Set db_Dy = Nothing

Exit Sub

Err_Handler:
    MsgBox "Error : " & Err.Number & vbCrLf & "Description : " & Err.Description, vbCritical
    Resume bye

End Sub



Sub SendAgeGroupDutyRotaEmail(DutyRota_Week_Details$, Age_Group$, SQL$, EmailTo$, EmailCC$, ByVal SendEmail As Boolean)
'This routine is called if your are on the Duty Rota in the Next 3 weeks.


If SendEmail = False Then
   Exit Sub
End If

Dim Mess_body1 As String

Dim appOutlook1 As Outlook.Application
Dim MailOutLook1 As Outlook.MailItem
Set appOutlook1 = CreateObject("Outlook.Application", "localhost")
Set MailOutLook1 = appOutlook1.CreateItem(olMailItem)

With MailOutLook1
   .To = EmailTo$
   If EmailCC$ <> "" Then
      .CC = EmailCC$ & "; catering@grfc.co.uk"
   Else
      .CC = "catering@grfc.co.uk"
   End If
   .Subject = "Duty Rota Notification - Guildfordians RFC - Age Group : " & Age_Group$
   Mess_body1 = "Your Age Group is due to be on the Duty rota as detailed below." & vbCrLf & vbCrLf & _
   "Club House Duty Rota " & vbCrLf$ & _
   DutyRota_Week_Details$ & vbCrLf$ & vbCrLf$ & _
   "This season the Duty rota has been split : " & vbCrLf$ & _
   "The Minis (U7's to U12's) run the kitchen from 09:30 cooking & serving food until 13:00, at 13:00 the kitchen closes and tidying up in the kitchen and upstairs can begin. When the Mini's have visitors free food is provided for guests and our players." & vbCrLf$ & _
   "The Youth Teams (U13's to U17's) are responsible for feeding their own visiting teams and tidying up the changing rooms, corridors, showers, entrance hall an ensuring that kit has been put away correctly." & vbCrLf$ & vbCrLf$ & _
   "Our Catering manager has produced a document detailing what has to be done each week in the kitchen, this will normally be sent to each age group when it is their turn in the kitchen. Youth teams need to advise our Catering Manager of any food requirements for visitors in advance." & _
   vbCrLf$ & vbCrLf$ & "If you are unable to do the rota on the this date please swap with another age group and notify our Webmaster to update the diary." & vbCrLf & vbCrLf & _
   "Contact Details for the above can be found on : http://www.grfc.co.uk/contacts.asp " & vbCrLf & vbCrLf & _
   "How to use the cooker and cooker hood - please read : http://www.grfc.co.uk/documents/cookerhood.doc "

   
   Mess_body1 = Mess_body1 & "Many thanks" & vbCrLf & _
   "Tracy Davies" & vbCrLf & _
   "Membership Secretary" & vbCrLf & vbCrLf
   
        
    If Age_Group$ <> "Seniors" Then
       Mess_body = Mess_body & "Instructions on how to complete the register electronically " & vbCrLf & _
       "Open the .html attachment containing the register." & vbCrLf & _
       "Highlight the register and Copy all of the entries." & vbCrLf & _
       "Open a new MS Word document ( other document types may work ) and Paste the register into the Word document." & vbCrLf & _
       "Tick the boxes to show who attended." & vbCrLf & _
       "Save the document and Email it to this email address." & vbCrLf & vbCrLf & vbCrLf
    End If
   
   .body = Mess_body1
   .Importance = olImportanceHigh
   .Send
End With

End Sub
