6 Digit Julian Date Conversion to Normal Date


Excel
"
=DATE(YEAR("01/01/"&TEXT(1900+INT(A2/1000),0)),MONTH("01/01/"&TEXT(1900+INT(A2/1000),0)),DAY("01/01/"&TEXT(1900+INT(A2/1000),0)))+MOD(A2,1000)-1
"



Vb Function  
"
Function CJulian2Date(JulDay As Integer, Optional YYYY)
      If IsMissing(YYYY) Then YYYY = Year(Date)
      If Not IsNumeric(YYYY) Or YYYY \ 1 <> YYYY Or YYYY < 100 Or YYYY _
        > 9999 Then Exit Function
      If JulDay > 0 And JulDay < 366 Or JulDay = 366 And _
      YYYY Mod 4 = 0 And YYYY Mod 100 <> 0 Or YYYY Mod 400 = 0 Then _
             CJulian2Date = DateSerial(YYYY, 1, JulDay)
End Function
"

Must Work with in Access
->  " IIf(Len([WATRDJ])=6;cjulian2date(([WATRDJ] Mod 1000);(1900+(Val(Mid([WATRDJ];1;3)))));cjulian2date(([WATRDJ] Mod 1000);(1900+(Val(Mid([WATRDJ];1;2)))))) "





Vb Alternative 
"
Public Function ConvertJulian(JulianDate As String) As Date 
    Dim lDays As Long 
    Dim lYear As Long 
     
    lDays = CLng(Right(JulianDate, 3)) 
     ''''''
     '   If lDays > 366 Then
     '      'is this an error
     '   End If
     '''''
    If Len(JulianDate) < 4 Then 
        lYear = 1900 
    Else 
        lYear = 1900 + CLng(Left(JulianDate, Len(JulianDate) - 3)) 
    End If 
    If lYear = 1900 Then lDays = lDays - 1 
    ConvertJulian = DateSerial(lYear, 1, lDays) 
End Function 
"

Invert Conversion Date to 6 Digit Julian Date  mine (tested)
"

Function DateToJDate(TheDate As Long) As String
Dim TheYear As Integer
Dim TheDays As Integer
Dim JDate As String
Dim TheCentury As String

TheYear = Year(TheDate)
TheDays = DateDiff("d", DateSerial(TheYear, 1, 0), TheDate)
TheCentury = 1
JDate = TheCentury & Right(Format(TheYear, "0000"), 2) & Format(TheDays, "000")
DateToJDate = JDate
"

/*
SQL Inline Convertion*/

CONVERT(varchar(10),cast('1/1/'+cast(1900+floor(julan_date/1000)as char)as datetime)+
cast(julan_date as int)%1000-1,103) as daate