-- IMAGE TO NVARCHAR CONVERTION

/*
Data Types: ntext, text, and image 

Fixed and variable-length data types for storing large non-Unicode and Unicode character and binary data.
Unicode data uses the UNICODE UCS-2 character set.

IMPORTANT! ntext, text, and image data types will be removed in a future version of SQL Server. 
Avoid using these data types in new development work, and plan to modify applications that currently use them. 
Use nvarchar(max), varchar(max), and varbinary(max) instead.

The following functions and statements can be used with ntext, text, or image data.

Funcs

DATALENGTH 	    :This function returns the number of bytes used to represent any expression
PATINDEX        :Returns the starting position of the first occurrence of a pattern in a specified expression, or zeros if the pattern is not found, on all valid text and character data types
SUBSTRING 	    :Returns part of a character, binary, text, or image
TEXTPTR 	    :Returns the text-pointer value 
TEXTVALID       :Checks whether a specific text pointer is valid

Sates

READTEXT 
SET TEXTSIZE 
UPDATETEXT 
WRITETEXT 

*/


-- Analyse how Image Datatype should work on MSSQL 2000 
-- Image Data type stores in database the text pointer of the actual data
-- It is Variable-length binary data from 0 through 2^31-1 (2,147,483,647) bytes.
-- MSSQL 2000

Declare @pointer varbinary(30)

select  @pointer =TEXTPTR(GDTXFT)  from Attachments
where GDTXKY='5873|44|M|.00000'
Readtext Attachments.GDTXFT  @pointer 0 431



-- Convert Image Data Type to nvarchar
select GDTXKY, convert(nvarchar(max),convert(varbinary(max),GDTXFT),0) as Attachment_Decr into AttDecrypted
from Attachments

-- Convert strings to Image Data Type
select GDTXKY, convert(varbinary(max),Attachment) as GDTXFT 
from AttFixed