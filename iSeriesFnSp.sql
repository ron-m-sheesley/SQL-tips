
-- Stored Procedures on the iSeries
SELECT * FROM qsys2.sysprocs where NOT (SPECIFIC_SCHEMA in ('QSYS','SYSIBM','SQLJ','QIWS')) order by SPECIFIC_SCHEMA, SPECIFIC_NAME ;

-- SQL Functions on the iSeries
SELECT * FROM qsys2.sysfuncs where NOT (SPECIFIC_SCHEMA in ('QSYS','SYSIBM','SQLJ','QIWS')) order by SPECIFIC_SCHEMA, SPECIFIC_NAME ;