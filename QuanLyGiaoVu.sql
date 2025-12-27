-- Chay lenh tao CSDL truoc
CREATE DATABASE QUANLIGIAOVU_0208
GO
-- Refesh lai CSDL moi lam tiep cac lenh sau
USE QUANLIGIAOVU_0208
GO
-------------------------------------------------
-------------------------------------------------
-- Tao bang + khoa chinh,khoa ngoai
CREATE TABLE KHOA(
	MAKHOA	char(4),
	TENKHOA	varchar(40),
	NGTLAP	smalldatetime,
	TRGKHOA	char(4)
	CONSTRAINT PK_KHOA PRIMARY KEY(MAKHOA)
)

CREATE TABLE MONHOC(
	MAMH	char(10),
	TENMH	varchar(40),
	TCLT	tinyint,
	TCTH	tinyint,
	MAKHOA	char(4),
	CONSTRAINT PK_MH PRIMARY KEY(MAMH)
)

CREATE TABLE DIEUKIEN(
	MAMH		char(10),
	MAMH_TRUOC	char(10),
	CONSTRAINT PK_DK PRIMARY KEY(MAMH,MAMH_TRUOC)
)

CREATE TABLE GIAOVIEN(
	MAGV		char(4),
	HOTEN		varchar(40),
	HOCVI		varchar(10),
	HOCHAM		varchar(10),
	GIOITINH	varchar(3),
	NGSINH		smalldatetime,
	NGVL		smalldatetime,
	HESO		numeric(4,2),
	MUCLUONG	money,
	MAKHOA		char(4),
	CONSTRAINT PK_GV PRIMARY KEY(MAGV)
)

CREATE TABLE LOP(
	MALOP	char(3),
	TENLOP	varchar(40),
	TRGLOP	char(5),
	SISO	tinyint,
	MAGVCN	char(4),
	CONSTRAINT PK_LOP PRIMARY KEY(MALOP)
)

CREATE TABLE HOCVIEN(
	MAHV		char(5),
	HO		varchar(40),
	TEN		varchar(10),
	NGSINH		smalldatetime,
	GIOITINH	varchar(3),
	NOISINH		varchar(40),
	MALOP		char(3),
	CONSTRAINT PK_HV PRIMARY KEY(MAHV)
)


CREATE TABLE GIANGDAY(
	MALOP	char(3),
	MAMH	char(10),
	MAGV	char(4),
	HOCKY	tinyint,
	NAM	smallint,
	TUNGAY	smalldatetime,
	DENNGAY	smalldatetime,
	CONSTRAINT PK_GD PRIMARY KEY(MALOP,MAMH)
)

CREATE TABLE KETQUATHI(
	MAHV	char(5),
	MAMH	char(10),
	LANTHI	tinyint,
	NGTHI	smalldatetime,
	DIEM	numeric(4,2),
	KQUA	varchar(10),
	CONSTRAINT PK_KQ PRIMARY KEY(MAHV,MAMH,LANTHI)
)

-------------------------------------------
-- KHOA 	
ALTER TABLE KHOA ADD CONSTRAINT FK_KHOA FOREIGN KEY(TRGKHOA) REFERENCES GIAOVIEN(MAGV)
-------------------------------------------
-- MONHOC 		
ALTER TABLE MONHOC ADD CONSTRAINT FK_MH FOREIGN KEY(MAKHOA) REFERENCES KHOA(MAKHOA)
-------------------------------------------
-- DIEUKIEN 	
ALTER TABLE DIEUKIEN ADD CONSTRAINT FK01_DK FOREIGN KEY(MAMH) REFERENCES MONHOC(MAMH)
ALTER TABLE DIEUKIEN ADD CONSTRAINT FK02_DK FOREIGN KEY(MAMH_TRUOC) REFERENCES MONHOC(MAMH)
-------------------------------------------
-- GIAOVIEN
ALTER TABLE GIAOVIEN ADD CONSTRAINT FK_GV FOREIGN KEY(MAKHOA) REFERENCES KHOA(MAKHOA)
-------------------------------------------
-- LOP
ALTER TABLE LOP ADD CONSTRAINT FK01_LOP FOREIGN KEY(TRGLOP) REFERENCES HOCVIEN(MAHV)
ALTER TABLE LOP ADD CONSTRAINT FK02_LOP FOREIGN KEY(MAGVCN) REFERENCES GIAOVIEN(MAGV)
-------------------------------------------
-- HOCVIEN
ALTER TABLE HOCVIEN ADD CONSTRAINT FK_HV FOREIGN KEY(MALOP) REFERENCES LOP(MALOP)
-------------------------------------------
-- GIANGDAY
ALTER TABLE GIANGDAY ADD CONSTRAINT FK01_GD FOREIGN KEY(MALOP) REFERENCES LOP(MALOP)
ALTER TABLE GIANGDAY ADD CONSTRAINT FK02_GD FOREIGN KEY(MAMH) REFERENCES MONHOC(MAMH)
ALTER TABLE GIANGDAY ADD CONSTRAINT FK03_GD FOREIGN KEY(MAGV) REFERENCES GIAOVIEN(MAGV)
-------------------------------------------
-- KETQUATHI
ALTER TABLE KETQUATHI ADD CONSTRAINT FK01_KQ FOREIGN KEY(MAHV) REFERENCES HOCVIEN(MAHV)
ALTER TABLE KETQUATHI ADD CONSTRAINT FK02_KQ FOREIGN KEY(MAMH) REFERENCES MONHOC(MAMH)

-------------------------------------------------
-------------------------------------------------
-- Nhap lieu
ALTER TABLE KHOA NOCHECK CONSTRAINT ALL
ALTER TABLE LOP NOCHECK CONSTRAINT ALL
ALTER TABLE MONHOC NOCHECK CONSTRAINT ALL
ALTER TABLE DIEUKIEN NOCHECK CONSTRAINT ALL
ALTER TABLE GIAOVIEN NOCHECK CONSTRAINT ALL
ALTER TABLE HOCVIEN NOCHECK CONSTRAINT ALL
ALTER TABLE GIANGDAY NOCHECK CONSTRAINT ALL
ALTER TABLE KETQUATHI NOCHECK CONSTRAINT ALL

delete from KHOA
delete from LOP
delete from MONHOC
delete from DIEUKIEN
delete from GIAOVIEN
delete from HOCVIEN
delete from GIANGDAY
delete from KETQUATHI

set dateformat dmy
-- KHOA
INSERT INTO KHOA VALUES('KHMT','Khoa hoc may tinh','06/07/2005','GV01')
INSERT INTO KHOA VALUES('HTTT','He thong thong tin','06/07/2005','GV02')
INSERT INTO KHOA VALUES('CNPM','Cong nghe phan mem','06/07/2005','GV04')
INSERT INTO KHOA VALUES('MTT','Mang va truyen thong','20/10/2005','GV03')
INSERT INTO KHOA VALUES('KTMT','Ky thuat may tinh','20/12/2005','Null')

-- LOP
INSERT INTO LOP VALUES('K11','Lop 1 khoa 1','K1108',11,'GV07')
INSERT INTO LOP VALUES('K12','Lop 2 khoa 1','K1205',12,'GV09')
INSERT INTO LOP VALUES('K13','Lop 3 khoa 1','K1305',12,'GV14')

-- MONHOC
INSERT INTO MONHOC VALUES('THDC','Tin hoc dai cuong',4,1,'KHMT')
INSERT INTO MONHOC VALUES('CTRR','Cau truc roi rac',5,0,'KHMT')
INSERT INTO MONHOC VALUES('CSDL','Co so du lieu',3,1,'HTTT')
INSERT INTO MONHOC VALUES('CTDLGT','Cau truc du lieu va giai thuat',3,1,'KHMT')
INSERT INTO MONHOC VALUES('PTTKTT','Phan tich thiet ke thuat toan',3,0,'KHMT')
INSERT INTO MONHOC VALUES('DHMT','Do hoa may tinh',3,1,'KHMT')
INSERT INTO MONHOC VALUES('KTMT','Kien truc may tinh',3,0,'KTMT')
INSERT INTO MONHOC VALUES('TKCSDL','Thiet ke co so du lieu',3,1,'HTTT')
INSERT INTO MONHOC VALUES('PTTKHTTT','Phan tich thiet ke he thong thong tin',4,1,'HTTT')
INSERT INTO MONHOC VALUES('HDH','He dieu hanh',4,0,'KTMT')
INSERT INTO MONHOC VALUES('NMCNPM','Nhap mon cong nghe phan mem',3,0,'CNPM')
INSERT INTO MONHOC VALUES('LTCFW','Lap trinh C for win',3,1,'CNPM')
INSERT INTO MONHOC VALUES('LTHDT','Lap trinh huong doi tuong',3,1,'CNPM')

-- DIEUKIEN
INSERT INTO DIEUKIEN VALUES('CSDL','CTRR')
INSERT INTO DIEUKIEN VALUES('CSDL','CTDLGT')
INSERT INTO DIEUKIEN VALUES('CTDLGT','THDC')
INSERT INTO DIEUKIEN VALUES('PTTKTT','THDC')
INSERT INTO DIEUKIEN VALUES('PTTKTT','CTDLGT')
INSERT INTO DIEUKIEN VALUES('DHMT','THDC')
INSERT INTO DIEUKIEN VALUES('LTHDT','THDC')
INSERT INTO DIEUKIEN VALUES('PTTKHTTT','CSDL')

-- GIANGDAY
INSERT INTO GIANGDAY VALUES('K11','THDC','GV07',1,2006,'01/02/2006','05/12/2006')
INSERT INTO GIANGDAY VALUES('K12','THDC','GV06',1,2006,'01/02/2006','05/12/2006')
INSERT INTO GIANGDAY VALUES('K13','THDC','GV15',1,2006,'01/02/2006','05/12/2006')
INSERT INTO GIANGDAY VALUES('K11','CTRR','GV02',1,2006,'09/01/2006','17/5/2006')
INSERT INTO GIANGDAY VALUES('K12','CTRR','GV02',1,2006,'09/01/2006','17/5/2006')
INSERT INTO GIANGDAY VALUES('K13','CTRR','GV08',1,2006,'09/01/2006','17/5/2006')
INSERT INTO GIANGDAY VALUES('K11','CSDL','GV05',2,2006,'06/01/2006','15/7/2006')
INSERT INTO GIANGDAY VALUES('K12','CSDL','GV09',2,2006,'06/01/2006','15/7/2006')
INSERT INTO GIANGDAY VALUES('K13','CTDLGT','GV15',2,2006,'06/01/2006','15/7/2006')
INSERT INTO GIANGDAY VALUES('K13','CSDL','GV05',3,2006,'08/01/2006','15/12/2006')
INSERT INTO GIANGDAY VALUES('K13','DHMT','GV07',3,2006,'08/01/2006','15/12/2006')
INSERT INTO GIANGDAY VALUES('K11','CTDLGT','GV15',3,2006,'08/01/2006','15/12/2006')
INSERT INTO GIANGDAY VALUES('K12','CTDLGT','GV15',3,2006,'08/01/2006','15/12/2006')
INSERT INTO GIANGDAY VALUES('K11','HDH','GV04',1,2007,'01/02/2007','18/2/2007')
INSERT INTO GIANGDAY VALUES('K12','HDH','GV04',1,2007,'01/02/2007','20/3/2007')
INSERT INTO GIANGDAY VALUES('K11','DHMT','GV07',1,2007,'18/2/2007','20/3/2007')

-- GIAOVIEN
INSERT INTO GIAOVIEN VALUES('GV01','Ho Thanh Son','PTS','GS','Nam','05/02/1950','01/11/2004',5,2250000,'KHMT')
INSERT INTO GIAOVIEN VALUES('GV02','Tran Tam Thanh','TS','PGS','Nam','17/12/1965','20/4/2004',4.5,2025000,'HTTT')
INSERT INTO GIAOVIEN VALUES('GV03','Do Nghiem Phung','TS','GS','Nu','08/01/1950','23/9/2004',4,1800000,'CNPM')
INSERT INTO GIAOVIEN VALUES('GV04','Tran Nam Son','TS','PGS','Nam','22/2/1961','01/12/2005',4.5,2025000,'KTMT')
INSERT INTO GIAOVIEN VALUES('GV05','Mai Thanh Danh','ThS','GV','Nam','03/12/1958','01/12/2005',3,1350000,'HTTT')
INSERT INTO GIAOVIEN VALUES('GV06','Tran Doan Hung','TS','GV','Nam','03/11/1953','01/12/2005',4.5,2025000,'KHMT')
INSERT INTO GIAOVIEN VALUES('GV07','Nguyen Minh Tien','ThS','GV','Nam','23/11/1971','03/01/2005',4,1800000,'KHMT')
INSERT INTO GIAOVIEN VALUES('GV08','Le Thi Tran','KS','Null','Nu','26/3/1974','03/01/2005',1.69,760500,'KHMT')
INSERT INTO GIAOVIEN VALUES('GV09','Nguyen To Lan','ThS','GV','Nu','31/12/1966','03/01/2005',4,1800000,'HTTT')
INSERT INTO GIAOVIEN VALUES('GV10','Le Tran Anh Loan','KS','Null','Nu','17/7/1972','03/01/2005',1.86,837000,'CNPM')
INSERT INTO GIAOVIEN VALUES('GV11','Ho Thanh Tung','CN','GV','Nam','01/12/1980','15/5/2005',2.67,1201500,'MTT')
INSERT INTO GIAOVIEN VALUES('GV12','Tran Van Anh','CN','Null','Nu','29/3/1981','15/5/2005',1.69,760500,'CNPM')
INSERT INTO GIAOVIEN VALUES('GV13','Nguyen Linh Dan','CN','Null','Nu','23/5/1980','15/5/2005',1.69,760500,'KTMT')
INSERT INTO GIAOVIEN VALUES('GV14','Truong Minh Chau','ThS','GV','Nu','30/11/1976','15/5/2005',3,1350000,'MTT')
INSERT INTO GIAOVIEN VALUES('GV15','Le Ha Thanh','ThS','GV','Nam','05/04/1978','15/5/2005',3,1350000,'KHMT')

-- HOCVIEN
INSERT INTO HOCVIEN VALUES('K1101','Nguyen Van','A','27/1/1986','Nam','TpHCM','K11')
INSERT INTO HOCVIEN VALUES('K1102','Tran Ngoc','Han','14/3/1986','Nu','Kien Giang','K11')
INSERT INTO HOCVIEN VALUES('K1103','Ha Duy','Lap','18/4/1986','Nam','Nghe An','K11')
INSERT INTO HOCVIEN VALUES('K1104','Tran Ngoc','Linh','30/3/1986','Nu','Tay Ninh','K11')
INSERT INTO HOCVIEN VALUES('K1105','Tran Minh','Long','27/2/1986','Nam','TpHCM','K11')
INSERT INTO HOCVIEN VALUES('K1106','Le Nhat','Minh','24/1/1986','Nam','TpHCM','K11')
INSERT INTO HOCVIEN VALUES('K1107','Nguyen Nhu','Nhut','27/1/1986','Nam','Ha Noi','K11')
INSERT INTO HOCVIEN VALUES('K1108','Nguyen Manh','Tam','27/2/1986','Nam','Kien Giang','K11')
INSERT INTO HOCVIEN VALUES('K1109','Phan Thi Thanh','Tam','27/1/1986','Nu','Vinh Long','K11')
INSERT INTO HOCVIEN VALUES('K1110','Le Hoai','Thuong','02/05/1986','Nu','Can Tho','K11')
INSERT INTO HOCVIEN VALUES('K1111','Le Ha','Vinh','25/12/1986','Nam','Vinh Long','K11')
INSERT INTO HOCVIEN VALUES('K1201','Nguyen Van','B','02/11/1986','Nam','TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1202','Nguyen Thi Kim','Duyen','18/1/1986','Nu','TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1203','Tran Thi Kim','Duyen','17/9/1986','Nu','TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1204','Truong My','Hanh','19/5/1986','Nu','Dong Nai','K12')
INSERT INTO HOCVIEN VALUES('K1205','Nguyen Thanh','Nam','17/4/1986','Nam','TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1206','Nguyen Thi Truc','Thanh','03/04/1986','Nu','Kien Giang','K12')
INSERT INTO HOCVIEN VALUES('K1207','Tran Thi Bich','Thuy','02/08/1986','Nu','Nghe An','K12')
INSERT INTO HOCVIEN VALUES('K1208','Huynh Thi Kim','Trieu','04/08/1986','Nu','Tay Ninh','K12')
INSERT INTO HOCVIEN VALUES('K1209','Pham Thanh','Trieu','23/2/1986','Nam','TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1210','Ngo Thanh','Tuan','14/2/1986','Nam','TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1211','Do Thi','Xuan','03/09/1986','Nu','Ha Noi','K12')
INSERT INTO HOCVIEN VALUES('K1212','Le Thi Phi','Yen','03/12/1986','Nu','TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1301','Nguyen Thi Kim','Cuc','06/09/1986','Nu','Kien Giang','K13')
INSERT INTO HOCVIEN VALUES('K1302','Truong Thi My','Hien','18/3/1986','Nu','Nghe An','K13')
INSERT INTO HOCVIEN VALUES('K1303','Le Duc','Hien','21/3/1986','Nam','Tay Ninh','K13')
INSERT INTO HOCVIEN VALUES('K1304','Le Quang','Hien','18/4/1986','Nam','TpHCM','K13')
INSERT INTO HOCVIEN VALUES('K1305','Le Thi','Huong','27/3/1986','Nu','TpHCM','K13')
INSERT INTO HOCVIEN VALUES('K1306','Nguyen Thai','Huu','30/3/1986','Nam','Ha Noi','K13')
INSERT INTO HOCVIEN VALUES('K1307','Tran Minh','Man','28/5/1986','Nam','TpHCM','K13')
INSERT INTO HOCVIEN VALUES('K1308','Nguyen Hieu','Nghia','04/08/1986','Nam','Kien Giang','K13')
INSERT INTO HOCVIEN VALUES('K1309','Nguyen Trung','Nghia','18/1/1987','Nam','Nghe An','K13')
INSERT INTO HOCVIEN VALUES('K1310','Tran Thi Hong','Tham','22/4/1986','Nu','Tay Ninh','K13')
INSERT INTO HOCVIEN VALUES('K1311','Tran Minh','Thuc','04/04/1986','Nam','TpHCM','K13')
INSERT INTO HOCVIEN VALUES('K1312','Nguyen Thi Kim','Yen','09/07/1986','Nu','TpHCM','K13')

-- KETQUATHI
INSERT INTO KETQUATHI VALUES('K1101','CSDL',1,'20/7/2006',10,'Dat')
INSERT INTO KETQUATHI VALUES('K1101','CTDLGT',1,'28/12/2006',9,'Dat')
INSERT INTO KETQUATHI VALUES('K1101','THDC',1,'20/5/2006',9,'Dat')
INSERT INTO KETQUATHI VALUES('K1101','CTRR',1,'13/5/2006',9.5,'Dat')
INSERT INTO KETQUATHI VALUES('K1102','CSDL',1,'20/7/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1102','CSDL',2,'27/7/2006',4.25,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1102','CSDL',3,'08/10/2006',4.5,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1102','CTDLGT',1,'28/12/2006',4.5,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1102','CTDLGT',2,'01/05/2007',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1102','CTDLGT',3,'15/1/2007',6,'Dat')
INSERT INTO KETQUATHI VALUES('K1102','THDC',1,'20/5/2006',5,'Dat')
INSERT INTO KETQUATHI VALUES('K1102','CTRR',1,'13/5/2006',7,'Dat')
INSERT INTO KETQUATHI VALUES('K1103','CSDL',1,'20/7/2006',3.5,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1103','CSDL',2,'27/7/2006',8.25,'Dat')
INSERT INTO KETQUATHI VALUES('K1103','CTDLGT',1,'28/12/2006',7,'Dat')
INSERT INTO KETQUATHI VALUES('K1103','THDC',1,'20/5/2006',8,'Dat')
INSERT INTO KETQUATHI VALUES('K1103','CTRR',1,'13/5/2006',6.5,'Dat')
INSERT INTO KETQUATHI VALUES('K1104','CSDL',1,'20/7/2006',3.75,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1104','CTDLGT',1,'28/12/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1104','THDC',1,'20/5/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1104','CTRR',1,'13/5/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1104','CTRR',2,'20/5/2006',3.5,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1104','CTRR',3,'30/6/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1201','CSDL',1,'20/7/2006',6,'Dat')
INSERT INTO KETQUATHI VALUES('K1201','CTDLGT',1,'28/12/2006',5,'Dat')
INSERT INTO KETQUATHI VALUES('K1201','THDC',1,'20/5/2006',8.5,'Dat')
INSERT INTO KETQUATHI VALUES('K1201','CTRR',1,'13/5/2006',9,'Dat')
INSERT INTO KETQUATHI VALUES('K1202','CSDL',1,'20/7/2006',8,'Dat')
INSERT INTO KETQUATHI VALUES('K1202','CTDLGT',1,'28/12/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1202','CTDLGT',2,'01/05/2007',5,'Dat')
INSERT INTO KETQUATHI VALUES('K1202','THDC',1,'20/5/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1202','THDC',2,'27/5/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1202','CTRR',1,'13/5/2006',3,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1202','CTRR',2,'20/5/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1202','CTRR',3,'30/6/2006',6.25,'Dat')
INSERT INTO KETQUATHI VALUES('K1203','CSDL',1,'20/7/2006',9.25,'Dat')
INSERT INTO KETQUATHI VALUES('K1203','CTDLGT',1,'28/12/2006',9.5,'Dat')
INSERT INTO KETQUATHI VALUES('K1203','THDC',1,'20/5/2006',10,'Dat')
INSERT INTO KETQUATHI VALUES('K1203','CTRR',1,'13/5/2006',10,'Dat')
INSERT INTO KETQUATHI VALUES('K1204','CSDL',1,'20/7/2006',8.5,'Dat')
INSERT INTO KETQUATHI VALUES('K1204','CTDLGT',1,'28/12/2006',6.75,'Dat')
INSERT INTO KETQUATHI VALUES('K1204','THDC',1,'20/5/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1204','CTRR',1,'13/5/2006',6,'Dat')
INSERT INTO KETQUATHI VALUES('K1301','CSDL',1,'20/12/2006',4.25,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1301','CTDLGT',1,'25/7/2006',8,'Dat')
INSERT INTO KETQUATHI VALUES('K1301','THDC',1,'20/5/2006',7.75,'Dat')
INSERT INTO KETQUATHI VALUES('K1301','CTRR',1,'13/5/2006',8,'Dat')
INSERT INTO KETQUATHI VALUES('K1302','CSDL',1,'20/12/2006',6.75,'Dat')
INSERT INTO KETQUATHI VALUES('K1302','CTDLGT',1,'25/7/2006',5,'Dat')
INSERT INTO KETQUATHI VALUES('K1302','THDC',1,'20/5/2006',8,'Dat')
INSERT INTO KETQUATHI VALUES('K1302','CTRR',1,'13/5/2006',8.5,'Dat')
INSERT INTO KETQUATHI VALUES('K1303','CSDL',1,'20/12/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1303','CTDLGT',1,'25/7/2006',4.5,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1303','CTDLGT',2,'08/07/2006',4,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1303','CTDLGT',3,'15/8/2006',4.25,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1303','THDC',1,'20/5/2006',4.5,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1303','CTRR',1,'13/5/2006',3.25,'Khong Dat')
INSERT INTO KETQUATHI VALUES('K1303','CTRR',2,'20/5/2006',5,'Dat')
INSERT INTO KETQUATHI VALUES('K1304','CSDL',1,'20/12/2006',7.75,'Dat')
INSERT INTO KETQUATHI VALUES('K1304','CTDLGT',1,'25/7/2006',9.75,'Dat')
INSERT INTO KETQUATHI VALUES('K1304','THDC',1,'20/5/2006',5.5,'Dat')
INSERT INTO KETQUATHI VALUES('K1304','CTRR',1,'13/5/2006',5,'Dat')
INSERT INTO KETQUATHI VALUES('K1305','CSDL',1,'20/12/2006',9.25,'Dat')
INSERT INTO KETQUATHI VALUES('K1305','CTDLGT',1,'25/7/2006',10,'Dat')
INSERT INTO KETQUATHI VALUES('K1305','THDC',1,'20/5/2006',8,'Dat')
INSERT INTO KETQUATHI VALUES('K1305','CTRR',1,'13/5/2006',10,'Dat')

--I

--1 Tạo quan hệ và khai báo tất cả các ràng buộc khóa chính, khóa ngoại. Thêm vào 3 thuộc tính GHICHU, DIEMTB, XEPLOAI cho quan hệ HOCVIEN.
ALTER TABLE HOCVIEN ADD GHICHU varchar(40);
ALTER TABLE HOCVIEN ADD DTB numeric(4,2);
ALTER TABLE HOCVIEN ADD XEPLOAI varchar(20);

--2 Mã học viên là một chuỗi 5 ký tự, 3 ký tự đầu là mã lớp, 2 ký tự cuối cùng là số thứ tự học viên trong lớp. VD: “K1101”
ALTER TABLE HOCVIEN 
ADD CONSTRAINT CK_HOCVIEN_MAHV 
CHECK(LEFT(MAHV,3)=MALOP);

--3 Thuộc tính GIOITINH chỉ có giá trị là “Nam” hoặc “Nu”.
ALTER TABLE GIAOVIEN 
ADD CONSTRAINT CK_GIAOVIEN_GIOITINH 
CHECK(GIOITINH IN ('Nam', 'Nu')); 
ALTER TABLE HOCVIEN 
ADD CONSTRAINT CK_HOCVIEN_GIOITINH 
CHECK(GIOITINH IN ('Nam', 'Nu')); 

--4 Điểm số của một lần thi có giá trị từ 0 đến 10 và cần lưu đến 2 số lẽ (VD: 6.22).
ALTER TABLE KETQUATHI 
ADD CONSTRAINT CK_KETQUATHI_DIEM 
CHECK(DIEM>=0 AND DIEM <=10);

--5 Kết quả thi là “Dat” nếu điểm từ 5 đến 10 và “Khong dat” nếu điểm nhỏ hơn 5.
ALTER TABLE KETQUATHI 
ADD CONSTRAINT CK_KETQUATHI_KQUA 
CHECK ((DIEM >=5 AND DIEM <=10 AND KQUA='Dat') 
   OR (DIEM <5 AND KQUA='Khong dat'));

--6 Học viên thi một môn tối đa 3 lần.
ALTER TABLE KETQUATHI 
ADD CONSTRAINT CK_KETQUATHI_LANTHI 
CHECK(LANTHI>0 AND LANTHI<=3);

--7 Học kỳ chỉ có giá trị từ 1 đến 3.
ALTER TABLE GIANGDAY 
ADD CONSTRAINT CK_GIANGDAY_HOCKY 
CHECK(HOCKY>=1 AND HOCKY <=3);

--8 Học vị của giáo viên chỉ có thể là “CN”, “KS”, “Ths”, ”TS”, ”PTS”.
ALTER TABLE GIAOVIEN
ADD CONSTRAINT CK_GIAOVIEN_HOCVI 
CHECK(HOCVI IN ('CN', 'KS', 'Ths', 'TS', 'PTS'));

--9 Lớp trưởng của một lớp phải là học viên của lớp đó.
GO
CREATE TRIGGER trg_KiemTraLopTruong_Lop
ON LOP
FOR INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT *
        FROM INSERTED I
        JOIN HOCVIEN HV ON I.TRGLOP = HV.MAHV
        WHERE I.MALOP <> HV.MALOP 
    )
    BEGIN
        PRINT 'Loi: Lop truong phai la hoc vien cua lop do.'
        ROLLBACK TRANSACTION
    END
END

GO
CREATE TRIGGER trg_KiemTraLopTruong_HocVien
ON HOCVIEN
FOR DELETE, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT * 
        FROM DELETED D
        JOIN LOP L ON D.MAHV = L.TRGLOP
        WHERE D.MALOP <> L.MALOP 
           OR D.MAHV NOT IN (SELECT MAHV FROM HOCVIEN) 
    )
    BEGIN
        PRINT 'Loi: Hoc vien nay dang la lop truong, khong the xoa hoac chuyen lop.'
        ROLLBACK TRANSACTION
    END
END

--10 Trưởng khoa phải là giáo viên thuộc khoa và có học vị “TS” hoặc “PTS”.
GO
CREATE TRIGGER trg_KiemTraTruongKhoa_Khoa
ON KHOA
FOR INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT *
        FROM INSERTED I
        JOIN GIAOVIEN GV ON I.TRGKHOA = GV.MAGV
        WHERE GV.MAKHOA <> I.MAKHOA      
           OR GV.HOCVI NOT IN ('TS', 'PTS') 
    )
    BEGIN
        PRINT 'Loi: Truong khoa phai thuoc khoa do va co hoc vi TS hoac PTS.'
        ROLLBACK TRANSACTION
    END
END

GO
CREATE TRIGGER trg_KiemTraTruongKhoa_GiaoVien
ON GIAOVIEN
FOR UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT *
        FROM INSERTED I
        JOIN KHOA K ON I.MAGV = K.TRGKHOA
        WHERE I.MAKHOA <> K.MAKHOA     
           OR I.HOCVI NOT IN ('TS', 'PTS') 
    )
    BEGIN
        PRINT 'Loi: Giao vien dang la truong khoa, khong the sua doi thong tin vi pham dieu kien (Khoa, Hoc vi).'
        ROLLBACK TRANSACTION
    END
END

--11 Học viên ít nhất là 18 tuổi.
ALTER TABLE HOCVIEN 
ADD CONSTRAINT CK_HOCVIEN_TUOI 
CHECK(YEAR(GETDATE())-YEAR(HOCVIEN.NGSINH)>=18);

--12 Giảng dạy một môn học ngày bắt đầu (TUNGAY) phải nhỏ hơn ngày kết thúc (DENNGAY).
ALTER TABLE GIANGDAY 
ADD CONSTRAINT CK_GIANGDAY_NGAY 
CHECK(GIANGDAY.TUNGAY<GIANGDAY.DENNGAY);

--13 Giáo viên khi vào làm ít nhất là 22 tuổi.
ALTER TABLE GIAOVIEN 
ADD CONSTRAINT CK_GIANGVIEN_TUOI 
CHECK(YEAR(GETDATE())-YEAR(GIAOVIEN.NGSINH)>=22);

--14 Tất cả các môn học đều có số tín chỉ lý thuyết và tín chỉ thực hành chênh lệch nhau không quá 3.
ALTER TABLE MONHOC 
ADD CONSTRAINT CK_MONHOC_TINCHI 
CHECK(ABS(MONHOC.TCLT - MONHOC.TCTH)<=3);

--15 Học viên chỉ được thi một môn học nào đó khi lớp của học viên đã học xong môn học này.
GO
CREATE TRIGGER trg_KiemTraDieuKienThi
ON KETQUATHI
FOR INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT *
        FROM INSERTED I
        JOIN HOCVIEN HV ON I.MAHV = HV.MAHV
        JOIN GIANGDAY GD ON HV.MALOP = GD.MALOP AND I.MAMH = GD.MAMH
        WHERE I.NGTHI < GD.DENNGAY 
    )
    BEGIN
        PRINT 'Loi: Hoc vien chi duoc thi khi lop da hoc xong mon hoc nay.'
        ROLLBACK TRANSACTION
    END
END

--16 Mỗi học kỳ của một năm học, một lớp chỉ được học tối đa 3 môn.
GO
CREATE TRIGGER trg_GioiHanMonHoc
ON GIANGDAY
FOR INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT MALOP, HOCKY, NAM
        FROM GIANGDAY
        WHERE MALOP IN (SELECT MALOP FROM INSERTED)
          AND HOCKY IN (SELECT HOCKY FROM INSERTED)
          AND NAM IN (SELECT NAM FROM INSERTED)
        GROUP BY MALOP, HOCKY, NAM
        HAVING COUNT(*) > 3
    )
    BEGIN
        PRINT 'Loi: Mot lop chi duoc hoc toi da 3 mon trong mot hoc ky.'
        ROLLBACK TRANSACTION
    END
END

--17 Sỉ số của một lớp bằng với số lượng học viên thuộc lớp đó.
GO
CREATE TRIGGER trg_CapNhatSiSo
ON HOCVIEN
FOR INSERT, DELETE, UPDATE
AS
BEGIN
    DECLARE @MALOP_INSERTED varchar(3), @MALOP_DELETED varchar(3)
    UPDATE LOP
    SET SISO = (SELECT COUNT(*) FROM HOCVIEN WHERE MALOP = LOP.MALOP)
    WHERE MALOP IN (SELECT MALOP FROM INSERTED)
    UPDATE LOP
    SET SISO = (SELECT COUNT(*) FROM HOCVIEN WHERE MALOP = LOP.MALOP)
    WHERE MALOP IN (SELECT MALOP FROM DELETED)
    PRINT 'Da cap nhat si so lop'
END

--18 Trong quan hệ DIEUKIEN giá trị của thuộc tính MAMH và MAMH_TRUOC trong cùng một bộ không được giống nhau (“A”,”A”) và cũng không tồn tại hai bộ (“A”,”B”) và (“B”,”A”).
GO
CREATE TRIGGER trg_KiemTraDieuKienMonHoc
ON DIEUKIEN
FOR INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT * FROM INSERTED WHERE MAMH = MAMH_TRUOC)
    BEGIN
        PRINT 'Loi: Mon hoc va mon hoc truoc khong duoc trung nhau.'
        ROLLBACK TRANSACTION
        RETURN
    END
    IF EXISTS (
        SELECT * 
        FROM INSERTED I
        JOIN DIEUKIEN DK ON I.MAMH = DK.MAMH_TRUOC AND I.MAMH_TRUOC = DK.MAMH
    )
    BEGIN
        PRINT 'Loi: Vi pham rang buoc vong (A phu thuoc B va B phu thuoc A).'
        ROLLBACK TRANSACTION
    END
END

--19 Các giáo viên có cùng học vị, học hàm, hệ số lương thì mức lương bằng nhau.
go
create trigger trg_KiemTraMucLuong_GiaoVien on GIAOVIEN 
for insert, update 
as
begin 
    if exists(
        select *
        from inserted I 
        join GIAOVIEN GV on I.HOCVI=GV.HOCVI
        and I.HOCHAM=GV.HOCHAM
        and I.HESO=GV.HESO
        where I.MUCLUONG <> GV.MUCLUONG
    )
    begin 
        print 'Loi: Cac giao vien co cung hoc vi, hoc ham, he so luong thi muc luong phai bang nhau.'
        rollback TRAN
    end 
end 

--20 Học viên chỉ được thi lại (lần thi >1) khi điểm của lần thi trước đó dưới 5.
go 
create trigger trg_KiemTraThiLai on KETQUATHI
for insert, update 
as 
BEGIN
    if exists(
        select * 
        from inserted I 
        join KETQUATHI KQ on I.MAHV=KQ.MAHV 
        and I.MAMH=KQ.MAMH
        where I.LANTHI>1 
        and KQ.LANTHI=I.LANTHI-1
        and KQ.DIEM>=5
    )
    begin 
        print 'Loi: Hoc vien chi duoc thi lai khi diem cua lan thi truoc do duoi 5.'
        rollback tran 
    end
end 

--21 Ngày thi của lần thi sau phải lớn hơn ngày thi của lần thi trước (cùng học viên, cùng môn học).
go 
create trigger trg_KiemTraNgayThiLienTiep on KETQUATHI 
for insert, update 
as 
begin 
    if exists(
        select *
        from inserted I
        join KETQUATHI KQ on I.MAHV=KQ.MAHV AND I.MAMH=KQ.MAMH
        where I.LANTHI>1
        and KQ.LANTHI=I.LANTHI-1
        and I.NGTHI<=KQ.NGTHI
    )
    begin
        print 'Loi: Ngay thi cua lan thi sau phai lon hon ngay thi cua lan thi truoc.'
        rollback tran 
    end
end 

--22 Học viên chỉ được thi những môn mà lớp của học viên đó đã học xong.
go
create trigger trg_KiemTraNgayThi on KETQUATHI
for insert, update 
as 
BEGIN
    if exists(
        select *
        from inserted I 
        join HOCVIEN HV on I.MAHV=HV.MAHV
        join GIANGDAY GD on HV.MALOP=GD.MALOP and I.MAMH=GD.MAMH 
        where I.NGTHI<GD.DENNGAY
    )
    begin 
        print 'Loi: Hoc vien chi duoc thi nhung mon ma lop cua hoc vien do da hoc xong (Ngay thi >= Ngay ket thuc hoc)'
        rollback tran 
    end 
end 

--23 Khi phân công giảng dạy một môn học, phải xét đến thứ tự trước sau giữa các môn học (sau khi học xong những môn học phải học trước mới được học những môn liền sau).
go
create trigger trg_KiemTraThuTuGiangDay on GIANGDAY
for insert, update 
as 
begin
    if exists(
        select *
        from inserted I
        join DIEUKIEN DK on I.MAMH=DK.MAMH
        where exists(
            select *
            from HOCVIEN HV
            where HV.MALOP=I.MALOP
            and not exists(
                select * 
                from KETQUATHI KQ
                where KQ.MAHV=HV.MAHV
                and KQ.MAMH=DK.MAMH_TRUOC
                and KQ.DIEM>=5
            )
        )
    )
    begin 
        print 'Loi: Lop chua hoan thanh day du cac mon hoc tien quyet'
        rollback tran
    end
end 

--24 Giáo viên chỉ được phân công dạy những môn thuộc khoa giáo viên đó phụ trách.
go 
create trigger trg_KiemTraKhoaPhanCong on GIANGDAY
for insert, update 
as 
begin 
    if exists(
        select *
        from inserted I 
        join GIAOVIEN GV on I.MAGV=GV.MAGV
        join MONHOC MH on I.MAMH=MH.MAMH
        where GV.MAKHOA <> MH.MAKHOA
    )
    begin 
        print 'Loi: Giao vien chi duoc phan cong day nhung mon hoc thuoc khoa minh phu trach'
        rollback tran 
    end 
end 

--II 

--1 Tăng hệ số lương thêm 0.2 cho những giáo viên là trưởng khoa.
UPDATE GIAOVIEN
SET HESO=HESO+0.2
WHERE EXISTS(
    SELECT*
    FROM KHOA
    WHERE KHOA.TRGKHOA=GIAOVIEN.MAGV
);

--2 Cập nhật giá trị điểm trung bình tất cả các môn học (DIEMTB) của mỗi học viên (tất cả các môn học đều có hệ số 1 và nếu học viên thi một môn nhiều lần, chỉ lấy điểm của lần thi sau cùng).
UPDATE HOCVIEN
SET DTB=(
	SELECT AVG(DIEM)
	FROM KETQUATHI kq
	WHERE kq.MAHV=HOCVIEN.MAHV 
    AND LANTHI=(
        SELECT MAX(LANTHI)
        FROM KETQUATHI
        WHERE MAHV=kq.MAHV 
        AND KETQUATHI.MAMH=kq.MAMH
    )
);


--3 Cập nhật giá trị cho cột GHICHU là “Cam thi” đối với trường hợp: học viên có một môn bất kỳ thi lần thứ 3 dưới 5 điểm.
UPDATE HOCVIEN
SET GHICHU='Cam thi'
WHERE EXISTS(
    SELECT*
    FROM KETQUATHI
    WHERE KETQUATHI.MAHV=HOCVIEN.MAHV 
    AND LANTHI=3 
    AND DIEM<5
);

--4 Cập nhật giá trị cho cột XEPLOAI trong quan hệ HOCVIEN như sau:
UPDATE HOCVIEN
SET XEPLOAI= CASE
WHEN DTB>=9 THEN 'XS'
WHEN DTB>=8 AND DTB<9 THEN 'G'
WHEN DTB>=6.5 AND DTB<8 THEN 'K'
WHEN DTB>=5 AND DTB<6.5 THEN 'TB'
WHEN DTB<5 THEN 'Y'
END;

--III 

--1 In ra danh sách (mã học viên, họ tên, ngày sinh, mã lớp) lớp trưởng của các lớp.
select HV.MAHV, HV.HO, HV.TEN, HV.NGSINH, HV.MALOP
from HOCVIEN HV
join LOP L on HV.MAHV=L.TRGLOP

--2 In ra bảng điểm khi thi (mã học viên, họ tên , lần thi, điểm số) môn CTRR của lớp “K12”, sắp xếp theo tên, họ học viên.
select HV.MAHV, HV.HO, HV.TEN, KQ.LANTHI, KQ.DIEM
from HOCVIEN HV 
join KETQUATHI KQ on HV.MAHV=KQ.MAHV
where HV.MALOP='K12' and HV.MAMH='CTRR'
order by HV.HO, HV.TEN

--3 In ra danh sách những học viên (mã học viên, họ tên) và những môn học mà học viên đó thi lần thứ nhất đã đạt.
select HV.MAHV, HV.HO, HV.TEN, KQ.MAMH
from HOCVIEN HV 
join KETQUATHI KQ on HV.MAHV=KQ.MAHV
where KQ.LANTHI=1 and KQ.KQUA='Dat'

--4 In ra danh sách học viên (mã học viên, họ tên) của lớp “K11” thi môn CTRR không đạt (ở lần thi 1).
select HV.MAHV, HV.HO, HV.TEN
from HOCVIEN HV join KETQUATHI KQ on HV.MAHV=KQ.MAHV
where HV.MALOP='K11' and KQ.MAMH='CTRR' and KQ.LANTHI=1 and KQ.KQUA='Khong Dat'

--5 * Danh sách học viên (mã học viên, họ tên) của lớp “K” thi môn CTRR không đạt (ở tất cả các lần thi).
select HV.MAHV, HV.HO, HV.TEN
from HOCVIEN HV
where left(HV.MALOP, 1)='K' and exists(
    select 1
    from KETQUATHI KQ
    where KQ.MAHV=HV.MAHV and KQ.MAMH='CTRR'
) and not exists(
    select 1
    from KETQUATHI KQ
    where KQ.MAHV=HV.MAHV and KQ.MAMH='CTRR' and KQ.KQUA='Dat'
)

--6 Tìm tên những môn học mà giáo viên có tên “Tran Tam Thanh” dạy trong học kỳ 1 năm 2006.
select mh.TENMH 
from MONHOC mh 
join GIANGDAY gd on gd.MAMH=mh.MAMH 
join GIAOVIEN gv on gv.MAGV=gd.MAGV
where gv.HOTEN='Tran Tam Thanh' 
and year(gd.TUNGAY)=2006 and gd.HOCKY=1

--7 Tìm những môn học (mã môn học, tên môn học) mà giáo viên chủ nhiệm lớp “K11” dạy trong học kỳ 1 năm 2006.
select mh.MAMH, mh.TENMH
from MONHOC mh 
join GIANGDAY gd on mh.MAMH=gd.MAMH 
join GIAOVIEN gv on gd.MAGV=gv.MAGV 
join LOP l on l.MAGVCN=gv.MAGV
where LOP.MALOP='K11' and gd.HOCKY=1 and year(gd.TUNGAY)=2006

--8 Tìm họ tên lớp trưởng của các lớp mà giáo viên có tên “Nguyen To Lan” dạy môn “Co So Du Lieu”.
SELECT HV.HO, HV.TEN
FROM GIAOVIEN GV
JOIN GIANGDAY GD ON GV.MAGV=GD.MAGV
JOIN MONHOC MH ON GD.MAMH=MH.MAMH
JOIN LOP L ON GD.MALOP=L.MALOP
JOIN HOCVIEN HV ON L.TRGLOP=HV.MAHV
WHERE GV.HOTEN='Nguyen To Lan'
AND MH.TENMH='Co So Du Lieu'

--9 In ra danh sách những môn học (mã môn học, tên môn học) phải học liền trước môn “Co So Du Lieu”.
SELECT MH_TRUOC.MAMH, MH_TRUOC.TENMH
FROM MONHOC MH_TRUOC
JOIN DIEUKIEN DK ON MH_TRUOC.MAMH=DK.MAMH_TRUOC
JOIN MONHOC MH_SAU ON DK.MAMH=MH_SAU.MAMH
WHERE MH_SAU.TENMH='Co So Du Lieu'

--10 Môn “Cau Truc Roi Rac” là môn bắt buộc phải học liền trước những môn học (mã môn học, tên môn học) nào.
SELECT MH_SAU.MAMH, MH_SAU.TENMH
FROM MONHOC MH_SAU
JOIN DIEUKIEN DK ON MH_SAU.MAMH=DK.MAMH
JOIN MONHOC MH_TRUOC ON DK.MAMH_TRUOC=MH_TRUOC.MAMH
WHERE MH_TRUOC.TENMH='Cau Truc Roi Rac';

--11 Tìm họ tên giáo viên dạy môn CTRR cho cả hai lớp “K11” và “K12” trong cùng học kỳ 1 năm 2006.
select gv.HOTEN
from GIAOVIEN gv 
join GIANGDAY gd on gv.MAGV=gd.MAGV
where gd.MALOP='K11' and gd.MAMH='CTRR' 
and gd.HOCKY=1 and year(gd.TUNGAY)=2006
intersect
select gv.HOTEN
from GIAOVIEN gv 
join GIANGDAY gd on gv.MAGV=gd.MAGV
where gd.MALOP='K12' and gd.MAMH='CTRR' 
and gd.HOCKY=1 and year(gd.TUNGAY)=2006

--12 Tìm những học viên (mã học viên, họ tên) thi không đạt môn CSDL ở lần thi thứ 1 nhưng chưa thi lại môn này.
select hv.MAHV, hv.HO, hv.TEN
from HOCVIEN hv 
join KETQUATHI kq on hv.MAHV=kq.MAHV
where kq.LANTHI=1 and kq.KQUA='Khong Dat' and kq.MAMH='CSDL' and not exists(
	select 1
	from KETQUATHI kq2
	where kq.MAMH=kq2.MAMH and kq2.MAHV=hv.MAHV and kq2.LANTHI>kq.LANTHI 
)

--13 Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy bất kỳ môn học nào.
select gv.MAGV, gv.HOTEN
from GIAOVIEN gv
where not exists(
	select 1
	from GIANGDAY gd
	where gv.MAGV=gd.MAGV
)

--14 Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy bất kỳ môn học nào thuộc khoa giáo viên đó phụ trách.
select gv.MAGV, gv.HOTEN
from GIAOVIEN gv 
where not exists(
	select 1
	from GIANGDAY gd 
    join MONHOC mh on gd.MAMH=mh.MAMH 
	where gd.MAGV=gv.MAGV and gv.MAKHOA=mh.MAKHOA
)

--15 Tìm họ tên các học viên thuộc lớp “K11” thi một môn bất kỳ quá 3 lần vẫn “Khong dat” hoặc thi lần thứ 2 môn CTRR được 5 điểm.
select hv.HO, hv.TEN
from HOCVIEN hv 
where hv.MALOP='K11' and exists(
	select 1
	from KETQUATHI kq
	where kq.MAHV=hv.MAHV and kq.LANTHI>3 and kq.KQUA='Khong dat'
) 
or exists(
	select 1
	from KETQUATHI kq
	where kq.MAHV=hv.MAHV and kq.LANTHI=2 and kq.MAMH='CTRR' and kq.DIEM=5
)

--16 Tìm họ tên giáo viên dạy môn CTRR cho ít nhất hai lớp trong cùng một học kỳ của một năm học.
select gv.HOTEN
from GIAOVIEN gv 
join GIANGDAY gd on gv.MAGV=gd.MAGV 
where gd.MAMH='CTRR'
group by gv.MAGV, gv.HOTEN, gd.HOCKY, gd.NAM
having count(gd.MALOP)>=2

--17 Danh sách học viên và điểm thi môn CSDL (chỉ lấy điểm của lần thi sau cùng).
select hv.MAHV, hv.HO, hv.TEN, kq.DIEM
from HOCVIEN hv 
join KETQUATHI kq on hv.MAHV=kq.MAHV
where kq.MAMH='CSDL' 
and kq.LANTHI=( 
	select max(LANTHI)
	from KETQUATHI kq2
	where kq2.MAHV=kq.MAHV and kq2.MAMH='CSDL'
)

--18 Danh sách học viên và điểm thi môn “Co So Du Lieu” (chỉ lấy điểm cao nhất của các lần thi).
select hv.MAHV, hv.HO, hv.TEN, kq.DIEM
from HOCVIEN hv 
join KETQUATHI kq on hv.MAHV=kq.MAHV
join MONHOC mh on kq.MAMH=mh.MAMH
where mh.TENMH='Co So Du Lieu' 
and kq.DIEM=( 
	select max(kq2.DIEM)
	from KETQUATHI kq2
    join MONHOC mh on kq2.MAMH=mh.MAMH
	where kq2.MAHV=hv.MAHV and mh.TENMH='Co So Du Lieu' 
)

--19 Khoa nào (mã khoa, tên khoa) được thành lập sớm nhất.
select top 1 with ties k.MAKHOA, k.TENKHOA
from KHOA k
order by k.NGTLAP 

--20 Có bao nhiêu giáo viên có học hàm là “GS” hoặc “PGS”.
select count(*)
from GIAOVIEN gv
where gv.HOCHAM='GS' or gv.HOCHAM='PGS'

--21 Thống kê có bao nhiêu giáo viên có học vị là “CN”, “KS”, “Ths”, “TS”, “PTS” trong mỗi khoa.
select k.MAKHOA, k.TENKHOA, gv.HOCVI, count(*) 
from GIAOVIEN gv 
join KHOA k on gv.MAKHOA=k.MAKHOA
group by k.MAKHOA, k.TENKHOA, gv.HOCVI;

--22 Mỗi môn học thống kê số lượng học viên theo kết quả (đạt và không đạt).
select kq.MAMH, kq.KQUA, count(*)
from KETQUATHI kq
group by kq.MAMH, kq.KQUA

--23 Tìm giáo viên (mã giáo viên, họ tên) là giáo viên chủ nhiệm của một lớp, đồng thời dạy cho lớp đó ít nhất một môn học.
select gv.MAGV, gv.HOTEN
from GIAOVIEN gv 
join LOP l on gv.MAGV=l.MAGVCN
where exists(
	select 1
	from GIANGDAY gd
	where gd.MAGV=gv.MAGV
)

--24 Tìm họ tên lớp trưởng của lớp có sỉ số cao nhất.
select hv.HO, hv.TEN
from HOCVIEN hv 
join LOP l on hv.MAHV=l.TRGLOP
where l.SISO=(
    select MAX(SISO)
    from LOP
)

--25 * Tìm họ tên những LOPTRG thi không đạt quá 3 môn (mỗi môn đều thi không đạt ở tất cả các lần thi).
select hv.HO, hv.TEN
from HOCVIEN hv 
join LOP l on hv.MAHV=l.TRGLOP
where (
	select count(distinct kq1.MAMH)
	from KETQUATHI kq1 
	where kq1.MAHV=hv.MAHV and not exists(
		select 1
		from KETQUATHI kq2
		where kq2.MAHV=kq1.MAHV and kq2.MAMH=kq1.MAMH and kq2.KQUA='Dat' 
	)
)<=3

--26 Tìm học viên (mã học viên, họ tên) có số môn đạt điểm 9,10 nhiều nhất.
select hv.MAHV, hv.HO, hv.TEN
from HOCVIEN hv
where hv.MAHV in(
	select top 1 with ties kq.MAHV
	from KETQUATHI kq
	where kq.DIEM between 9 and 10
	group by kq.MAHV
	order by count(distinct MAMH) desc
)

--27 Trong từng lớp, tìm học viên (mã học viên, họ tên) có số môn đạt điểm 9,10 nhiều nhất.
select hv.MAHV, hv.HO, hv.TEN, hv.MALOP
from HOCVIEN hv 
join KETQUATHI kq on hv.MAHV=kq.MAHV
where kq.DIEM between 9 and 10
group by hv.MAHV, hv.HO, hv.TEN, hv.MALOP
having count(kq.MAMH)>=ALL(
    select count(KQ2.MAMH)
    from HOCVIEN HV2
    join KETQUATHI KQ2 on HV2.MAHV=KQ2.MAHV
    where KQ2.DIEM between 9 and 10 
    and HV2.MALOP=HV.MALOP
    group by HV2.MAHV
)

--28 Trong từng học kỳ của từng năm, mỗi giáo viên phân công dạy bao nhiêu môn học, bao nhiêu lớp.
select gv.MAGV, gd.NAM, gd.HOCKY, 
       count(distinct gd.MAMH) as SoMon, count(distinct gd.MALOP) as SoLop
from GIANGDAY gd 
join GIAOVIEN gv on gv.MAGV=gd.MAGV
group by gv.MAGV, gd.NAM, gd.HOCKY

--29 Trong từng học kỳ của từng năm, tìm giáo viên (mã giáo viên, họ tên) giảng dạy nhiều nhất.
select GV.MAGV, GV.HOTEN, GD.HOCKY, GD.NAM
from GIAOVIEN GV
join GIANGDAY GD on GV.MAGV=GD.MAGV
group by GV.MAGV, GV.HOTEN, GD.HOCKY, GD.NAM
having count(*)>=ALL(
    select count(*)
    from GIANGDAY GD2
    where GD2.HOCKY=GD.HOCKY 
    and GD2.NAM=GD.NAM
    group by GD2.MAGV
)

--30 Tìm môn học (mã môn học, tên môn học) có nhiều học viên thi không đạt (ở lần thi thứ 1) nhất.
select mh.MAMH, mh.TENMH
from MONHOC mh
where mh.MAMH in(
    select top 1 with ties kq.MAMH
	from KETQUATHI kq
	where kq.LANTHI=1 and kq.KQUA='Khong dat'
	group by kq.MAMH
	order by count(kq.MAHV) desc
)

--31 Tìm học viên (mã học viên, họ tên) thi môn nào cũng đạt (chỉ xét lần thi thứ 1).
select hv.MAHV, hv.HO, hv.TEN
from HOCVIEN hv
where not exists(
		select 1
		from KETQUATHI kq
		where kq.MAHV=hv.MAHV and kq.KQUA='Khong dat' and kq.LANTHI=1
)

--32 * Tìm học viên (mã học viên, họ tên) thi môn nào cũng đạt (chỉ xét lần thi sau cùng).
select hv.MAHV, hv.HO, hv.TEN
from HOCVIEN hv
where not exists(
	select 1
	from KETQUATHI kq
	where kq.MAHV=hv.MAHV and kq.KQUA='Khong dat' and kq.LANTHI=(
		select max(kq2.LANTHI)
		from KETQUATHI kq2
		where kq2.MAHV=kq.MAHV and kq2.MAMH=kq.MAMH
	)
)

--33 * Tìm học viên (mã học viên, họ tên) đã thi tất cả các môn đều đạt (chỉ xét lần thi thứ 1).
select hv.MAHV, hv.HO, hv.TEN
from HOCVIEN hv
where not exists(
	select 1
	from MONHOC mh
	where not exists(
		select 1
		from KETQUATHI kq
		where kq.MAMH=mh.MAMH and kq.MAHV=hv.MAHV 
        and kq.KQUA='Dat' and kq.LANTHI=1
	)
)

--34 * Tìm học viên (mã học viên, họ tên) đã thi tất cả các môn đều đạt (chỉ xét lần thi sau cùng).
select hv.MAHV, hv.HO, hv.TEN
from HOCVIEN hv
where not exists(
	select 1
	from MONHOC mh
	where not exists(
		select 1
		from KETQUATHI kq
		where kq.MAMH=mh.MAMH and kq.MAHV=hv.MAHV 
        and kq.KQUA='Dat' and kq.LANTHI=(
			select max(kq2.LANTHI)
			from KETQUATHI kq2
			where kq2.MAHV=kq.MAHV and kq2.MAMH=kq.MAMH
		)
	)
)

--35 ** Tìm học viên (mã học viên, họ tên) có điểm thi cao nhất trong từng môn (lấy điểm ở lần thi sau cùng).
select HV.MAHV, HV.HO, HV.TEN, KQ.MAMH, KQ.DIEM
from HOCVIEN HV
join KETQUATHI KQ on HV.MAHV=KQ.MAHV
where KQ.LANTHI=(
    select max(LANTHI)
    from KETQUATHI KQ2
    where KQ2.MAHV=KQ.MAHV and KQ2.MAMH=KQ.MAMH
)
and KQ.DIEM>=ALL(
    select KQ3.DIEM
    from KETQUATHI KQ3
    where KQ3.MAMH=KQ.MAMH
    and KQ3.LANTHI=(
        select max(LANTHI)
        from KETQUATHI KQ4
        where KQ4.MAHV=KQ3.MAHV and KQ4.MAMH=KQ3.MAMH
    )
)