---创建帖子表

CREATE TABLE tiezi

(

 tno nchar(5)

 CONSTRAINT t1 PRIMARY KEY(tno),

 tneirong nvarchar(100)

 CONSTRAINT t2 NOT NULL,

 tren nvarchar(5)

 CONSTRAINT t3 NOT NULL,

 ttime Time

 CONSTRAINT t4 NOT NULL,

 tfatierenno nchar(5)

 FOREIGN KEY (tfatierenno) REFERENCES yonghu (yno),

 );

 ---创建回复帖子表

CREATE TABLE huifutiezi

(

 huifutno nchar(5)

 CONSTRAINT h1 PRIMARY KEY(huifutno),

 huifunneirong nvarchar(100)

 CONSTRAINT h2 NOT NULL,

 huifuren nvarchar(5)

 CONSTRAINT h3 NOT NULL,

 huifutime Time

 CONSTRAINT h4 NOT NULL,

 huifurenno nchar(5)

 FOREIGN KEY (huifurenno) REFERENCES yonghu (yno),

 tno nchar(5)

 FOREIGN KEY (tno) REFERENCES tiezi (tno),

 );

  --写入帖子表

 INSERT

 INTO tiezi(tno,tneirong,tren,ttime,tfatierenno)

 VALUES(1,123456,'刘某',2017-11-15,1);

 --写入回复表

 INSERT

 INTO huifutiezi(huifurenno,huifunneirong,huifuren,huifutime,huifutno,tno)

 VALUES(2,123456789,'吴某',2017-11-15,2,1);

 --发表帖子

 CREATE PROCEDURE  procedure_fabiaotiezi

(

  @tno nchar(5),

  @tneirong nvarchar(100),

  @tren nvarchar(5),

  @ttime Time,

  @tfatierenno nchar(5)

 )

 AS

 BEGIN

 INSERT INTO tiezi VALUES(@tno,@tneirong,@tren,@ttime,@tfatierenno);

 END

 

  exec procedure_fabiaotiezi 1,666,'刘某',2017-11-15,1;

  ---回复帖子

  

  CREATE PROCEDURE  procedure_huifutiezi

(

  @huifuno nchar(5),

  @huifuneirong nvarchar(100),

  @huifuren nvarchar(5),

  @huifutime Time,

  @huifufatierenno nchar(5),

  @tno nchar(5)

 )

 AS

 BEGIN

 INSERT INTO huifutiezi VALUES(@huifuno,@huifuneirong,@huifuren,@huifutime,@huifufatierenno,@tno);

 END

 

  exec procedure_huifutiezi 1,666,'刘某',2017-11-15,1;

  

  

 --查看帖子

 CREATE VIEW v_chakantiezi(帖子号,帖子内容,发帖人,发帖时间,发帖人编号)

 AS

 SELECT *

 FROM tiezi;

    

 select * from v_chakantiezi;

 

  --查看回复帖子

 CREATE VIEW v_chakanhuifutiezi(回复帖子号,回复帖子内容,回帖人,回帖时间,回帖人编号,帖子号)

 AS

 SELECT *

 FROM huifutiezi;

    

 select * from v_chakanhuifutiezi;