-- Recursion for Exploiting BOM

-- Applies to all boms with parent child in the same table.

;with Myquery (Parent,Child,Quantity, Level) AS
(select m.Parent,m.Child,m.Quantity, 0 AS Level
	from BOM_Table m
	where m.ExpireDate>118044 and ltrim(rtrim(m.Location))=66 and m.Parent like '24032200%'
UNION ALL 

 select  m.Parent,m.Child,m.Quantity, Q.Level +1
	from BOM_Table m
	inner join Myquery Q on m.Parent=Q.Child
	and m.ExpireDate>118044 and ltrim(rtrim(m.Location))=66
)
select * from Myquery


/* in ORACLE 
select ixkit,ixitm from BOM_Table
start with ixkit=1001
connect by PRIOR ixkit=ixitm
*/