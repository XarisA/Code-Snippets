Option Compare Database
'------------------------------------------------------------
' Import_from_Excel
'
'------------------------------------------------------------
Function ImportFromExcel()
On Error GoTo ImportFromExcel_Err

    Dim f    As Object
    Dim filename As String
    Dim varFile As Variant
    
    DoCmd.SetWarnings False
    
    Set f = Application.FileDialog(3)
    ' Set the title of the dialog box.
    f.Title = "Please select the file to Import and Update"
    ' Clear out the current filters, and add our own.
    f.Filters.Clear
    f.Filters.Add "Excel Files", "*.xls*"
    
    f.AllowMultiSelect = False
    
    If f.Show = True Then
       For Each varFile In f.SelectedItems
         filename = varFile
       Next
    End If
    
    DoCmd.TransferSpreadsheet acImport, 10, "Excel_Data", filename, True, ""



ImportFromExcel_Exit:
    Exit Function

ImportFromExcel_Err:
    MsgBox Error$
    Resume ImportFromExcel_Exit

End Function
