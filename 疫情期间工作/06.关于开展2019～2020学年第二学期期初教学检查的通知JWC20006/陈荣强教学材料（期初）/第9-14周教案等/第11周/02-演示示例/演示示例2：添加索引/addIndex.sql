
CREATE TABLE `student` (
  `StudentNo` int(4) NOT NULL COMMENT '学号',
  `LoginPwd` varchar(20) DEFAULT NULL,
  `StudentName` varchar(20) DEFAULT NULL COMMENT '学生姓名',
  `Sex` tinyint(1) DEFAULT NULL COMMENT '性别，取值0或1',
  `GradeId` int(11) DEFAULT NULL COMMENT '年级编号',
  `Phone` varchar(50) NOT NULL COMMENT '联系电话，允许为空，即可选输入',
  `Address` varchar(255) NOT NULL COMMENT '地址，允许为空，即可选输入',
  `BornDate` datetime DEFAULT NULL COMMENT '出生时间',
  `Email` varchar(50) NOT NULL COMMENT '邮箱账号，允许为空，即可选输入',
  `IdentityCard` varchar(18) DEFAULT NULL COMMENT '身份证号',
  PRIMARY KEY (`StudentNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


show  index  from sutdent;
alter table student add primary key(`StudentNo`);
alter table student add unique index(IdentityCard);
alter table student add index (Email);
/*先修改为MyISAM类型数据表*/
alter table student engine=MyISAM;
alter table student add fulltext(StudentName);


 