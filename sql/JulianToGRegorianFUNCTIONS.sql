--Functions that convert 6-digit julian date to normal date and the opposite


create function [dbo].[TimeStampToJulian](@date datetime)
returns numeric(9) 
as 
Begin
return(datepart(yy,@date)-1900)*1000+datepart(dy,@date)
end


create function [dbo].[JulianToTimeStamp](@jdate numeric(9),@Start0Middle1End2 int)
returns datetime 
as 
Begin
declare 
 @years numeric(9),
 @days  numeric(9),
 @Date datetime
set @years=floor(@jdate/1000)
set @days=@jdate-@years*1000-1
set @Date=dateadd(year,@years,'')
set @Date=dateadd(day,@days,@Date)
If  @Start0Middle1End2=1 set @Date=dateadd(Hour,12,@date)
If  @Start0Middle1End2=2 
begin 
 set @Date=dateadd(Hour,11,@date) 
 set @Date=dateadd(minute,59,@date) 
 set @Date=dateadd(second,59,@date)
 set @Date=dateadd(millisecond,997,@date)
 end
return(@date)
end




--Testing Alternative

DECLARE @julian VARCHAR(6) = '116059';

SELECT DATEADD(YEAR, 
  100*CONVERT(INT, LEFT(@julian,1))
  +10*CONVERT(INT, SUBSTRING(@julian, 2,1))
  +CONVERT(INT, SUBSTRING(@julian,3,1)), 
 DATEADD(DAY, CONVERT(INT,SUBSTRING(@julian, 4, 3))-1, 
 0));

 -- INLINE
 CONVERT(varchar(10),cast('1/1/'+cast(1900+floor(GZDGL/1000)as char)as datetime)+cast(GZDGL as int)%1000-1,103) as [date]