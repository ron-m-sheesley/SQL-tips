
-- SQL to compare a date to a julian date
select * from cams.OPP426 where (days(logdate) - days('1900-12-31')) > o1ojul;