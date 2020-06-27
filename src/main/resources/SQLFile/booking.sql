-- 创建数据库
/*
数据库名称：booking
字符集：	utf-8
管理员账户：123456
管理员密码：123456

患者账户：123456
患者密码：123456
*/

/**
  首先将SQL脚本运行，创建数据库，在启动程序。
 */
CREATE DATABASE IF NOT EXISTS `booking` DEFAULT CHARACTER SET utf8;

USE `booking`;

/*
	创建患者表（patient）
*/

DROP TABLE IF EXISTS `patient`;

CREATE TABLE `patient` (
	`id` int AUTO_INCREMENT,
	`nickname` varchar(50) NOT NULL COMMENT '昵称',
	`pname` varchar(50) NOT NULL COMMENT '姓名',
	`phonenum` varchar(50) NOT NULL UNIQUE  COMMENT '手机号',
	`password` varchar(50) NOT NULL COMMENT '密码',
	`email` varchar(50) NOT NULL COMMENT '邮箱',
	`sex` varchar(10) NOT NULL COMMENT '性别',
	`age` int NOT NULL COMMENT '年龄',
	`address` varchar(255) COMMENT '地址',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 默认患者信息
INSERT INTO `patient`(`nickname`,`pname`, `phonenum`, `password`, `email`, `sex`, `age`, `address`) VALUES('默认患者','小华', '123456', '123456', '12321414@qq.com', '男', 25, '陕西省西安市');


-- 创建管理员表

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
	`id` int AUTO_INCREMENT,
	`adname` varchar(50) NOT NULL UNIQUE COMMENT '姓名',
	`phonenum` varchar(50) NOT NULL UNIQUE COMMENT '手机号',
	`password` varchar(50) NOT NULL COMMENT '密码',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 添加管理员信息
INSERT INTO `admin`(`adname`, `phonenum`, `password`) VALUES('管理员', '123456', '123456');

/*
	创建科室表（office）
*/
DROP TABLE IF EXISTS `office`;

CREATE TABLE `office` (
	`id` int AUTO_INCREMENT,
	`officename` varchar(50) NOT NULL COMMENT '科室名称',
	PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 主页固定导航栏查询id是固定即在创建数据库时就创建好数据
insert into office(`id`, `officename`) values(1, "内科");
insert into office(`id`, `officename`) values(2, "外科");
insert into office(`id`, `officename`) values(3, "妇产科");
insert into office(`id`, `officename`) values(4, "皮肤性病科");
insert into office(`id`, `officename`) values(5, "骨科");
insert into office(`id`, `officename`) values(6, "五官科");



-- 医生表（doctor）

DROP TABLE IF EXISTS `doctor`;

CREATE TABLE `doctor` (
	`id` int AUTO_INCREMENT,
	`doctorname` varchar(50) NOT NULL UNIQUE COMMENT '姓名',
	`phonenum` varchar(50) NOT NULL UNIQUE COMMENT '手机号',
	`academictitle` varchar(50) COMMENT '职称',
	`sex` varchar(10) NOT NULL,
	`age` int NOT NULL,
	`description` varchar(255) COMMENT '医生描述',
	`officeid` int COMMENT '外键（科室主键）',
	PRIMARY KEY (`id`),
	FOREIGN KEY (`officeid`) REFERENCES `office`(`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*
	挂号订单表（order）
*/
DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
	`id` INT AUTO_INCREMENT,
	`ordertime` DATETIME COMMENT '下单时间',
	`starttime` DATETIME COMMENT '就诊时间',
	`degree` int DEFAULT 0 COMMENT '满意度',
	`status` int NOT NULL COMMENT '订单状态',
	`comment` VARCHAR(255) COMMENT '评语',
	`patientid` int COMMENT '外键（患者主键）',
	`doctorid` int COMMENT '外键（医生主键）',
	PRIMARY KEY (`id`),
	FOREIGN KEY (`patientid`) REFERENCES `patient`(`id`),
	FOREIGN KEY (`doctorid`) REFERENCES `doctor`(`id`)

)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 排班表（schedule）

DROP TABLE IF EXISTS `schedule`;

CREATE TABLE `schedule`(
	`id` int AUTO_INCREMENT,
	`weekday` varchar(50) NOT NULL COMMENT '周几',
	`worktime` DATETIME NOT NULL COMMENT '时段',
	PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 上班时间表（worktime）

DROP TABLE IF EXISTS `worktime`;

CREATE TABLE `worktime`(
	`id` int AUTO_INCREMENT,
	`doctorid` int COMMENT '外键（医生表）',
	`scheduleid` int COMMENT '外键（排班表）',
	`visitnum` int NOT NULL COMMENT '看诊最大人数',
	`ordernum` int DEFAULT 0 COMMENT '已经预定的人数',
	PRIMARY KEY (`id`),
	FOREIGN KEY (`scheduleid`) REFERENCES `schedule`(`id`),
	FOREIGN KEY (`doctorid`) REFERENCES `doctor`(`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 疾病表（illness）
DROP TABLE IF EXISTS `illness`;

CREATE TABLE `illness` (
	`id` int AUTO_INCREMENT,
	`illnessname` varchar(50) NOT NULL UNIQUE COMMENT '疾病名称',
	PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 疾病科室关系表（officerelation）

DROP TABLE IF EXISTS `officerelation`;

CREATE TABLE `officerelation` (
	`id` int AUTO_INCREMENT,
	`officeid` int COMMENT '外键（科室表）',
	`illnessid` int COMMENT '外键（疾病表）',
	PRIMARY KEY (`id`),
	FOREIGN KEY (`officeid`) REFERENCES `office`(`id`),
	FOREIGN KEY (`illnessid`) REFERENCES `illness`(`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

























