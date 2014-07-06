<%

Set db = Server.CreateObject("ADODB.RecordSet")

adoDatabase = "/App_Data/grfc.mdb"

sqlStr = "select * from SiteSettings"
conStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(adoDatabase) & ";Persist Security Info=False"
db.CursorLocation = adUseClient
db.Open sqlStr, conStr, adLockReadOnly, adCmdTable

db.MoveFirst
alertMessage = db("SiteHeaderMessage")
if alertMessage <> "" then
	alert = 1
end if

db.Close()
%>
