---�������ӱ�

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

 ---�����ظ����ӱ�

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

  --д�����ӱ�

 INSERT

 INTO tiezi(tno,tneirong,tren,ttime,tfatierenno)

 VALUES(1,123456,'��ĳ',2017-11-15,1);

 --д��ظ���

 INSERT

 INTO huifutiezi(huifurenno,huifunneirong,huifuren,huifutime,huifutno,tno)

 VALUES(2,123456789,'��ĳ',2017-11-15,2,1);

 --��������

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

 

  exec procedure_fabiaotiezi 1,666,'��ĳ',2017-11-15,1;

  ---�ظ�����

  

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

 

  exec procedure_huifutiezi 1,666,'��ĳ',2017-11-15,1;

  

  

 --�鿴����

 CREATE VIEW v_chakantiezi(���Ӻ�,��������,������,����ʱ��,�����˱��)

 AS

 SELECT *

 FROM tiezi;

    

 select * from v_chakantiezi;

 

  --�鿴�ظ�����

 CREATE VIEW v_chakanhuifutiezi(�ظ����Ӻ�,�ظ���������,������,����ʱ��,�����˱��,���Ӻ�)

 AS

 SELECT *

 FROM huifutiezi;

    

 select * from v_chakanhuifutiezi;