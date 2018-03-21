---�����γ̱�

CREATE TABLE kecheng

(

 kno nchar(5)

 CONSTRAINT k1 PRIMARY KEY(kno),

 kname nvarchar(100)

 CONSTRAINT k2 NOT NULL,

 kteacher nvarchar(5)

 CONSTRAINT k3 NOT NULL,

 kopentime time

 CONSTRAINT k4 NOT NULL,
 
 kovertime time

 CONSTRAINT k5 NOT NULL,


 );

 ---����ѡ���˿α�

CREATE TABLE xuantuike

(

 xtno nchar(5)

 CONSTRAINT xt1 PRIMARY KEY(xtno),

 kno nchar(5)

 FOREIGN KEY (kno) REFERENCES kecheng (kno),

 yno nchar(5)

 FOREIGN KEY (yno) REFERENCES yonghu (yno),

 );

  --д��γ̱�

 INSERT

 INTO kecheng(kno,kname,kteacher,kopentime,kovertime)

 VALUES(1,'�������','����ʦ',2017-9-9,2018-6-6);

 --д��ѡ���˿α�

 INSERT

 INTO xuantuike(xtno,kno,yno)

 VALUES(1,1,1);

 --����¿γ�

 CREATE PROCEDURE  procedure_kecheng

(

  @kno nchar(5),

  @kname nvarchar(100),

  @kteacher nvarchar(5),

  @kopentime Time,

  @kclosetime Time

 )

 AS

 BEGIN

 INSERT INTO kecheng VALUES(@kno,@kname,@kteacher,@kopentime,@kclosetime);

 END

 

  exec procedure_kecheng 2,'java�������','����ʦ',2017-9-15,2018-6-15;

  ---ѡ��

  

  CREATE PROCEDURE  procedure_xuanke

(

  @xtno nchar(5),

  @kno nchar(5),

  @yno nchar(5)

 )

 AS

 BEGIN

 INSERT INTO xuantuike VALUES(@xtno,@kno,@yno);

 END

 

  exec procedure_xuanke 2,1,2;

    ---�˿�

  

  CREATE PROCEDURE  procedure_tuike

(

  @xtno nchar(5),

  @kno nchar(5),

  @yno nchar(5)

 )

 AS

 BEGIN
 
 DELETE FROM xuantuike Where @kno=kno and @yno=yno ;
 
 END
 
 exec procedure_xuanke 2,1,2;
  
 --�鿴ĳ����ѡ�γ�
  
    CREATE PROCEDURE  procedure_people_kecheng

(

  @yno nchar(5)

 )

 AS

 BEGIN
 
SELECT yno,yname,kno,kname,kteacher

 FROM xuantuike,yonghu,kecheng
 
 where @yno=yonghu.yno and @yno=xuantuike.yno and kecheng.kno=xuantuike.kno
 
 exec procedure_people_kecheng 2;
 
  --�鿴ѡĳ�γ̵���
  
    CREATE PROCEDURE  procedure_kecheng_people

(

  @kno nchar(5)

 )

 AS

 BEGIN
 
SELECT kno,yno,yname

 FROM xuantuike,yonghu
 
 where @yno=yonghu.yno and @kno=xuantuike.kno 
 
 exec procedure_kecheng_people 1;

 --�鿴ѡ�˿α�

 CREATE VIEW v_xuantuike(���,�γ̺�,�û����)

 AS

 SELECT *

 FROM xuantuike;

    

 select * from v_xuantuike;
