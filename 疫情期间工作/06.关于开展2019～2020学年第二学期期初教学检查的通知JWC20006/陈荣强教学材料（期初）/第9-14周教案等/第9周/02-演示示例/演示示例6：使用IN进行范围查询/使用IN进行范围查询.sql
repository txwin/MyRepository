SELECT  *  FROM  subject  where    ClassHour = 100  OR ClassHour =110 OR ClassHour  = 120;  #普通组处理方式
SELECT  *  FROM  subject  where ClassHour  IN ( 100, 110,120 );#使用IN进行查询方式，更为简洁，效率更高
