--1创建用户表

CREATE TABLE yonghu

(

 yno nchar(5)

 CONSTRAINT y1 PRIMARY KEY(yno),

 ymima nvarchar(16)

 CONSTRAINT y2 NOT NULL

 );

 --2创建个人信息表

 CREATE TABLE gerenxinxi

(

 gno nchar(5)

 CONSTRAINT g1 PRIMARY KEY(yno),

 gname nvarchar(16)

 CONSTRAINT g2 NOT NULL,

 gage varchar(3)

 CONSTRAINT g3 CHECK(gage<200),

 gsex nvarchar(2)

 CONSTRAINT g4 CHECK(gsex IN('男','女')),

 yno nchar(5)

 FOREIGN KEY (yno) REFERENCES yonghu (yno),

 );

 --写入用户表

 INSERT

 INTO yonghu(yno,ymima)

 VALUES(1,123456);

 INSERT

 INTO yonghu(yno,ymima)

 VALUES(2,123456789);

 --写入个人信息表

 INSERT

 INTO gerenxinxi(gno,gname,gage,gsex,yno)

 VALUES(1,'刘某',20,'男',1);

 

-----1新用户插入并插入数据

      

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

  --2新个人信息插入并保存

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

     exec procedure_gerenxinxi 2,'吴某',19,'男',2;

     

     CREATE PROCEDURE  procedure_gengaigerenxinxi

     (

     @gno nchar(5),

     @gname nvarchar(16),

     @gage varchar(3),

     @gsex nvarchar(2),

     @yno nchar(5)

     )

     AS

     BEGIN/*插入函数*/

      IF exists(SELECT * FROM gerenxinxi WHERE gerenxinxi.gno=@gno)

        BEGIN

        UPDATE gerenxinxi

        SET gno=@gno,gname=@gname,gage=@gage,gsex=@gsex,yno=@yno

        WHERE gerenxinxi.gno=@gno

        PRINT'更新成功！';

        END

      ELSE 

       BEGIN

       PRINT'更新失败！';

       END  

     END

       

       

     exec procedure_gengaigerenxinxi 1,'李',21,'男',1;

     

     --查看用户

      CREATE VIEW v_yonghu(账号,密码)

    AS

    SELECT *

    FROM yonghu;

    select * from v_yonghu;

    

    

    --查看个人信息

      CREATE VIEW v_gerenxinxi(编号,姓名,年龄,性别)

    AS

    SELECT gno,gname,gage,gsex

    FROM gerenxinxi;

     select * from v_gerenxinxi;

    

    