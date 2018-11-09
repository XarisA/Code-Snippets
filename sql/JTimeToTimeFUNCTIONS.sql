--A function that converts Julian time format to Normal

create function [dbo].[JTimeToTime](@jtime float)
returns time
as
begin
declare
@hours integer,
@minutes integer,
@seconds integer,
@mytime time,

set @hours=floor(@jtime/10000)
set @minutes=FLOOR((@jtime-@hours*10000)/100)
set @seconds=@jtime-@hours*10000-@minutes*100
set @mytime=CAST( CONVERT(varchar(2),@hours)+':'+CONVERT(varchar(2),@minutes)+':'+CONVERT(varchar(2),@seconds) as time)
return @mytime
end


--Function that converts time to julian time

create function [dbo].[TimeToJTime](@time time)
returns float
as
begin
declare
@hours integer,
@minutes integer,
@seconds integer,
@mytime float,
@vtime varchar(8)

set @vtime=cast (@time as varchar(8))
set @hours=CAST (substring(@vtime,1,2) as float)
set @minutes=CAST (substring(@vtime,4,2) as float)
set @seconds=CAST (substring(@vtime,7,2) as float)
set @mytime=@hours*10000+@minutes*100+@seconds
return @mytime
end