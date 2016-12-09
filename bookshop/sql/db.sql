drop table activity;
drop table roleInfo;
drop table userComment;
drop table orderInfo;
drop table orders;
drop table bookInfo;
drop table bookType;
drop table userInfo;

--用户信息表 userInfo
create table userInfo(
   usid  int primary key, --用户id
   uname varchar2(100) unique not null,   --姓名             
   pwd  varchar2(100),  --密码         
   sex  char(1)  check(sex in(0,1) ),    --性别         
   email varchar2(100) unique, --邮箱              
   tel   varchar2(15), --联系方式          
   addr varchar2(200), --发货地址           
   question varchar2(100), --密保问题         
   answer varchar2(100), --密保答案 
   status int, --状态(0.未激活  1.正常帐号
   temp varchar2(200),  --备用字段
   flag varchar2(500)  --备用字段            
   
);

create sequence seq_userInfo_usid start with 10001;

insert into userInfo values(seq_userInfo_usid.nextval,'张三','a','女','1337440758@qq.com','13080560946','湖南省衡阳市珠晖区','您的宠物的名字？','cherry',null,null);
insert into userInfo values(seq_userInfo_usid.nextval,'李四','a','男','2840930793@qq.com','15574708702','湖南省衡阳市珠晖区','少年时代心目中的英雄是谁？','金希澈',null,null);

--书籍类型表
create table bookType(
   tid int primary key,--类型id
   tid_parent int , --父类型id
   tname varchar2(100),--类型名
   status int--是否参与活动
)
--1、2
insert into  bookType values(1,0,'科学技术',0);
insert into  bookType values(11,1,'计算机',0);
insert into  bookType values(12,1,'医学',0);
insert into  bookType values(13,1,'自然科学',0);

insert into bookType values(2,0,'文学小说',0);
insert into bookType values(21,2,'青春文学',0);
insert into bookType values(22,2,'侦探推理',0);
insert into bookType values(23,2,'动漫',0);
--3 、4
insert into bookType values(3,0,'人文社科',0);
insert into bookType values(31,3,'语言',0);
insert into bookType values(32,3,'文化',0);
insert into bookType values(33,3,'历史',0);

insert into bookType values(4,0,'艺术设计',0);
insert into bookType values(41,4,'设计',0);
insert into bookType values(42,4,'绘画',0);
insert into bookType values(43,4,'书法',0);
--5、6
insert into bookType values(5,0,'经管励志',0);
insert into bookType values(51,5,'励志',0);
insert into bookType values(52,5,'管理',0);
insert into bookType values(53,5,'经济',0);

insert into bookType values(6,0,'生活育儿',0);
insert into bookType values(61,6,'服饰',0);
insert into bookType values(62,6,'家居',0);
insert into bookType values(63,6,'育儿',0);

insert into bookType values(7,0,'军事历史',0);
insert into bookType values(71,7,'军事理论',0);
insert into bookType values(72,7,'世界军事',0);
insert into bookType values(73,7,'史家名著',0);

--书籍信息表
    
create table bookInfo(
   bid  int primary key,--书籍id
   bname varchar(200) not null,--书名
   author varchar(50) not null,--书籍作者
   publisher varchar(100) not null,--出版社
   tid  int
        constraint FK_bookType_bookInfo_tid references bookType(tid),--书籍类型 id
   intro  clob,--书籍简介
   image  clob,--图片地址
   price  number(8,2),--书籍价格
   status  int,--上架 下架 
   inventory int, --库存
   temp varchar2(200),  --备用字段
   flag varchar2(1000)  --备用字段    
);
create sequence seq_bookInfo_bid start with 10001;

--计算机类书
insert into bookInfo values(seq_bookInfo_bid.nextval,'思科UCS服务器统一计算-(附光盘)',' 人民邮电出版社','人民邮电出版社',11,'作为业界首款应用服务器，思科UCS在单一的高能效系统中统一了计算、网络、存储访问和虚拟化资源的数据中心系统。
思科统一计算系统(UCS)可以简化数据中心资源，扩展服务交付范围，并从根本上减少需要设置、管理、供电/冷却和连接方面的设备数量，帮助您从容应对这些挑战。《思科UCS服务器统一计算》从教育角度介绍UCS，并提供了有关下列内容的最新信息：所有服务器组件和新数据中心技术，以及如何使用这些组件和技术建立最先进的数据中心服务器。
《思科UCS服务器统一计算》适合从事数据中心构架建设的人员阅读。',null,79,1,20,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'轻量级 Java EE 企业应用实战-Struts 2+Spring 4+Hibernate整合开发-(含光盘1张)',' 李刚',' 电子工业出版社',11,'本书是《轻量级Java EE企业应用实战》的第4版，第4版保持了前几版内容全面、深入的特点，主要完成全部知识的升级。
本书介绍了Java EE领域的三个开源框架：Struts 2、Spring和Hibernate。其中Struts 2升级到2.3.16.3，Spring升级到4.0.4，Hibernate升级到4.3.5。本书还全面介绍了Servlet 3.1的新特性，以及Tomcat 8.0的配置和用法，本书的示例也应该在Tomcat 8.0上运行。
本书重点介绍如何整合Struts 2.3+Spring 4.0+Hibernate 4.3进行Java EE开发，主要包括三部分。第一部分介绍了Java EE开发的基础知识，以及如何搭建开发环境。第二部分详细讲解了Struts 2.3、Spring 4.0和Hibernate 4.3三个框架的用法，介绍三个框架时，以Eclipse IDE的使用来上手，一步步带领读者深入三个框架的核心。
这部分内容是笔者讲授“疯狂Java实训”的培训讲义，因此是本书的重点部分。这部分内容既包含了笔者多年开发经历的领悟，也融入了丰富的授课经验。第三部分示范开发了一个包含7个表，表之间具有复杂的关联映射、继承映射等关系，且业务也相对复杂的工作流案例，希望让读者理论联系实际，将三个框架真正运用到实际开发中去。该案',
null,89.60,1,100,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'集体智慧编程','  电子工业出版社',' 电子工业出版社',11,' 本书以机器学习与计算统计为主题背景，专门讲述如何挖掘和分析Web上的数据和资源，如何分析用户体验、市场营销、个人品味等诸多信息，并得出有用的结论，通过复杂的算法来从Web网站获取、收集并分析用户的数据和反馈信息，
以便创造新的用户价值和商业价值。全书内容翔实，包括协作过滤技术(实现关联产品推荐功能)、集群数据分析(在大规模数据集中发掘相似的数据子集)、搜索引擎核心技术(爬虫、索引、查询引擎、PageRank算法等)、搜索海量信息并进行分析统计得出结论的优化算法、贝叶斯过滤技术(垃圾邮件过滤、文本过滤)、用决策树技术实现预测和决策建模功能、社交网络的信息匹配技术、机器学习和人工智能应用等。
本书是Web开发者、架构师、应用工程师等的绝佳选择。',null,60.80,1,80,null,null);


insert into bookInfo values(seq_bookInfo_bid.nextval,'Windows 10中文版操作系统从入门到精通','  任成鑫',' 中国青年出版社',11,'《Windows 10中文版操作系统从入门到精通》是专门为准备将操作系统升级到Windows 10的用户而写，旨在帮助广大用户将计算机操作系统轻松升级为Windows 10，并为用户提供必要的信息、建议和技巧。QQ群：74200601。全书共14章，以从入门到精通的学习思路为主旨，
详细介绍了Windows 10新功能、Windows 10系统的安装、基本操作、个性化设置、帐户管理、附件程序、应用程序的安装与管理、多媒体娱乐、网上冲浪、网络的配置、系统安全、系统管理、系统维护与优化、系统备份与还原，以及注册表等方面的知识内容。',
null,36.40,1,110,null,null);


insert into bookInfo values(seq_bookInfo_bid.nextval,'Office 2013 商务办公800秘技大全（附光盘）','启典文化',' 中国铁道出版社',11,' 共14章，包含800个精心挑选的Office商务办公实用技巧，按Office2013组件共性、行业知识和使用技巧将全书划分为三个部分；其中，第一部分（第1章）主要介绍Office组件的共有基础操作以及Office 2013新增的功能；第二部分包含第2章~第6章，
分别介绍Word、Excel和PPT在行业中常用的宝贵经验和原则；第三部分包含第7章~第14章，分别介绍Word、Excel和PPT在各个商务行业中的实用技巧。通过对本书的学习，读者不仅能学会Office软件的各种实用技巧，而且能够学会从哪些方面入手做出优秀、专业的办公文档，从而达到从Office使用新手晋升为高手的目的。本书主要定位于希望快速掌握Office 2013办公操作的初、中级用户，特别适合不同年龄段的办公人员、
文秘、财务人员、公务员阅读学习。此外，本书不仅适用于各类家庭用户、社会培训机构使用，也可作为各大中专院校及各类电脑培训班的办公教材使用。',
null, 41.30,1,50,null,null);


insert into bookInfo values(seq_bookInfo_bid.nextval,'C++ Primer中文版（第5版）',' Stanley B. Lippman( 斯坦利 李普曼) ',' 电子工业出版社',11,'这本久负盛名的C++经典教程，时隔八年之久，终于迎来史无前例的重大升级。除令全球无数程序员从中受益，甚至为之迷醉的——C++大师Stanley B. Lippman的丰富实践经验，
C++标准委员会原负责人Josée Lajoie对C++标准的深入理解，以及C++先驱Barbara E. Moo在C++教学方面的真知灼见外，更是基于全新的C++11标准进行了全面而彻底的内容更新。非常难能可贵的是，书中所有示例均全部采用C++11标准改写，这在经典升级版中极其罕见——充分体现了C++语言的重大进展及其全面实践。书中丰富的教学辅助内容、醒目的知识点提示，以及精心组织的编程示范，让这本书在C++领域的权威地位更加不可动摇。
无论是初学者入门，或是中高级程序员提升使用，本书均为不容置疑的首选。',
null,106.20,1,90,null,null);


insert into bookInfo values(seq_bookInfo_bid.nextval,'纵横大数据-云计算数据基础设施',' 何小朝','电子工业出版社',11,'是为在苹果iOS和OS X平台上，使用Objective-C语言和面向对象程序设计模式进行专业开发而编写的简洁、细致的入门读物。本书假设读者无面向对象程序语言或C语言编程经验，以保障初学者与有经验的程序员一样，可用本书迅速和有效地学习Objective-C。本书提供的学习方法独特，结合众多程序示例及章末练习，
使得《Objective-C程序设计（第6版）》同时适合自学和课堂教学。第6版已全面更新，充分纳入Objective-C的新功能与技术，同时覆盖对新版Xcode、iOS和Mac OS X Mavericks的介绍。',
null,73.90,1,90,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'Objective-C程序设计-第6版','Stephen G. Kochan(史蒂芬.G.寇肯) ',' 电子工业出版社',11,'《Objective-C程序设计》是为在苹果iOS和OS X平台上，使用Objective-C语言和面向对象程序设计模式进行专业开发而编写的简洁、细致的入门读物。本书假设读者无面向对象程序语言或C语言编程经验，以保障初学者与有经验的程序员一样，可用本书迅速和有效地学习Objective-C。
本书提供的学习方法独特，结合众多程序示例及章末练习，使得《Objective-C程序设计（第6版）》同时适合自学和课堂教学。第6版已全面更新，充分纳入Objective-C的新功能与技术，同时覆盖对新版Xcode、iOS和Mac OS X Mavericks的介绍。',
null,73.90,1,76,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'PPT办公秘技360招',' 王倩',' 中国青年出版社',11,'本书的专题涉及了PPT办公软件应用的方方面面，汇集了广大白领在日常办公中最常用但也最棘手的360个问题，并给予了详细的解答。通过学习本书，读者可以迅速掌握使用PPT办公的各种技巧，从而提高工作效率，轻松成为办公达人。',
null,34.90,1,79,null,null);

--医学类书
insert into bookInfo values(seq_bookInfo_bid.nextval,'抗癌力',' 何裕民 ',' 上海科学技术出版社',12,'通过分析，作者得出左右着个体癌症发生发展背后的一类长期被人们所忽略的影响力量——抗癌力。每个人体内都有原癌基因，抗癌力的存在使得大多数人与原癌基因相安无事，而癌症患者身上抗癌力较大程度的流失最终导致原癌基因的恶性病变。正是因为抗癌力，才让癌症同高血压、糖尿病一样成为进展缓慢、病程较长的慢性病，更让癌症有了自愈的可能。',
null,15.20 ,1,200,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'肿瘤放射治疗学(第四版)','殷蔚伯，余子豪，徐国镇，胡逸民 ',' 中国协和医科大学出版社',12,'肿瘤放射治疗学自第一版发行以来的十多年间，放射肿瘤学科得到了迅速的发展。国内的放疗临床、物理、生物均有长足的进展。设备、人员不断增多，积累了更多的新鲜的经验，肿瘤放射治疗学的再版适应了发展中新形热的要求。　　新版肿瘤放射治疗学基本上保持了原版的写作风格，以自己的材料为主，结合国内实际情况及国外先进经验，强调理论基础与临床实践的结合。与第一版的相比，再版的内容有较大的改动，如淋巴系统肿瘤和乳腺癌都重新改写，均按国际最近的分类法和治疗原则进行分析，并加入国内情况介绍。放射物理改动较大，就肿瘤放射治疗计划设计与执行中的有关物理问题进行了较详细的叙述和讨论，重点将放射物理应用于临床实践。放射治疗的质量保证和质量控制是新增加的一篇，分析、讨论了整个放射治疗过程中误差的可能来源及其对治疗结果的影响，提出了保证和提高靶区剂量准确性的措施，是从事放射治疗的各类工作人员必读的一篇，对提高我国放射治疗事业将起到很大作用。放射生物篇也基本作了重写，在较全面地介绍临床放射生物基本知识的同时，增加了自第一版以来在该领域的新知识和新概念，为放射治疗工作者掌握有关基',
null,146.30 ,1,200,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'让脑瘫宝宝走起来',' 宋为群 纪树荣 董继革','  中国科学技术',12,'本书内容丰富，文字通俗易懂，并配有大量的图片，方便指导患儿操作，具有较强的实用性和可操作性。图书详细介绍了小儿脑瘫的常见原因、临床表现、早期诊断、治疗方法、家庭护理、就诊注意事项等内容，重点介绍家庭实用康复训练技术和方法，以提高患儿日常生活活动能力，减轻神经功能障碍，使其重返社会。',
null, 18.20 ,1,200,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'岁月时光-人生的百科全书','（美）贝林高斯','  商务印书馆',12,'包括社会学、法学、科学、医学以及心理学等涉及人生各个层面的问题，由80多个独立的篇章构成。出于对生命的关注和热爱，作者收集了大量关于人生具有丰富内涵的生动材料，折射岁月时光，汇成生命乐章，堪称人生百科全书。',
null,  48.00 ,1,200,null,null);

--自然科学
insert into bookInfo values(seq_bookInfo_bid.nextval,'别莱利曼的趣味科学--七天玩转趣味几何',' （俄罗斯）别莱利曼 ，王艳',' 北京理工大学出版社',13,'书不仅是为爱好数学的人而写的，也是为那些还没有发现数学上许多引人入胜的东西的读者写的。许多读者曾在学校里学过几何学，但并不习惯去注意在我们周围世界里各种事物常见的几何关系，不会把学到的几何学知识应用到实际方面去，不知道在生活中间遇到困难的时候、在郊游或露营的时候应用学到的几何学知识。作者把几何学从学校教室的围墙里、从科学的“围城”中，引到户外去，到树林里、到原野上、到河边、到路上，在那里摆脱教科书和函数表，无拘无束地活学活用几何，用几何知识重新认识美丽的世界。',
null,  14.90  ,1,20,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'相对论','  阿尔伯特·爱因斯坦 ，易洪波 李智谋','  江苏人民出版社',13,'这是一部彻底颠覆经典物理学观念的创世之书。它否定了牛顿的绝对时空观，认为空间不是平直的欧几里得空间，而是在引力场中弯曲的黎曼空间；时间也不是独立于空间的单独一维，它无时无刻不在空间之中，与空间构成一个统一的四维时空整体。
   
这是一部并非凭借双眼，而是用智慧发现并创建了宇宙新秩序的书。它揭示了宇宙所具有的超乎寻常的秘密；同时性的相对性；运动中的钟慢、尺缩效应；水星的近日点异动；光谱红移；引力场中时钟变慢等。',
null,  24.00   ,1,20,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'花草物语-催情植物传奇',' 重庆大学出版社','  重庆大学出版社',13,'本书的主角是各种神奇的植物，书中从植物学的角度来详述人类的生殖图腾，让读者重温情欲及催情药的历史，并详解某些催情植物名称的渊源。
书中展示了一百多种植物，它们或多或少都有滋阴壮阳的功能，植物标本大多数采集于一百多年前，最古老的标本可追溯到1790年，堪称植物标本界的老古董。正是仰仗蒙彼利埃大学药学院及植物学院的鼎力协助，读者才能看到如此珍贵的植物标本，这也正是本书的精妙之处。作者以诙谐的笔触讲述了催情植物的传奇故事，还挖掘出许多古老的美容配方、调情秘诀、食疗菜谱、香薰疗法……',
null,   53.80    ,1,20,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'大学物理实验教程','  周殿清',' 武汉大学出版社',13,'全书共分四章，第一章讲述测量误差、不确定度和数据处理的基础知识；第二章编入20个普通物理基本实验，以巩固和加强学生的基础训练；第三、四章分别编排了14个综合实验和20个设计性实验，以利于学生的个性发展和创新能力的培养。　　本书可作为工科各专业和理科非物理类专业大学物理实验课程的教材或参考书，也可供其他专业和社会读者阅读。',
null,   8.60   ,1,20,null,null);

--青春文学

insert into bookInfo values(seq_bookInfo_bid.nextval,'若是那年初相遇','  叶妖精','中国言实出版社',21,'彭芸芸自由自在地呼吸着新鲜空气，踹开上一家的变态老板度假回来，整个人也轻松了不少。想到找新工作的事，她的心情就不太好。刚刚从机上下来，敏锐地耳朵听见嘈杂声……',
null,  14.90   ,1,20,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'那些年花开正当时',' 阙上心头',' 中国言实出版社',21,'葛灵犀心情愉快地朝市中心的地标建筑“天欣大厦”走去，她今天的目标是这座建筑中的一个“高富帅”。眼看就要到“天欣大厦”了，却见前面被围得水泄不通……',
null,  13.10    ,1,30,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'牵你的手笑看似水流年遇','方草心',' 中国言实出版社',21,'我叫马列，“马列主义”的那个“马列”，光听名字就知道我父母有多么又红又专。值得说明的是，我是女生。这个必须说明，因为这种有革命气息又很阳刚的名字，很容易让人误以为是男性……',
null,  11.90    ,1,20,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'三重门 ',' 韩寒',' 天津人民出版社',21,'本书通过少年林雨翔的视角，向读者揭示了真实的高中生的生活，把亲子关系、师生关系、同学关系的种种矛盾和问题展现开来，体现了学生式的思考、困惑和梦想。韩寒以自己的方式思考着、愤怒着、抗争着、改变着，透过那些犀利、尖锐甚至是刻薄的语言，读者感受到的是一个天才少年的灵光闪现。',
null,  21.70     ,1,30,null,null);

--侦探推理
insert into bookInfo values(seq_bookInfo_bid.nextval,'百年诅咒',' 那多 ',' 接力出版社',22,'　连环谋杀案露出冰山一角，所谓的诅咒看似渐行渐远，可诸多隐秘迹象告诉费城，更严酷的诅咒正迅猛生成，阴云远未驱散，阴霾愈来愈重……',
null,   13.00    ,1,20,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'布朗神父探案集:1','  吉尔伯特·基思·切斯特顿 ','  武汉大学出版社',22,'本书收录了《阿波罗的眼睛》《伯爵生死谜案》《带翅的匕首》等13篇小说。在这些作品中，布朗神父浑身充满了神职人员的正直和洞察力，他不会像福尔摩斯一样拿着放大镜寻找物证线索，也不会展示追踪罪犯行迹的非凡身手，而是通过宗教情怀对人性心理进行洞悉，对人类的犯罪行为做出精确的分析推理，从而寻找出离奇案件背后的真相。',
null,   11.90    ,1,40,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'福尔摩斯探案集:3','  武汉大学出版社 ','  武汉大学出版社',22,'　《福尔摩斯探案集》是阿瑟·柯南·道尔侦探小说的集大成之作，也是世界文坛中脍炙人口的作品。',
null,   13.00    ,1,60,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'达西的疑问','  重庆出版社 ',' 重庆出版社',22,'　 昔日的情敌韦翰，非但成了甩不脱的极品亲戚，如今还成了杀人嫌犯。 自从伊丽莎白和达西这对欢喜冤家结婚后，转眼已在气派的庞百利庄园共度了6年。两人过着安闲自在的生活，心上唯一的烦恼，只剩达西的宝贝妹妹乔安娜的婚事。 而今一年一度的秋季舞会正紧锣密鼓筹备中，所有人都忙得不可开交。乔安娜的两位追求者也在邀请之列：一个新近承袭了伯爵头衔和偌大家产，一个则是律师界的青年才俊。谁也没料到，就在舞会前夕，一切都乱了套。',
null,    12.00     ,1,20,null,null);

--动漫
insert into bookInfo values(seq_bookInfo_bid.nextval,'超级漫画入门讲座:2:人物基础篇','   爱卡动漫编 ','  中国青年出版社',23,'本书讲解了漫画人物的基础绘画技法，通过大量图例和讲解，介绍了漫画人物表情、动作、服装的绘制要点。',
null,    31.50     ,1,20,null,null);
insert into bookInfo values(seq_bookInfo_bid.nextval,'漫画技法从入门到精通:零基础新手学画画 ','  杯子蛋糕  ','  中国青年出版社',23,'《漫画技法从入门到精通：零基础新手学画画》是杯子蛋糕打造的一本漫画技法学习手册。本书强调的是学习的方法，而不是单纯的模仿，页面中对信息模块的整合与分割，使你的阅读体验更加流畅，同时为全书置入了更为丰富的信息量。
全书8个章节，从选择工具讲起，历经头部、身体动作、服饰道具、构图以及单幅插图的绘制等环节，到作品欣赏为止，一步一步引导你走上漫画大师的道路。',
null,     36.40      ,1,20,null,null);
insert into bookInfo values(seq_bookInfo_bid.nextval,'零基础新手学漫画：萝莉少女速查大图鉴','  杯子蛋糕 ','   中国青年出版社',23,'而作为素材书，我们全新打造的“零基础新手学漫画”系列更是不同于以往的素材罗列，我们从由易到难的角度分布素材，而章节的安排也并不是千篇一律的人物造型，光看目录你就知道，每章都有不同的侧重点。
我们希望，打造一份不只是单纯的罗列，而是更加智能化的图鉴书，献给喜爱漫画的你。',
null,    31.50     ,1,42,null,null);
insert into bookInfo values(seq_bookInfo_bid.nextval,'超级漫画形象5000例','    杯子蛋糕   ','  中国青年出版社',23,' 漫画中的形象有萝莉、正太、萌美少女、古典少女、软妹子、御姐、腹黑男、大叔等等，要了解各种角色类型的共性，需要花费大量的时间去搜集资料，并进一步整理。而本书为了解决这个问题，将各种类型的人物图片资源整合在一起，编辑成一本综合性的漫画图例参考手册。以便于读者了解每个动漫角色类型，以及符合这种类型的服饰。书中的动漫人物形象不仅方便漫画爱好者临摹，还能激发大家的创作灵感，帮助大家创作出有个性的角色。',
null,    43.70      ,1,56,null,null);

--语言
insert into bookInfo values(seq_bookInfo_bid.nextval,'《与美国小学生一起学英文》','蓝天出版社','蓝天出版社',31,'《与美国小学生一起学英文：有趣的阅读①②③》精选自美国小学一年级课本，《与美国小学生一起学英文：有趣的阅读④⑤⑥》精选自美国小学二年级课本，家长和老师可根据孩子的能力来选读。要学好英语，基础很重要。本书内容精选自原汁原味的美国小学生课本，囊括科学、社会、数学、美术、音乐五大类学科知识。通过阅读，孩子可以亲身感受美国的文化，逐步清晰英语的写作思路，学会融会贯通，举一反三。',
'',18.20,1,100,'','');

insert into bookInfo values(seq_bookInfo_bid.nextval,'《儿童彩色英汉图解词典》','尚枢文化','辽宁科学技术出版社',31,'集单词，句型，对话，图画和游戏为一体，以26个字母为顺序例举了1000个左右的常用单词和短语，书后更增加了数字、几何图形、奥运体育运动等方面的常见词汇。特设单词学习小游戏还可以极大地增强孩子学习的兴趣。《儿童彩色英汉图解词典》的智能化发音学习功能，让孩子就像和一个好朋友在一起学单词、说英语、玩游戏。',
'',12.50,1,100,'','');

insert into bookInfo values(seq_bookInfo_bid.nextval,'《宝宝的第1本学前英语词典 》','说词解字辞书研究中心','华语教学出版社',31,'根据教育部《幼儿园教育指导纲要》编写，是一本专门教小朋友认识英语单词、练习英语单词的书，按类编排，方便小朋友按类别逐个学习英语单词。每个单词都配有精美的彩色插图，标注音标，并且都有例句让小朋友能更好的理解单词的意思、用法。当然，小朋友还可以自己动动手进行描红练习。装帧精美活泼。',
'',19.80,1,100,'','');

insert into bookInfo values(seq_bookInfo_bid.nextval,'《二级-剑桥少儿英语全真模拟题-全新修订-内含磁带1盘.图书1册》','剑桥少儿英语培训及研究中心','西安交通大学出版社',31,'“剑桥少儿英语”等级考试是我国教育部考试中心从英国剑桥大学引进的面向6-12岁儿童的三个级别的英语等级考试系统。它旨在测定全世界非英语国家少年儿童的英语能力。该考试从1998年开始在我国每年举办两次，由教育部考试中心和英国剑桥大学考试委员会出题、阅卷和联合发证。通过全国授权的考点负责报名和组织考试。',
'',35.00,1,100,'','');

insert into bookInfo values(seq_bookInfo_bid.nextval,'《剑桥幼儿英语(4)(附VCD光盘一张)》：全彩图文版 ','剑桥儿童英语编写组','中国青年出版社',31,' 1 本套教材分为六册，供大、中、小班选用。共收入250个单词、10种基本句型和近200句幼儿日常生活交际会话。 2 本套教材集图、文、音、像、动画于一体；图书、CD、VCD、CD-ROM多媒体光盘配套出版、远程网络辅助教学；教参、教辅和教具配套，是一套全新的多媒体、立体化幼儿园英语教材。 3 本套教材按图书、图书配磁带、光盘配图书三种套装发行，配套赠送教学挂图和单词卡片。',
'',14.90,1,100,'','');

insert into bookInfo values(seq_bookInfo_bid.nextval,'《10分钟，让孩子爱上英语》：全彩图文版 ','姚章玲，吴芳','北京工业大学出版社',31,'《10分钟，让孩子爱上英语》根据儿童语言发展水平，选取生活中与孩子息息相关的最常见的28个场景，如看电视、过生日、认动物、买玩具等，并以片段式故事的形式呈现出来，在实践运用的过程中提高学习效率和知识掌握的牢固度。　',
'',14.90,1,100,'','');

insert into bookInfo values(seq_bookInfo_bid.nextval,'《我的第一本英文歌谣 》：全彩图文版 ','韩国三省出版社','光明日报出版社',31,'幼儿阶段，孩子进入了一个学习语言的关键期，在这个特殊的时期里，孩子掌握语言的能力非常惊人，而这个时期学习外语也是关键时期。研究证明，孩子对英文歌谣的学习，不仅可以积累词汇，还可以培养纯正的语感，并激发孩子学习的兴趣。',
'',11.70,1,100,'','');

insert into bookInfo values(seq_bookInfo_bid.nextval,'《Discover China》练习册-走遍中国-3-(含1张CD) ','王丹','外语教学与研究出版社',31,'《走遍中国练习册3》是《走遍中国学生用书3》的配套练习册。《走遍中国》系列的读者对象为青年汉语入门学习者，将汉语知识和ELT教学方法融合，旨在开发一种形式新颖、内容科学、练习活泼丰富、教学配套产品服务齐全的新型汉语教材。',
'',12.50,1,100,'','');

--文化
insert into bookInfo values(seq_bookInfo_bid.nextval,'《不可不知的十二四节气常识》','梅子','线装书局',32,'本书是一部浓缩的小百科全书，不仅能够让我们了解到农事，还是一部极具实用性的生活必备书籍。了解二十四节气的常识，无论你是普通人还是达官显贵，都能让你的人生变得丰富多彩，让你的生活变得更加科学合理等内容。',
'',45.00,1,100,'','');

insert into bookInfo values(seq_bookInfo_bid.nextval,'《20世纪中国学术大典:语言学 》','吴阶平，季羡林，林焘','福建教育出版社 ',32,'《20世纪中国学术大典》是一部以条目形式总结百年来自然科学、工程技术、牲会科学、人文学科领域中国学人学术成果的大型工具书。本书按学科分类分卷出版。各卷以学科体系为框架，分学科研究、专题研究、学术事件、学术人物、学术名著名篇、学术机构团体、学术刊物等7类条目。',
'',27.20,1,100,'','');

insert into bookInfo values(seq_bookInfo_bid.nextval,'《北京宣南会馆拾遗》','白继增 ','中国档案出版社 ',32,'《北京宣南会馆拾遗》的作者继增先生以北京宣南为地域空间，以各省会馆为研究客体，详细记述北京宣南会馆的发展历程和存续脉络，史料详实，考辨清晰，既有其四十年在宣南的生活积累，也是其二十年宣武工作生涯及十年退休钻研历程的写真，体现了其对宣南的热爱和对宣南文化研究的贡献。',
'',9.90,1,100,'','');

insert into bookInfo values(seq_bookInfo_bid.nextval,'《文化批评往何处去：八十年代末后的中国文化讨论》','徐贲 ','吉林出版集团有限责任公司 ',32,'文化批评基于独立的思想和判断。它是知识分子介入社会事务和公共政治的公民行为；它剖析、评价“共同的善”相关的政治文化、社会观念和群体价值，难免会触及“不方便”的政治敏感议题。',
'',18.20,1,100,'','');

insert into bookInfo values(seq_bookInfo_bid.nextval,'《中国传统文化导论》','朱汉民','湖南大学出版社',32,'《中国传统文化导论》系统地阐述了中国古代哲学、传统宗教、伦理道德、科学技术、古典文学、史学、教育等内容，并从宏观上对中国传统思维方式和文化精神进行综合分析，为高校学生全面了解传统文化知识、把握传统文化精髓，提供了一条便捷路径。',
'',22.90,1,100,'','');

insert into bookInfo values(seq_bookInfo_bid.nextval,'《起名手册》','长河 ','百花洲文艺出版社',32,'',
'',16.90,1,100,'','');

insert into bookInfo values(seq_bookInfo_bid.nextval,'《浦江迎会》','徐方镇 ','浙江摄影出版社 ',32,'浦江迎会，俗称抬阁，综合了戏剧表演、音乐演奏、杂技体育、扎制雕刻等诸种艺术。“会”的内容，主要选取古装戏剧的某个精彩场面，如《姜太公钓鱼》，组成抬阁，配以什锦班演奏这一本戏的调曲。浦江迎会，被誉为“流动的戏剧，灵动的杂技雕塑”。',
'', 13.0,1,100,'','');

insert into bookInfo values(seq_bookInfo_bid.nextval,'《你应该知道的180个节日》','吴紫桐','哈尔滨出版社 ',32,'本书收集了世界上不同国家、不同民族的具有重要影响和意义的180个节日，涵盖了天文、神祗、自然、信仰、经济、社会、人戈、审美等方面，按节日的时间顺序逐一介绍了节日的来历（文化渊源）故事、庆祝活动、节日饮食、风俗禁忌、传统服饰等等，准确地阐述了这些节日博大精深的文化内涵以及源远流长的历史文明。',
'',7.90 ,1,100,'','');

--历史
insert into bookInfo values(seq_bookInfo_bid.nextval,'《民国往事：一本书讲透民国幕僚真相》','宁公子 ','国际文化出版公司',33,'袁世凯的大哥徐世昌、被袁世凯视为“旷世奇才”的杨度、皖系首领段祺瑞的心腹徐树铮、人称“打败全日本”的战略家蒋百里、痴迷于“议会”政体的吴景濂、孙中山的“护国军师”陈其美、国民党总统府“职业秘书长”胡汉民、更有策士陈宧仿苏秦张仪奔走，合纵连横……',
'',14.00,1,100,'','');

insert into bookInfo values(seq_bookInfo_bid.nextval,'《战国杀》','余耀华','知识出版社 ',33,'《战国杀》旨在挖掘廉颇、白起、李牧、王翦四人的战功、趣事、性格以及对后世的影响，以求更全面地了解四大名将，了解那段尘封的历史。',
'',9.20 ,1,100,'','');

insert into bookInfo values(seq_bookInfo_bid.nextval,'《春秋那杆秤：齐桓霸业有多重》','刘兆','知识出版社 ',33,'《春秋那杆秤：齐桓霸业有多重》主要内容包括：两个男人的第一次亲密接触；鲁桓公的千古绿帽子；爱江山更爱美人；打架高手齐襄公；脑残愤青子突；一个西瓜引发的血案；公子无知很无知；小白快跑；齐鲁第一战等。',
'',9.60 ,1,100,'','');

insert into bookInfo values(seq_bookInfo_bid.nextval,'《张謇自述》','张謇','安徽文艺出版社 ',33,'《张謇自述》是“晚清名人自述系列”的一种，为清末状元，中国近代著名实业家、政治家、教育家张謇的部分文集，内容既有其生平自述，又有其实业建设的成果，以及为盐政改革、奖励农牧等所起草的计划书、意见书和提案等等，能够体现其传奇历程和作者在民族工业和棉纺事业的奋斗经历和不懈追求，具有珍贵的史料价值和启示意义。',
'',20.00 ,1,100,'','');

insert into bookInfo values(seq_bookInfo_bid.nextval,'《战国志》','嵩阳云树','知识出版社',33,'本文行文，依据严谨的历史，配以文学的笔法，力求最真实的反映那个风光无限而又惨烈无比的时代。春秋传大义，战国起兵戈，古来纷争何时休矣？只手擎天，青史留名，凭智凭勇凭才干，是英雄不必问出身；嵩阳有铁肩，云树萌宏意，战国七雄尽入画卷！纤毫写史，文坛立万，惠人惠己惠天下，好文章自有警世声。',
'',13.60,1,100,'','');

insert into bookInfo values(seq_bookInfo_bid.nextval,'《人类群星闪耀时》','茨威格','国际文化',33,'本书是张荫麟短暂的一生留下的唯一著作，但已足见作者深邃敏锐的识见和渊博厚实的学养，通透又睿永的思想。本书的撰写，在当时是他专为清华大学学生作为历史教材的课本讲义。所以，在形式上就更为生动活泼，易读易解，语言凝练晓畅，行文优雅，无半点枯涩呆滞，但同时又富思想内涵和理论深度。',
'',14.00,1,100,'','');


insert into bookInfo values(seq_bookInfo_bid.nextval,'《人类群星闪耀时》','茨威格','国际文化',33,'人类群星闪烁时，决定人类历史的10个瞬间',
'',14.90,1,100,'','');

insert into bookInfo values(seq_bookInfo_bid.nextval,'《让历史还原历史》','博闻','电子工业出版社',33,'本书站在时代的大视角上，抛却历史羁绊，丢掉权威评判，借助现代科学方法和手段，进行了长达数年的无倾向性考证后，做了客观解读。这不是对历史的亵渎和叫板，也不是对历史人物的追杀和剿灭，而是在坚守道德底限的原则下，维持良知和正义，旨在还原那些早已尘封的历史。',
'',11.20,1,100,'','');

--设计
insert into bookInfo values(seq_bookInfo_bid.nextval,'《写个大家看的设计书（第三版）》','Robin Williams','人民邮电出版社',41,'此书是非常经典的入门书籍，如果你从来没有尝试过做设计，这可以成为你可以读的第一个设计书。',
'',11.90,1,100,'','');

insert into bookInfo values(seq_bookInfo_bid.nextval,'《点石成金》','史蒂夫.克努克','机械工业出版社',41,'此书薄并且有趣，书本身的体验和它所讲述的原则保持一致，成为一本阅读体验非常好的书。读完它你具备了一些对于用户体验的基础知识和原则，但要记住非常基础，推荐入门者可读。',
'',9.80,1,100,'','');

insert into bookInfo values(seq_bookInfo_bid.nextval,'《平面设计法则》','德比.米尔曼','中国青年出版社',41,'关于平面设计法则系列的书讲得都大同小异。',
'',7.56,1,100,'','');

insert into bookInfo values(seq_bookInfo_bid.nextval,'《设计心理学》','唐纳德.A.诺曼','中信出版社',41,'会改变你看待世界的方式的一本书，改变你的设计评价标准。虽然很薄，很老。但里面讲述的原则却长久不衰。
设计是双向的。设计是为了要解决问题的。形式追随内容。',
'',11.72,1,100,'','');

--绘画
insert into bookInfo values(seq_bookInfo_bid.nextval,'《秘密花园》','乔汉娜贝斯福','北京联合出版社',42,'一本探索奇境的手绘涂色书。',
'',24.50,1,100,'','');

insert into bookInfo values(seq_bookInfo_bid.nextval,'《简笔画5000例一本就够》','涂涂猫','人民邮电出版社',42,'一本就够，儿童简笔画精品，幼儿简笔画大全。幼儿绘本最好的选择。',
'',32.60,1,100,'','');

insert into bookInfo values(seq_bookInfo_bid.nextval,'《铅笔素描从入门到精通》','飞乐鸟','水利水电出版社',42,'新手画画启蒙必读。本书作者飞乐鸟是国内新生代插画家，80后漫画家，擅长Q版、清新版、温情治愈系等多种绘画风格。创作有《花之绘》、《动物绘》、《色铅笔的故事》、《飞乐鸟的手绘时光》系列等30余中具有创新概念的作品，长期荣登当当网、亚马逊、新华书店等同类书畅销榜。',
'',29.80,1,100,'','');

insert into bookInfo values(seq_bookInfo_bid.nextval,'《花之绘》','飞乐鸟','水利水电出版社',42,'《花之绘》中记录了38种花的色铅笔图绘，是花图绘的首选书籍。',
'',21.80,1,100,'','');

--书法
insert into bookInfo values(seq_bookInfo_bid.nextval,'《中国书法：167个练习》','邱振中','中国人民大学出版社',43,'《中国书法：167个练习》是一部以167个练习组成的书法技法教材，这167个练习包括了传统书法和现代书法创作的全部基本技法其中包括一些从未被讨论过的内容。在对历代作品进行深入、细致的形态分析的基础上，作者建立了一种以才能的全面发展为主旨的的书法训练体系。在传统技法之外，还引入了由现代视觉经验发展而来的重要技巧。',
'',34.90,1,100,'','');

insert into bookInfo values(seq_bookInfo_bid.nextval,'《汉字书法之美》','蒋勋','广西师范大学出版社',43,'《汉字书法之美》是写给每一个中国人的书法美学，唤醒每个中国人的书法记忆。作者以其独特的美学情怀，述说动人的汉子书法故事。文字编织成画面，我们走进了那些古老却又现代的汉字时间光廊，东方书写的敬与喜悦，就在你我的指尖。',
'',22.80,1,100,'','');

insert into bookInfo values(seq_bookInfo_bid.nextval,'《书法指南》','俞剑华','当代中国出版社',43,'《书法指南》，绝版的民国小书馆，陈师曾入室弟子、书法大家对书法从进阶到提升的全面指导。',
'',34.70,1,100,'','');

insert into bookInfo values(seq_bookInfo_bid.nextval,'《颜真卿楷书习字帖》','路振平','浙江人民美术出版社',43,'中国书法教程-颜真卿楷书习字帖',
'',18.90,1,100,'','');


--励志
insert into bookInfo values(seq_bookInfo_bid.nextval,'你只需努力 剩下的交给时光',' 盒饭君','台湾出版社',51,'生活——在人生路上，不要怀疑生活欺骗了你，你的生活从来都是自己走出来的。既然不知道未来会怎么样，你又恰好对未来有所期待，那么遵从自己的内心，遵从自己的选择，去努力，去奋斗，剩下的就是坚持。不用对未来患得患失，不用对未来急功近利，明天迟早会到来，你要做的是用最好的姿态，去迎接明天的太阳。不用把时间浪费在不必要的烦恼上，谁的青春不迷茫，不用着急，你的努力和坚持配得上一个更好的答案。',
null,18.00,1,50,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'超级心里暗示术','（法）库埃 ，卫青 编译 ','武汉大学出版社',51,'暗示，尤其是自我暗示，是一门新兴的学科，然而，它又如同我们这一世界一样古老，并且一直被很多人错误地理解、错误地研究。《超级心理暗示术》是“自我暗示之父”爱米尔·库埃的代表之作。书中，他向读者传授了如何积极运用自我暗示的魔力，改变自己和他人的身心，过一种积极健康的生活。',
null,16.00,'1',50,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'寂寞是毒，也是解药',' 周思成','北京联合出版公司',51,'本书为新东方人气王、百万册畅销书作者周思成讲述自己如何从一个普通大学生，一路备受挫折、不断在寂寞中“升级”，成长为新东方人气教师的心路历程，给读者展现了一个毫无背景，只凭自己努力的成功案例。',
null,23.90,1,50,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'没什么搞不定',' 祈莫昕','知识出版社',51,'，遵从自己的选择，去努力，去奋斗，剩下的就是坚持。不用对未来患得患失，不用对未来急功近利，明天迟早会到来，你要做的是用最好的姿态，去迎接明天的太阳。不用把时间浪费在不必要的烦恼上，谁的青春不迷茫，不用着急，你的努力和坚持配得上一个更好的答案。',
null,15.60,1,50,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'怕，就会输一辈子',' 【美】奥里森·马登 ，苏茜 译','北方妇女儿童出版社',51,'本书是一种力量，它能让畏首畏尾者敢于拼搏，找回丢失已久的勇气；本书是一种鼓励，它能让迷茫者精神振作，重新体味收获的快乐；本书是一种警醒，它能让踌躇不前者果断前行，重新体会期待的兴奋。',
null,19.60,1,50,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'卡耐基当众演讲的艺术',' （美）戴尔·卡耐基（Carnegie，D.） ，肖文键，马剑涛译','中国华侨出版社',51,'卡耐基是自我提升领域的先行者，他关于演讲技能的观点影响了无数人。今天，我们仍能从中受益匪浅。华盛顿一家报纸曾这样评价卡耐基先生：“千百万人受到他的影响，他的这些哲理如文明一样古老，如‘十诫’一样简明。',
null,26.00,1,50,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'卡耐基沟通的艺术与处事智慧',' 中国华侨出版社','中国华侨出版社',51,'《卡耐基沟通的艺术与处世智慧》教会人们克服畏惧、建立自信，实现良好的人际沟通，开发原本拥有，但却不曾利用的潜能。阅读此书，可以从日益增长的自信和热忱中，得到生活的力量，增进了沟通意见的能力，学会了做人处世的技巧。',
null,19.99,1,50,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'羊皮卷（权威收藏版）',' 卡耐基等，杨奕编 ','企业管理出版社',51,'2000多年前，在阿拉伯地区秘密流传着写在10张羊皮上的秘籍，上面记录着经商与致富的秘诀，谁要是得到它，就可以随心所欲拥有想要的财富。相传一位叫海菲的贫苦青年曾在神的指引下得到了这10张羊皮卷，最终成为富可敌国的人。',
null,35.00,1,50,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'人性的弱点',' 卡耐基','中国商业出版社',51,'《人性的弱点》汇集了卡耐基最震撼人心的思想精华，是作者最成功的励志经典。无数读者通过阅读和实践书中介绍的各种方法，不仅走出困境，有的还成为世人仰慕的杰出人士。',
null,29.99,1,50,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'让内心强大起来·读者文摘',' 杨晖','北京工业大学出版社',51,'在人的一生中，学生时期是积累文化知识、塑造思想品德的重要时期。要想开阔自己的视野，丰富自己的人生，在同龄人中成为佼佼者，仅凭课本上的知识是远远不够的，我们还必须多读书、读好书。',
null,22.00,1,50,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'榜样的力量',' 周文敏 著','北京工业大学出版社',51,'所谓正能量也是榜样的力量，企业的领导者应该是作出榜样的人。周文敏编著的《榜样的力量--找到薪火传递的正能量》从领导者推进榜样的力量的角度出发，以培养自身影响力及利用自身的优势去感召、激励员工为中心，通过实用、简单、有效的向员工传递正能量',
null,24.00,1,50,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'生活永远值得期待',' 徐淑红','中央编译出版社',51,'本书围绕平凡人日常生活中的问题娓娓而谈，口吻亲切，平易近人，文采飞扬，它能够使疲惫时的人们得以放松身心，使沮丧中的人们得以重拾信心，使抑郁中的人们能够找到快乐，使孤独中的人们能够发现人生的另一种美。',
null,22.70,1,50,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'智慧点亮心灵',' 钱丹慧','杭州出版社',51,'人的一生，也许平庸无为，也许功绩显著，或灿烂夺目，或暗淡无光，探其究竟，其中的因素当然很多。人的生命很微小，也很伟大，此中尤见神奇。在我们的生活中，也许一次奇遇，也许是一番顿悟。',
null,9.9,1,50,null,null);

--管理
insert into bookInfo values(seq_bookInfo_bid.nextval,'塑造领袖特质',' [美]郝伯特·N·卡森 著','光明日报出版社',52,'每一个美国人都有想成为领导者的雄心壮志，这一点很值得赞赏。而这种精神的付于实践，在很大程度上，造就了美国，乃至美国人在当今世界的霸主地位。',
null,29.8,1,50,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'领导力',' 武彬 著 ','武汉大学出版社',52,'斯坦福大学第一次面向世界的公开课',
null,23.5,1,50,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'总经理按制度办事',' 丁振宇 著','北京工业大学出版社',52,'总经理用制度办事全书》共分八章：分别介绍了公司、企业经营管理活动的基本理念和职能；对财务工作的监督；对生产活动的监督；对产出（服务）质量的监督；对营销活动的监督；对物流活动的监督；对行政事务的监督，以及对学习、企业战略发展的监督。',
null,22.00,1,50,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'一分钟执行力',' 丁振宇 著 ','北京工业大学出版社',52,'如何快速提高执行力，已成为当前领导者急需解决的问题。正是基于以上因素，我们编纂了这本《一分钟提高执行力》。其宗旨就是为了帮助领导者和员工真正找到执行不到位的根本原因，彻底根除工作中拖拉、应付等现象，从而快速提高执行能力，实现工作的高效运转。',
null,28,1,50,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'项目管理要素',' （英）丹尼斯·洛克 著','东方出版社',52,'《项目管理要素》是丹尼斯·洛克所编撰的综合性巨著《项目管理》的初级读本，其第二版是在《项目管理》第七版本所做的修改和补充的基础上编写的，它对正文内容进行了详细修订，并重新插入了更具有说服力的直观明了的图解。',
null,36,1,50,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'给你一个团队，你能怎么管',' 赵伟 著','江苏文艺出版社',52,'作者用他参与海外上市公司与国内民营企业管理的亲身经历，分享团队的建设与管理经验。他通过简洁有趣的描述，翔实动人的案例，为我们揭示管理的真相，告诉你应该如何建设和管理一个团队，内容富有系统性与针对性，简单易懂，容易上手，尖锐深刻。',
null,29.9,1,50,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'不懂说话，你怎么带团队',' （日）吉田幸弘 著','北京联合出版公司',52,'用一句话成功引导下属。看似微不足道的一个措辞，既有可能让下属干劲十足地主动投入工作，也有可能令下属陷入沮丧。<br>本书配合事例，针对不同场合——附和、询问、夸奖、委托、鼓励、传达、责备——进行讲解，教我们如何采取合适的措辞，如何用一句话拯救陷入的困境',
null,30,1,50,null,null);

--经济
insert into bookInfo values(seq_bookInfo_bid.nextval,'华尔街金融真相',' 陈思进 著','中国商业出版社',53,'华尔街到底隐藏了什么？《华尔街金融真相》是一本捅开华尔街马蜂窝的书，看清华尔街金外衣下的真相！人人都说华尔街是玩阴谋的地方，他们制定游戏规则，通过金融工具上演一场合法的赌博，而结果输的总是你。',
null,36,1,50,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'中国红利',' 黄钟苏 著','时事出版社',53,'《中国红利:解读经济大趋势与投资大方向》是一本关于中国未来的书，也是一本关于证券投资的书。无论是现在还是将来的人们，当他们回顾历史的时候，他们都会对改革开放以后的中国发展印象深刻。　',
null,29.8,1,50,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'每天一堂理财课',' 王新荣  著','北京工业大学出版社',53,'《每天一堂理财课》归纳了全新的理财理念，配以大量的理财案例，不仅语言通俗易懂，而且具有很强的可操作性，实现了理论与实践的完美结合，尤其有利于渴望参与投资理财但又不知道如何开始的朋友进行投资前的知识准备。',
null,33.8,1,50,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'金钱创造历史',' 亚历山大·容 迪特马尔·皮珀， 赖纳·特劳布 ','外文出版社',53,'这是一本讲述经济发展史的书。书中描述了从11世纪所谓的金融业开端，一直到新近的经济衰退，金融业整个发展和起伏的过程。《明镜》周刊（Spiegel）的三位重量级人物，客观详实地记录了资本如何以它全部的运作方式影响着我们的历史。',
null,39.0,1,50,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'股票期货',' 朱堰徽','武汉大学出版社',53,'本书从股票期货的基本原理和实际应用两个方面系统地介绍了这种新兴的衍生金融工具，全书共分九章：第一章“股票期货概述”从期货与金融期货的概念入手，对股票期货的定义、产生与发展、特征与功能进行了阐述，并把股票期货与其他股票资产加以分析比较。',
null,17.00,1,50,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'货币银行学',' 曾红燕 ','中国物资出版社',53,'《货币银行学（1版）》是为了满足高职高专经济、金融类专业学生学习金融基础理论的需要而编写的。《货币银行学（1版）》较全面地阐述了货币银行学的基本理论和基础知识，在结构体系安排和内容取舍上，力求适应现代金融发展对人才知识结构的要求。',
null,32,1,50,null,null);

--服饰
insert into bookInfo values(seq_bookInfo_bid.nextval,'做自己的时尚造型师',' 小乐 主编  ','辽宁科学技术出版社',61,'做自己的时尚造型师（乐在其中）》着重从时尚造型出发，针对大家最关注的发型设计、穿衣技巧，从性格、体型、季节、场合、风格来讲解适合不同人群的造型装扮。《做自己的时尚造型师（乐在其中）》风格百变，图文并茂，让读者一目了然的就能找到自己最需要的服饰。',
null,26.8,1,50,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'派对搭配',' 北京《瑞丽》杂志社  ','中国轻工业出版社',61,'《瑞丽BOOK：派对搭配SHOW500款》是针对你这样的女性朋友而编写的。里面主要介绍了派对猫女特质、派对衣橱、社交磁石搭配和派对美酒VS PARTY美女四部分内容。全书内容丰富，语言通俗，图文并茂，适合广大女性朋友阅读。',
null,29.8,1,50,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'你有明星范儿',' (韩)金素熙 ，程玉敏 杨轩 译 ','中国青年出版社',61,'《你有明星范儿(跟风格偶像一起挑战最in造型)》是一本能指引你实现风格升华的作品，这里有女人们想要演绎的各种风格。基本款、性感风、可爱风、别致风、优雅风，每种风格都有发型、妆容、穿衣、配饰的详细建议，帮助女人们从头到脚、由内而外地活出风格。',
null,31.5,1,50,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'不靠体型靠造型',' 史焱  ','中国青年出版社',61,'你知道女人衣橱里最重要、最重要的那件衣服是什么？穿小黑裙和小白裙时，为什么要遵循截然不同的穿搭法则？在职场上陪你冲锋陷阵的最佳单品是哪件？你知道第一视觉三角区在哪里吗？如何打造这个目光焦点最集中的区域？',
null,32,1,50,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'服装部件缝制工艺',' 周捷 ','东华大学出版社',61,'本书从介绍缝制基础知识、方法与技巧入手，阐述了不同种类的领子、袖子、口袋、开衩、门襟、拉链及装腰等缝制工艺内容。内容覆盖面广，针对性强，以图配文的形式，突出介绍不同品种的缝制要点和诀窍。全书图文并茂，让读者一目了然。',
null,24.5,1,50,null,null);

--家居
insert into bookInfo values(seq_bookInfo_bid.nextval,'家装宝典：餐厅',' 布阳明，潘建华  ','黑龙江科学技术出版社',62,'家装宝典：餐厅》为《家装宝典》系列中的一本，该套书是全面介绍家庭装饰装修全过程的大型彩色精印丛书，全书分客厅、卧室、餐厅、厨房、门厅与走廊、书房与工作室、卫生间、儿童房与青少年房、整体家居（大户型），整体家居（中小户型），共计l0册。',
null,23,1,50,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'家居色彩宝典·卧室篇',' 数码创意 ','中国纺织出版社',62,'在家居装修中，对于色彩的把握与选择是十分重要的。本书以卧室的装修布置为例，通过八种常见的不同装修风格(沉稳、纯净、靓丽、自然、浪漫、混搭、温馨、豪华)的举例说明,以大量的图片展示和详尽细致的文字说明，向您诉说在家居装饰时，所要注意的色彩搭配要点。',
null,20.30,1,50,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'梦想家居',' 凤凰空间 ','江苏科学技术出版社',62,'本书从风格分类入手，将内容清晰呈现。每个部分都用图文并茂的方式解读设计技巧，每个空间配一小段文字，做到一一对应，把对家装重要区域的设计装修都展现在这套书里，给读者既完整专业又极具可读性的一套家装设计丛书。',
null,29.8,1,50,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'欧式客厅',' 《欧式客厅》编写组 著 ','福建科学技术出版社',62,'欧式客厅》是一部关于室内设计的图集，介绍了居室装修如何进行相关的准备工作，配有大量客厅装修的设计彩图，并由家装专家为您讲解装修过程中的易遇到的难题。',
null,19.8,1,50,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'装修常见问题120例',' 李江军 ','中国电力出版社',62,'基本信息 商品名称： 装修常见问题120例 出版社： 中国电力出版社 出版时间：2016-01-01 作者：李江军 ',
null,32,17,50,null,null);

--育儿
insert into bookInfo values(seq_bookInfo_bid.nextval,'育儿百科全书',' 周新华，夏望松 著 ','安徽科学技术出版社',63,'《育儿百科全书》以图文并茂的形式，用轻松、简洁、活泼的语言，南北京、南京等地妇产科和儿科经验丰富的权威专家为广大孕产妇朋友提供权威、系统、详细的孕育指导，告诉您在孕前、孕中、分娩中以及分娩后最关心的问题。',
null,25,1,50,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'西方育儿宝典',' 程淮 ','工人出版社',63,'本书凝结了西方几百年来行之有效的育儿经验，作者考虑到东方家庭的独特教育气质，在经过精挑细选后为中国的父母们讲述了西方教育中各年龄段孩子的成长特点和实用可靠的教育方式。',
null,29.5,1,50,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'睡前故事',' 青苗  ','知识出版社',63,'丛书分为四册。每一册都包含经典故事、益智故事、好习惯故事、名人故事和民间故事。大图大字,加注拼音，并配以精美的图画，故事的情节温馨平和，且大多数都以美好的结局结尾。',
null,24.8,1,50,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'好奶爸育儿经',' 王晓东 著  ','作家出版社',63,'《好奶爸育儿经》是国内少见的由男人撰写的育婴类书籍。该书作者王晓东是国内品牌界具有一定影响的资深人士，其自嘲由于相貌一般被迫忙于事业，属于典型的完婚晚育。在喜得贵女后，有感于老人、妻子在生、育孩子中的辛苦，根据自己和妻子数万字的育婴手记整理成书。',
null,19.10,1,50,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'孩子生病了妈妈怎么办',' 刘海燕 著 ','吉林科学技术出版社',63,'海燕医生是一位热爱医学事业并且致力于医学科普知识宣教的爱心儿科医生，同时她也是一位13岁孩子的母亲。这样的双重身份，使她对孩子的身、心健康都有着不同于一般家长的感知。因为她是一名医生，所以她有着多于常人的医学知识和临床经验；但她也是位平凡的母亲，有着和大多数妈妈一样的育儿烦恼。',
null,25.9,1,50,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'现代育儿大百科',' 青岛出版社 著  ','青岛出版社',63,'本书从襁褓之中的新生儿开始讲起，详细介绍0~5岁每个月龄的宝宝发育状况与性格特征、育儿要点、日常照顾方法、不适处理对策、辅食营养餐、生活技能培养方案、益智训练方案、早教启蒙方案、亲子游戏方法、潜能开发方案等内容，可谓是面面俱到，实用有效，是新手爸妈的育儿早教指南宝典。',
null,32.4,1,50,null,null);

--军事理论
insert into bookInfo values(seq_bookInfo_bid.nextval,'20世纪中国学术大典:军事科学 ','马天保','福建教育出版社',71,'《20世纪
中国学术大典》是一部以条目形式总结百年来自然科学、工程技术、牲会科学、人文学科领域中国学人学术成果的大型工具书。 　　《20世纪中国学术大典》按学科分类分卷出版。各卷以学科体系为框架，分学科研究、专题研究、学术事件、学术人物、学术名著名篇、学术机构团体、学术刊物等7类条目。其中学科研究和专题研究为主体内容，占各卷的主要篇幅。 　　1994年7月，我社初步提出《20世纪中国学术大典》的出版构想，后曾多次向中国科学院、中国社会科学院、北京大学、清华大学等学术机构和高等学府的有关专家咨询，并召开多次座谈会，对选题的意义和价值进行论证和评估，得到学界权威人士的充分肯定。1996年开始制订编纂计划，完成总体框架设计，并开始向权威专家组稿。同年，新闻出版署将本书列入国家“九五”重点图书出版规划。',
null,72.50,1,100,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'当好一线指挥官:做焦裕禄式的“四有”干部',' 焦裕禄干部学院编著','华中科技大学出版社',71,'“公仆情怀、求实作风、奋斗精神、道德情”，总书记高度概括的焦裕禄精神，其实质是始终与群众心连心、与人民保持血肉联系的宗旨意识。“焦裕禄同志是县委书记的榜样，也是全的榜样”。全同志都要努力做焦裕禄式的好员、好干部，以实际行动贯彻执行好中央的两学一做专题教育活动，向“三严三实”好干部、好员的代表焦裕禄同志学习，做百姓的贴心人、的好干部。',
null,25.50,1,100,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'西方军事政治学评论：美国经典文武关系思想','高民政',' 时事出版社',71,'文武关系是西方军事政治学理论的一个核心议题。拉斯韦尔、亨廷顿、简诺威茨在西方乃至世界社会科学界都是享有很高盛誉的学术大师，他们的文武关系著作及观点在西方文武关系研究领域具有开创性的影响，已经被奉为西方军事政治学理论的经典。评介拉斯韦尔的“卫戍国家思想”、亨廷顿的“文人治军理论”、简诺威茨的“军事专业主义”，将有助于人们进一步深刻认识西方军事政治学理论的特点与实质，准确把握资本主义国家军政关系制度模式与实践行为的思想来源和理论基础。',
null,16.50,1,100,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'国防教育教程','  姜建良主编','中南大学出版社',71,'暂无',
null,38.60,1,100,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'竞争性装备采购论',' 张跃东','国防工业',71,'本书主要从三个方面对竞争性装备采购问题进行研究。一是“市场特点?适用范围”，研究装备市场有何不同于普通商品市场的特点及其对开展竞争性装备采购产生的影响、竞争性装备采购分类和方式及其适用条件和环境等基本问题。二是“效率优势?潜在风险”，讨论到底为什么要大力推行竞争性装备采购、竞争性装备采购过程中究竟蕴含哪些风险及应如何发挥竞争性装备采购效率优势和规避风险等问题。三是“市场条件?市场建设”，探讨顺利开展竞争性装备采购需要哪些基本市场条件、我国装备市场建设现状及如何加快竞争性装备市场条件建设等问题。',
null,38.60,1,100,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'鏖战菲律宾',' 本书编委会',' 中国铁道',71,'暂无',
null,14,1,100,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'二战经典战役纪实-(全10册) ','  本书编委会','中国铁道',71,'暂无',
null,130.00,1,100,null,null);

--世界军事
insert into bookInfo values(seq_bookInfo_bid.nextval,'英国战列巡洋舰全史 ',' 江泓','华中科技大学出版社',72,'战列巡洋舰是在世界海军史上短暂出现却又红极一时的著名舰种，它结合了战列舰的火力和巡洋舰的速度，具有修长的舰体和美观的外形。作为最早建造战列巡洋舰的国家，英国皇家海军拥有过世界上数量最多也最著名的战列巡洋舰，它们在两次世界大战中发挥过重要的作用。',
null,31.10,1,100,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'大国航母（第一部）（大国利器，兴衰标志；没有航母，何以成大国）','  房兵','中国长安出版社',72,'南海黄岩岛争端，中日钓鱼岛危机，中国航母出海，你应该关注些什么？建军85周年倾情献礼，中国著名航母专家、国防大学房兵上校直击航母百年发展之路，献策中国航母大战略，与14亿中国人一起激情欢呼中国航母时代的到来！大国利器，兴衰标志！没有航母，何以成大国？航母百年，有力证明：凡是世界性强国，都坚决拥有航空母舰！凡是拥有航空母舰的大国，都一定会成为世界性军事强国！',
null,16.40,1,100,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'B-29来了-从波音到东瀛',' 甘本祓','科学普及',72,'本书将介绍B-29战略轰炸机“十年磨一剑”的创新史，以及与之相关联的美国空军的创业史和战略轰炸的战斗史。通过对B-29的审视，我们将可以从一个特殊的视角，看到美国如何在二战中崛起。',
null,48.80,1,100,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'哈尔科夫1942','  张大卫','中国长安出版社',72,'本书是国内全面介绍1942年哈尔科夫战役的著作，该战役在苏德战争中是极具代表性和极富戏剧性的战役。在该战役初期，苏军占据主动，先行进攻且让德军吃了不小的亏，但恢复过来的德军扭转了战局。不过该战役被淹没在1943年第三次哈尔科夫战役的历史余晖中，不太为战史爱好者所关注。本书参考了30余本德文、英文、俄文、中文专著，以全景描写的方式从苏德双方诠释，同时对被国内外均忽视的1942年1月巴尔文科沃战役进行了详细的描写，揭示了其与同年5月发生的哈尔科夫战役之间的紧密联系，对军事爱好者来说，是填补知识空白的重要参考书。',
null,36.30,1,100,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'俄罗斯情报组织揭秘',' 艾红，王君，慕尧','时事出版社',72,'本书以俄罗斯情报机构的历史演变为主线，全面介绍了契卡、克格勃、格鲁乌、联邦安全总局及对外情报总局等苏联和俄罗斯时期的主要情报机构，回顾了克格勃这个世界上最大的情报王国孕育发展、盛极而衰、分崩离析的历史演变，描绘了其继承者劫后重生、改组重整的发展轨迹，展现了俄罗斯情报机构从集权走向分立，又再度整合的历史脉络，从新的视角对当代俄罗斯情报机构在工作机制、情报立法和情报官员管理等方面的特点进行了系统的梳理，反映了当代俄罗斯情报机构顺应时代变迁，意图重振雄风的发展态势。同时，本书通过分析介绍苏联和俄罗斯时期在情报工作领域具有重大影响的重要人物、代表事件、传奇特工和变节者，精彩再现了俄罗斯情报工作历史中的一个个经典片段。',
null,15.80,1,100,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'二战德国“虎”式坦克部队征战全记录',' 郑鑫，丛丕编译','中国长安出版社',72,'暂无',
null,45.40,1,100,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'日本海军舰载兵器大图鉴',' 唐茜编著','中国长安出版社',72,'暂无',
null,38.90,1,100,null,null);

--史家名著
insert into bookInfo values(seq_bookInfo_bid.nextval,'史记精华-中国书籍国学馆-(全四卷)',' 中国书籍国学馆编委会','中国书籍出版社',73,'《史记》是中国第一部纪传体通史，是二十四史之首。中国书籍国学馆编委会编写的《史记精华(共4册)(精)》共130篇，52万余字。记载了中国上古传说中的皇帝时代至汉武帝共三千年的历史。司马迁以“究天人之际，通古今之变，成一家之言”，创造出一部史家之绝唱、无韵之离骚。',
null,129.30,1,100,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'资治通鉴精华',' 《中国书籍国学馆》编委会编','中国书籍出版社',73,'暂无',
null,129.30,1,100,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'史记选','  商务印书馆','商务印书馆',73,'《史记选》，清初著名学者储欣所编选，选录作品五十五篇。编选者对于文章精彩部分用不同的符号加以圈点，并有大量的评点，用语长短不一，恰到好处，或指出词句作用，或评点章法布局，或揭示史公深意，或探讨前后关联性等。所选篇章之末亦多有评语，盛赞史公文章之精彩处，与文中评语形成照应。该书是清康乾时代较为有影响的《史记》选本之一。',
null,36.00,1,100,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'行云流水记往',' 沈鹏年','上海三联书店',73,'《行云流水记往（上下）》记述了沈鹏年的传奇 人生及其年轻时从事现代史和现代文学探索的足迹。全书共分仰止篇、影视篇、探源篇、海外篇和友谊篇 等五个篇章。本书内容全面，图文并茂，是我们了解 和研究沈鹏年的优秀参考读物。',
null,29.80,1,100,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'国语',' 左丘明',' 上海古籍',73,'《国语》是中国最早的一部国别体著作，记录了周朝王室和鲁国、齐国、晋国、郑国、楚国、吴国、越国等诸侯国的历史，是各国史料的汇编。本书上起周穆王西征犬戎(约前947年)，下至智伯被灭(前453年)，记录了包括各国贵族间朝聘、宴飨、讽谏、辩说、应对之辞以及部分历史事件与',
null,23.60,1,100,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'战国策-古典名著白文本','岳麓书社','岳麓书社',73,'暂无',
null,9.90,1,100,null,null);

insert into bookInfo values(seq_bookInfo_bid.nextval,'战国策正宗-华夏国学经典文库-(上下册)-[全文解读本]','  杨子彦','华夏出版社',73,'《华夏国学经典文库：战国策正宗（全文解读本，套装上下册）》是一部中国古代的史学名著，是一部彪炳千秋、影响深远的谋略宝典，是一部纵横家思想的集大成之作。',
null,30.90,1,100,null,null);

--订单表
create table orders(
   orid int primary key,--订单编号
   usid int 
        constraint FK_userInfo_orders_usid references userInfo(usid),--用户id
   total_price number(8,2),--订单总价
   status int,--订单状态 未付款  取消订单 付款    
   create_time date--订单创建时间
   
);
create sequence seq_orders_orid start with 10001;


--订单信息表
create table orderInfo(
   oriid int primary key,--id
   bid int 
        constraint FK_bookInfo_orderInfo_bid references bookInfo(bid),--书籍id
   usid int 
        constraint FK_userInfo_orderInfo_usid references userInfo(usid),--用户id
   orid int 
        constraint FK_orders_orderInfo_orid references orders(orid),--订单编号
   bookNum int,--数量
   price   number(8,2)--单价
);

create sequence seq_orderInfo_oriid start with 10001;

--用户评论表
create table userComment(
   ucid int primary key,--id
   usid int 
        constraint FK_userInfo_userComment_usid references userInfo(usid),--用户id
   bid int 
        constraint FK_bookInfo_userComment_bid references bookInfo(bid),--书籍id
   content clob --评论内容
);

create sequence seq_userComment_ucid start with 10001;

--管理员信息表
create table roleInfo(
    rid int primary key, --管理员id
    rname varchar2(100),--管理员姓名
    pwd varchar2(100),--登录密码
    status int,--账号状态
    authority varchar2(100)--权限
);    

create sequence seq_roleInfo_rid start with 10001;


--商品活动表
create table activity(
	aid int primary key,--活动id
    aname varchar2(100),--活动类型
    bid int 
         constraint FK_bookInfo_activity_bid references bookInfo(bid),--书籍id
    tid int
         constraint FK_bookType_activity_tid references bookType(tid),--书籍类型id         
	inventory int,--库存
	price number(8,2)--活动价
);

create sequence seq_activity_aid start with 10001;

