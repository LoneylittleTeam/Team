--�����ɼ���
CREATE TABLE chengji
(
cno nchar(5)
CONSTRAINT c1 PRIMARY KEY(cno),
kno nchar(5)
FOREIGN KEY (kno) REFERENCES kecheng(kno),
cscore nchar(3)
CONSTRAINT c2 NOT NULL,
yno nchar(5)
FOREIGN KEY (yno) REFERENCES yonghu (yno),
);
--����ѧ�ֱ�
CREATE TABLE xuefen
(
xfno nchar(5)
CONSTRAINT xf1 PRIMARY KEY(xfno),
kno nchar(5)
FOREIGN KEY (kno) REFERENCES kecheng(kno),
xfscore nchar(3)
CONSTRAINT xf2 NOT NULL,

)
--д��ɼ���
INSERT 
INTO chengji(cno,kno,cscore,yno)
VALUES(1,1,80,1);

--д��ѧ�ֱ�
INSERT 
INTO xuefen(xfno,kno,xfscore)
VALUES(1,1,1);

--�����³ɼ�
CREATE PROCEDURE procedure_chengji
(
@cno nchar(5),
@kno nchar(5),
@cscore nchar(3),
@yno nchar(5)
)
AS
BEGIN
INSERT INTO chengji VALUES(@cno,@kno,@cscore,@yno);
END

exec procedure_chengji 2,2,70,1;

--����γ�ѧ��
CREATE PROCEDURE procedure_xuefen
(
@xfno nchar(5),
@kno nchar(5),
@xfscore nchar(3)
)
AS
BEGIN
INSERT INTO xuefen VALUES(@xfno,@kno,@xfscore);
END

exec procedure_xuefen 2,2,2;


---�鿴�ɼ�
CREATE PROCEDURE procedure_chaxunchengji
(
@yno nchar(5)
)
AS
BEGIN
SELECT yno,kname,cscore
FROM yonghu,kecheng,chengji
WHERE @yno=yonghu.yno and @yno=chengji.yno 


exec procedure_chaxunchengji 1;

--��ѯ�ѻ�õ�ѧ��
CREATE PROCEDURE procedure_chaxunxuefen
(
@yno nchar(5)
)
AS
BEGIN
SELECT yno,kname,xfscore
FROM yonghu,kecheng,xuefen
WHERE @yno=yonghu.yno and @yno=chengji.yno 


exec procedure_chaxunchengji 1;