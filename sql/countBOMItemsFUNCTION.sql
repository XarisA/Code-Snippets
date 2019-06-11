USE [Vioryl_test]
GO

/****** Object:  UserDefinedFunction [dbo].[countItems]    Script Date: 11/6/2019 12:05:55 μμ ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[countItems] (@input VARCHAR(30),@wh integer, @eft integer)
RETURNS integer
AS BEGIN
    DECLARE @countItems as integer;

	;with Myquery (ixkitl,ixlitm,ixqnty, Level) AS
	(select m.ixkitl,m.ixlitm,m.ixqnty, 0 AS Level
		from [10.0.14.48].[JDE_PRODUCTION].proddta.f3002 m
		where m.ixefft>@eft and ltrim(rtrim(m.ixmmcu))=@wh and m.ixkitl=@input
	UNION ALL 
	
	 select  m.ixkitl,m.ixlitm,m.ixqnty, Q.Level +1
		from [10.0.14.48].[JDE_PRODUCTION].proddta.f3002 m
		inner join Myquery Q on m.IXKITL=Q.ixlitm
		and m.ixefft>@eft and ltrim(rtrim(m.ixmmcu))=@wh
	)
	
	select @countItems= (select count(*) from Myquery)
						 
						
						
    RETURN @countItems
END

GO


