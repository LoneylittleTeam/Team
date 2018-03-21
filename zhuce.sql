--1�����û���

CREATE TABLE yonghu

(

 yno nchar(5)

 CONSTRAINT y1 PRIMARY KEY(yno),

 ymima nvarchar(16)

 CONSTRAINT y2 NOT NULL

 );

 --2����������Ϣ��

 CREATE TABLE gerenxinxi

(

 gno nchar(5)

 CONSTRAINT g1 PRIMARY KEY(yno),

 gname nvarchar(16)

 CONSTRAINT g2 NOT NULL,

 gage varchar(3)

 CONSTRAINT g3 CHECK(gage<200),

 gsex nvarchar(2)

 CONSTRAINT g4 CHECK(gsex IN('��','Ů')),

 yno nchar(5)

 FOREIGN KEY (yno) REFERENCES yonghu (yno),

 );

 --д���û���

 INSERT

 INTO yonghu(yno,ymima)

 VALUES(1,123456);

 INSERT

 INTO yonghu(yno,ymima)

 VALUES(2,123456789);

 --д�������Ϣ��

 INSERT

 INTO gerenxinxi(gno,gname,gage,gsex,yno)

 VALUES(1,'��ĳ',20,'��',1);

 

-----1���û����벢��������

      

CREATE PROCEDURE  procedure_yonghu

(

  @yno nchar(5),

  @ymima nvarchar(16)

 )

 AS

 BEGIN

 INSERT INTO yonghu VALUES(@yno,@ymima);

 END

 

  exec procedure_yonghu 3,123;

  --2�¸�����Ϣ���벢����

CREATE PROCEDURE  procedure_gerenxinxi

     (

     @gno nchar(5),

     @gname nvarchar(16),

     @gage varchar(3),

     @gsex nvarchar(2),

     @yno nchar(5)

     )

     AS

     BEGIN

       INSERT INTO gerenxinxi VALUES(@gno,@gname,@gage,@gsex,@yno);

       END

     exec procedure_gerenxinxi 2,'��ĳ',19,'��',2;

     

     CREATE PROCEDURE  procedure_gengaigerenxinxi

     (

     @gno nchar(5),

     @gname nvarchar(16),

     @gage varchar(3),

     @gsex nvarchar(2),

     @yno nchar(5)

     )

     AS

     BEGIN/*���뺯��*/

      IF exists(SELECT * FROM gerenxinxi WHERE gerenxinxi.gno=@gno)

        BEGIN

        UPDATE gerenxinxi

        SET gno=@gno,gname=@gname,gage=@gage,gsex=@gsex,yno=@yno

        WHERE gerenxinxi.gno=@gno

        PRINT'���³ɹ���';

        END

      ELSE 

       BEGIN

       PRINT'����ʧ�ܣ�';

       END  

     END

       

       

     exec procedure_gengaigerenxinxi 1,'��',21,'��',1;

     

     --�鿴�û�

      CREATE VIEW v_yonghu(�˺�,����)

    AS

    SELECT *

    FROM yonghu;

    select * from v_yonghu;

    

    

    --�鿴������Ϣ

      CREATE VIEW v_gerenxinxi(���,����,����,�Ա�)

    AS

    SELECT gno,gname,gage,gsex

    FROM gerenxinxi;

     select * from v_gerenxinxi;

    

    