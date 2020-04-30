create table if not exists  category(
	categoryId int(10)  unsigned  not null  auto_increment,
	pid  int(10) not null,
	categoryName   varchar(32) not null,
	primary key(categoryId)
);

insert into  category values
(2,1,"美术设计"),
(3,1,"软件开发"),
(4,3,"数据库基础"),
(5,2,"Photoshop基础"),
(6,2,"色彩搭配学"),
(7,3,"PHP基础"),
(8,3,"一起学JAVA");

SELECT  c1.categoryName AS "父栏目名称",c2.categoryName AS  "子栏目名称" 
FROM category AS c1,category AS c2 
WHERE c1.categoryId = c2.pid; 
