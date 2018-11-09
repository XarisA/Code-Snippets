
Function CJulian2Date(JulDay As Integer, Optional YYYY)
'Translates a 6-digit Julian Date to a normal one
      If IsMissing(YYYY) Then YYYY = Year(Date)
      If Not IsNumeric(YYYY) Or YYYY \ 1 <> YYYY Or YYYY < 100 Or YYYY _
        > 9999 Then Exit Function
      If JulDay > 0 And JulDay < 366 Or JulDay = 366 And _
      YYYY Mod 4 = 0 And YYYY Mod 100 <> 0 Or YYYY Mod 400 = 0 Then _
             CJulian2Date = DateSerial(YYYY, 1, JulDay)
End Function

Function DateToJDate(TheDate As Long) As String
'Translates a Date to a 6-digit Julian Date
Dim TheYear As Integer
Dim TheDays As Integer
Dim JDate As String
Dim TheCentury As String

TheYear = Year(TheDate)
TheDays = DateDiff("d", DateSerial(TheYear, 1, 0), TheDate)
TheCentury = 1
JDate = TheCentury & Right(Format(TheYear, "0000"), 2) & Format(TheDays, "000")
DateToJDate = JDate

End Function

Public Function FirstDayInMonth(Optional dtmDate As Variant) As Date
'Returns the Date of the 1st Day of Month Specified or Current
    If IsMissing(dtmDate) Then
        dtmDate = Date
    End If
    
    FirstDayInMonth = DateSerial(Year(dtmDate), Month(dtmDate), 1)
End Function

Public Function LastDayInMonth(Optional dtmDate As Variant) As Date
'Returns the Date of the Last Day of Month Specified or Current
    If IsMissing(dtmDate) Then
        dtmDate = Date
    End If
    
    LastDayInMonth = DateSerial(Year(dtmDate), Month(dtmDate) + 1, 0)
End Function

Public Function FirstDayInMonthPY(Optional dtmDate As Variant) As Date
'Returns the Date of the 1st Day of Month a year before Specified or Current
    If IsMissing(dtmDate) Then
        dtmDate = Date
    End If
    
    FirstDayInMonthPY = DateSerial(Year(dtmDate) - 1, Month(dtmDate), 1)
End Function

Public Function LastDayInMonthPY(Optional dtmDate As Variant) As Date
'Returns the Date of the Last Day of Month a year before Specified or Current
    If IsMissing(dtmDate) Then
        dtmDate = Date
    End If
    
    LastDayInMonthPY = DateSerial(Year(dtmDate) - 1, Month(dtmDate) + 1, 0)
End Function
