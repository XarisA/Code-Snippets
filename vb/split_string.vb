Function splitStr(col As String, numb As Integer)

DoCmd.SetWarnings off

Dim arrTemp() As String


arrTemp = Split(col, ";")
If numb > UBound(arrTemp) Then
splitStr = " "
Else
splitStr = arrTemp(numb)
End If

End Function