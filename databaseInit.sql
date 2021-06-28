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
    materialNumber int not null,
    primary key (reportId),
    foreign key (missionName) references mission(missionName),
    foreign key (materialName) references material(materialName)
) engine = InnoDB;

#permission 0-user 1-admin
create table kokodayo18340184.kokoer (
	userId int not null,
    userName varchar(20) not null,
    userPassword varchar(20) not null,
    permission int,
    primary key (userId)
) engine = InnoDB;

#0-text 1-img 2-others
create table kokodayo18340184.kokoFile (
	fileId int not null,
    fileURL varchar(150) not null,
    fileType int not null,
    primary key (fileId)
) engine = InnoDB;

#0- 1- 2-
create table kokodayo18340184.post (
	postId int not null,
    userId int not null,
    fileId int not null,
    postType int not null,
    postTitle varchar(100) not null,
    postTime datetime default CURRENT_TIMESTAMP(),
    primary key (postId,userId,fileId),
    foreign key (userId) references kokoer(userId),
    foreign key (fileId) references kokoFile(fileId)
) engine = InnoDB;


insert into kokodayo18340184.mission values
("1-7",6),
("S2-12",15),
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
("RMA70-12",0,"img/RMA70-12.png",8),
("提纯源岩",0,"img/提纯源岩.png",9),
("固源岩组",0,"img/固源岩组.png",10),
("固源岩",0,"img/固源岩.png",11),
("源岩",0,"img/源岩.png",12),
("改良装置",0,"img/改良装置.png",13),
("全新装置",0,"img/全新装置.png",14),
("装置",0,"img/装置.png",15),
("破损装置",0,"img/破损装置.png",16),
("聚酸脂块",0,"img/聚酸脂块.png",17),
("聚酸脂组",0,"img/聚酸脂组.png",18),
("聚酸脂",0,"img/聚酸脂.png",19),
("酯原料",0,"img/酯原料.png",20),
("糖聚块",0,"img/糖聚块.png",21),
("糖组",0,"img/糖组.png",22),
("糖",0,"img/糖.png",23),
("代糖",0,"img/代糖.png",24),
("异铁组",0,"img/异铁组.png",25),
("异铁块",0,"img/异铁块.png",26),
("异铁",0,"img/异铁.png",27),
("异铁碎片",0,"img/异铁碎片.png",28),
("酮阵列",0,"img/酮阵列.png",29),
("酮凝集组",0,"img/酮凝集组.png",30),
("酮凝集",0,"img/酮凝集.png",31),
("双酮",0,"img/双酮.png",32),
("聚合凝胶",0,"img/聚合凝胶.png",33),
("凝胶",0,"img/凝胶.png",34),
("炽合金块",0,"img/炽合金块.png",35),
("炽合金",0,"img/炽合金.png",36),
("晶体电路",0,"img/晶体电路.png",37),
("晶体元件",0,"img/晶体元件.png",38),
("碳素组",0,"img/碳素组.png",39),
("碳素",0,"img/碳素.png",40),
("碳",0,"img/碳.png",41),
("技巧概要·卷3",0,"img/技巧概要·卷3.png",42),
("技巧概要·卷2",0,"img/技巧概要·卷2.png",43),
("技巧概要·卷1",0,"img/技巧概要·卷1.png",44),
("赤金",0,"img/赤金.png",45),
("高级作战记录",1,"img/高级作战记录.png",46),
("中级作战记录",1,"img/中级作战记录.png",47),
("初级作战记录",1,"img/初级作战记录.png",48),
("基础作战记录",1,"img/基础作战记录.png",49),
("先锋芯片组",2,"img/先锋芯片组.png",50),
("术师芯片组",2,"img/术师芯片组.png",51),
("狙击芯片组",2,"img/狙击芯片组.png",52),
("近卫芯片组",2,"img/近卫芯片组.png",53),
("医疗芯片组",2,"img/医疗芯片组.png",54),
("特种芯片组",2,"img/特种芯片组.png",55),
("辅助芯片组",2,"img/辅助芯片组.png",56),
("重装芯片组",2,"img/重装芯片组.png",57),
("先锋芯片",2,"img/先锋芯片.png",58),
("术师芯片",2,"img/术师芯片.png",59),
("狙击芯片",2,"img/狙击芯片.png",60),
("近卫芯片",2,"img/近卫芯片.png",61),
("医疗芯片",2,"img/医疗芯片.png",62),
("特种芯片",2,"img/特种芯片.png",63),
("辅助芯片",2,"img/辅助芯片.png",64),
("重装芯片",2,"img/重装芯片.png",65);

insert into kokodayo18340184.report values
(0,"1-7","固源岩",1),
(0,"1-7","固源岩",1),
(0,"1-7","固源岩",2),
(0,"1-7","固源岩",1),
(0,"1-7","固源岩",1),
(0,"1-7","固源岩",2),
(0,"1-7","固源岩",1),
(0,"1-7","固源岩",1),
(0,"1-7","固源岩",2),
(0,"S2-12","固源岩",2),
(0,"S2-12","固源岩",2),
(0,"S2-12","固源岩",2),
(0,"S2-12","固源岩",2),
(0,"S2-12","固源岩",2),
(0,"S2-12","固源岩",2),
(0,"S2-12","固源岩",2),
(0,"S2-12","固源岩",2),
(0,"S2-12","固源岩",1),
(0,"S2-12","固源岩",1),
(0,"TW-6","炽合金",1),
(0,"TW-7","酮凝集",1),
(0,"TW-8","研磨石",1);

insert into kokodayo18340184.kokoer values
(1,"kroos","kokodayo",1),
(2,"amiya","doctor",0),
(3,"throns","yibiliya",0);

insert into kokodayo18340184.kokoFile values
(1,"file/kroos_text1.txt",0),
(2,"file/kroos_img1.png",0);

insert into kokodayo18340184.post values
(0,1,1,0,"Kokodayo",CURRENT_TIMESTAMP()),
(1,1,2,0,"hihi",CURRENT_TIMESTAMP()),
(2,1,1,0,"kroos",CURRENT_TIMESTAMP()),
(3,1,2,0,"hello Dr.Ma",CURRENT_TIMESTAMP()),
(4,1,1,0,"me~la~de",CURRENT_TIMESTAMP()),
(5,2,2,1,"rhodes",CURRENT_TIMESTAMP()),
(6,2,1,1,"Doctor!",CURRENT_TIMESTAMP()),
(7,2,2,1,"ocean cat",CURRENT_TIMESTAMP()),
(8,2,1,1,"rua",CURRENT_TIMESTAMP()),
(9,2,2,1,"mostima",CURRENT_TIMESTAMP()),
(10,3,1,2,"suzuran",CURRENT_TIMESTAMP()),
(11,3,2,2,"warfarin",CURRENT_TIMESTAMP()),
(12,3,1,2,"siege",CURRENT_TIMESTAMP()),
(13,3,2,2,"mayer",CURRENT_TIMESTAMP()),
(14,3,1,2,"Mi Na",CURRENT_TIMESTAMP()),
(15,3,2,2,"lei wa ting!",CURRENT_TIMESTAMP());