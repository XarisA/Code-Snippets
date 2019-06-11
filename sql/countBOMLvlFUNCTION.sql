USE [Vioryl_test]
GO

/****** Object:  UserDefinedFunction [dbo].[countLVL]    Script Date: 11/6/2019 12:06:49 μμ ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[countLVL] (@input VARCHAR(30),@wh integer, @eft integer)
RETURNS integer
AS BEGIN
    DECLARE @CountLVL as integer;

    --SELECT @CountLVL =
	
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
	select @CountLVL= (select max(Level)+1 from Myquery)
						 
						
						
    RETURN @CountLVL
END

GO


