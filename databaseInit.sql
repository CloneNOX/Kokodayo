drop database if exists kokodayo18340184;

create database kokodayo18340184
default character set utf8 
default collate utf8_general_ci;

create table kokodayo18340184.mission (
	missionName varchar(10) not null,
    sanity int not null,
    primary key (missionName)
) engine = InnoDB;

#0-材料 1-作战记录 3-芯片 4-家具
create table kokodayo18340184.material (
    materialName varchar(20) not null,
    materialType int not null,
    imgURL varchar(150) not null,
    materialOrder int not null,
    primary key (materialName)
) engine = InnoDB;

create table kokodayo18340184.report (
	reportId int AUTO_INCREMENT,
    missionName varchar(10) not null,
    materialName varchar(10) not null,
    number int not null,
    primary key (reportId),
    foreign key (missionName) references mission(missionName),
    foreign key (materialName) references material(materialName)
) engine = InnoDB;

#permission 0-user 1-admin
create table kokodayo18340184.kokoer (
	userId int AUTO_INCREMENT,
    userName varchar(20) not null,
    userPassword varchar(20) not null,
    permission int,
    primary key (userId)
) engine = InnoDB;

create table kokodayo18340184.kokoFile (
	fileId int AUTO_INCREMENT,
    fileURL varchar(150) not null,
    fileType int not null,
    primary key (fileId)
) engine = InnoDB;

create table kokodayo18340184.post (
	postId int AUTO_INCREMENT,
    userId int not null,
    fileId int not null,
    primary key (postId,userId,fileId),
    foreign key (userId) references kokoer(userId),
    foreign key (fileId) references kokoFile(fileId)
) engine = InnoDB;


insert into kokodayo18340184.mission values
("TW-6",18),
("TW-7",18),
("TW-8",18);

insert into kokodayo18340184.material values
("白马醇",0,"img/白马醇.png",1),
("扭转醇",0,"img/扭转醇.png",2),
("三水锰矿",0,"img/三水锰矿.png",3),
("轻锰矿",0,"img/轻锰矿.png",4),
("五水研磨石",0,"img/五水研磨石.png",5),
("研磨石",0,"img/研磨石.png",6),
("RMA70-24",0,"img/RMA70-24.png",7),
("RMA70-1",0,"img/RMA70-12.png",8),
("提纯源岩",0,"img/提纯源岩.png",9),
("固源岩组",0,"img/固源岩组.png",10),
("固源岩.png",0,"源岩.png",11),
("改良装置",0,"img/改良装置.png",12),
("全新装置",0,"img/全新装置.png",13),
("装置",0,"img/装置.png",14),
("破损装置",0,"img/破损装置.png",15),
("聚酸脂块",0,"img/聚酸脂块.png",16),
("聚酸脂组",0,"img/聚酸脂组.png",17),
("聚酸脂",0,"img/聚酸脂.png",18),
("酯原料",0,"img/酯原料.png",19),
("糖聚块",0,"img/糖聚块.png",20),
("糖组",0,"img/糖组.png",21),
("糖",0,"img/糖.png",22),
("代糖",0,"img/代糖.png",23),
("异铁组",0,"img/异铁组.png",24),
("异铁块",0,"img/异铁块.png",25),
("异铁",0,"img/异铁.png",26),
("异铁碎片",0,"img/异铁碎片.png",27),
("酮阵列",0,"img/酮阵列.png",28),
("酮凝集组",0,"img/酮凝集组.png",29),
("酮凝集",0,"img/酮凝集.png",30),
("双酮",0,"img/双酮.png",31),
("聚合凝胶",0,"img/聚合凝胶.png",32),
("凝胶",0,"img/凝胶.png",33),
("炽合金块",0,"img/炽合金块.png",34),
("炽合金",0,"img/炽合金.png",35),
("晶体电路",0,"img/晶体电路.png",36),
("晶体元件",0,"img/晶体元件.png",37),
("碳素组",0,"img/碳素组.png",38),
("碳素",0,"img/碳素.png",39),
("碳",0,"img/碳.png",40),
("技巧概要·卷3",0,"img/技巧概要·卷3.png",41),
("技巧概要·卷2",0,"img/技巧概要·卷2.png",42),
("技巧概要·卷1",0,"img/技巧概要·卷1.png",43),
("赤金",0,"img/赤金.png",44),
("高级作战记录",1,"img/高级作战记录.png",45),
("中级作战记录",1,"img/中级作战记录.png",46),
("初级作战记录",1,"img/初级作战记录.png",47),
("基础作战记录",1,"img/基础作战记录.png",48),
("先锋芯片组",2,"img/先锋芯片组.png",49),
("术师芯片组",2,"img/术师芯片组.png",50),
("狙击芯片组",2,"img/狙击芯片组.png",51),
("近卫芯片组",2,"img/近卫芯片组.png",52),
("医疗芯片组",2,"img/医疗芯片组.png",53),
("特种芯片组",2,"img/特种芯片组.png",54),
("辅助芯片组",2,"img/辅助芯片组.png",55),
("重装芯片组",2,"img/重装芯片组.png",56),
("先锋芯片",2,"img/先锋芯片.png",57),
("术师芯片",2,"img/术师芯片.png",58),
("狙击芯片",2,"img/狙击芯片.png",59),
("近卫芯片",2,"img/近卫芯片.png",60),
("医疗芯片",2,"img/医疗芯片.png",61),
("特种芯片",2,"img/特种芯片.png",62),
("辅助芯片",2,"img/辅助芯片.png",63),
("重装芯片",2,"img/重装芯片.png",64);

insert into kokodayo18340184.report values
(0,"TW-6","炽合金",1),
(0,"TW-7","酮凝集",1),
(0,"TW-8","研磨石",1);

insert into kokodayo18340184.kokoer values
(0,"kroos","kokodayo",1),
(0,"amiya","doctor",10);

select * from kokodayo18340184.post;