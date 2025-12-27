CREATE DATABASE QLBH_2020
GO
-----------------------------------------------------
-----------------------------------------------------
USE QLBH_2020
GO
---------------------------------------------
-- KHACHANG
CREATE TABLE KHACHHANG(
	MAKH	char(4) not null,	
	HOTEN	varchar(40),
	DCHI	varchar(50),
	SODT	varchar(20),
	NGSINH	smalldatetime,
	NGDK	smalldatetime,
	DOANHSO	money,
	constraint pk_kh primary key(MAKH)
)
---------------------------------------------
-- NHANVIEN
CREATE TABLE NHANVIEN(
	MANV	char(4) not null,	
	HOTEN	varchar(40),
	SODT	varchar(20),
	NGVL	smalldatetime	
	constraint pk_nv primary key(MANV)
)
---------------------------------------------
-- SANPHAM
CREATE TABLE SANPHAM(
	MASP	char(4) not null,
	TENSP	varchar(40),
	DVT	varchar(20),
	NUOCSX	varchar(40),
	GIA	money,
	constraint pk_sp primary key(MASP)	
)
---------------------------------------------
-- HOADON
CREATE TABLE HOADON(
	SOHD	int not null,
	NGHD 	smalldatetime,
	MAKH 	char(4),
	MANV 	char(4),
	TRIGIA	money,
	constraint pk_hd primary key(SOHD)
)
---------------------------------------------
-- CTHD
CREATE TABLE CTHD(
	SOHD	int,
	MASP	char(4),
	SL	int,
	constraint pk_cthd primary key(SOHD,MASP)
)

-- Khoa ngoai cho bang HOADON
ALTER TABLE HOADON ADD CONSTRAINT fk01_HD FOREIGN KEY(MAKH) REFERENCES KHACHHANG(MAKH)
ALTER TABLE HOADON ADD CONSTRAINT fk02_HD FOREIGN KEY(MANV) REFERENCES NHANVIEN(MANV)
-- Khoa ngoai cho bang CTHD
ALTER TABLE CTHD ADD CONSTRAINT fk01_CTHD FOREIGN KEY(SOHD) REFERENCES HOADON(SOHD)
ALTER TABLE CTHD ADD CONSTRAINT fk02_CTHD FOREIGN KEY(MASP) REFERENCES SANPHAM(MASP)
-----------------------------------------------------
-----------------------------------------------------
set dateformat dmy
-------------------------------
-- KHACHHANG
insert into khachhang values('KH01','Nguyen Van A','731 Tran Hung Dao, Q5, TpHCM','8823451','22/10/1960','22/07/2006',13060000)
insert into khachhang values('KH02','Tran Ngoc Han','23/5 Nguyen Trai, Q5, TpHCM','908256478','03/04/1974','30/07/2006',280000)
insert into khachhang values('KH03','Tran Ngoc Linh','45 Nguyen Canh Chan, Q1, TpHCM','938776266','12/06/1980','08/05/2006',3860000)
insert into khachhang values('KH04','Tran Minh Long','50/34 Le Dai Hanh, Q10, TpHCM','917325476','09/03/1965','10/02/2006',250000)
insert into khachhang values('KH05','Le Nhat Minh','34 Truong Dinh, Q3, TpHCM','8246108','10/03/1950','28/10/2006',21000)
insert into khachhang values('KH06','Le Hoai Thuong','227 Nguyen Van Cu, Q5, TpHCM','8631738','31/12/1981','24/11/2006',915000)
insert into khachhang values('KH07','Nguyen Van Tam','32/3 Tran Binh Trong, Q5, TpHCM','916783565','06/04/1971','12/01/2006',12500)
insert into khachhang values('KH08','Phan Thi Thanh','45/2 An Duong Vuong, Q5, TpHCM','938435756','10/01/1971','13/12/2006',365000)
insert into khachhang values('KH09','Le Ha Vinh','873 Le Hong Phong, Q5, TpHCM','8654763','03/09/1979','14/01/2007',70000)
insert into khachhang values('KH10','Ha Duy Lap','34/34B Nguyen Trai, Q1, TpHCM','8768904','02/05/1983','16/01/2007',67500)

-------------------------------
-- NHANVIEN
insert into nhanvien values('NV01','Nguyen Nhu Nhut','927345678','13/04/2006')
insert into nhanvien values('NV02','Le Thi Phi Yen','987567390','21/04/2006')
insert into nhanvien values('NV03','Nguyen Van B','997047382','27/04/2006')
insert into nhanvien values('NV04','Ngo Thanh Tuan','913758498','24/06/2006')
insert into nhanvien values('NV05','Nguyen Thi Truc Thanh','918590387','20/07/2006')

-------------------------------
-- SANPHAM
insert into sanpham values('BC01','But chi','cay','Singapore',3000)
insert into sanpham values('BC02','But chi','cay','Singapore',5000)
insert into sanpham values('BC03','But chi','cay','Viet Nam',3500)
insert into sanpham values('BC04','But chi','hop','Viet Nam',30000)
insert into sanpham values('BB01','But bi','cay','Viet Nam',5000)
insert into sanpham values('BB02','But bi','cay','Trung Quoc',7000)
insert into sanpham values('BB03','But bi','hop','Thai Lan',100000)
insert into sanpham values('TV01','Tap 100 giay mong','quyen','Trung Quoc',2500)
insert into sanpham values('TV02','Tap 200 giay mong','quyen','Trung Quoc',4500)
insert into sanpham values('TV03','Tap 100 giay tot','quyen','Viet Nam',3000)
insert into sanpham values('TV04','Tap 200 giay tot','quyen','Viet Nam',5500)
insert into sanpham values('TV05','Tap 100 trang','chuc','Viet Nam',23000)
insert into sanpham values('TV06','Tap 200 trang','chuc','Viet Nam',53000)
insert into sanpham values('TV07','Tap 100 trang','chuc','Trung Quoc',34000)
insert into sanpham values('ST01','So tay 500 trang','quyen','Trung Quoc',40000)
insert into sanpham values('ST02','So tay loai 1','quyen','Viet Nam',55000)
insert into sanpham values('ST03','So tay loai 2','quyen','Viet Nam',51000)
insert into sanpham values('ST04','So tay','quyen','Thai Lan',55000)
insert into sanpham values('ST05','So tay mong','quyen','Thai Lan',20000)
insert into sanpham values('ST06','Phan viet bang','hop','Viet Nam',5000)
insert into sanpham values('ST07','Phan khong bui','hop','Viet Nam',7000)
insert into sanpham values('ST08','Bong bang','cai','Viet Nam',1000)
insert into sanpham values('ST09','But long','cay','Viet Nam',5000)
insert into sanpham values('ST10','But long','cay','Trung Quoc',7000)

-------------------------------
-- HOADON
insert into hoadon values(1001,'23/07/2006','KH01','NV01',320000)
insert into hoadon values(1002,'12/08/2006','KH01','NV02',840000)
insert into hoadon values(1003,'23/08/2006','KH02','NV01',100000)
insert into hoadon values(1004,'01/09/2006','KH02','NV01',180000)
insert into hoadon values(1005,'20/10/2006','KH01','NV02',3800000)
insert into hoadon values(1006,'16/10/2006','KH01','NV03',2430000)
insert into hoadon values(1007,'28/10/2006','KH03','NV03',510000)
insert into hoadon values(1008,'28/10/2006','KH01','NV03',440000)
insert into hoadon values(1009,'28/10/2006','KH03','NV04',200000)
insert into hoadon values(1010,'01/11/2006','KH01','NV01',5200000)
insert into hoadon values(1011,'04/11/2006','KH04','NV03',250000)
insert into hoadon values(1012,'30/11/2006','KH05','NV03',21000)
insert into hoadon values(1013,'12/12/2006','KH06','NV01',5000)
insert into hoadon values(1014,'31/12/2006','KH03','NV02',3150000)
insert into hoadon values(1015,'01/01/2007','KH06','NV01',910000)
insert into hoadon values(1016,'01/01/2007','KH07','NV02',12500)
insert into hoadon values(1017,'02/01/2007','KH08','NV03',35000)
insert into hoadon values(1018,'13/01/2007','KH08','NV03',330000)
insert into hoadon values(1019,'13/01/2007','KH01','NV03',30000)
insert into hoadon values(1020,'14/01/2007','KH09','NV04',70000)
insert into hoadon values(1021,'16/01/2007','KH10','NV03',67500)
insert into hoadon values(1022,'16/01/2007',Null,'NV03',7000)
insert into hoadon values(1023,'17/01/2007',Null,'NV01',330000)

-------------------------------
-- CTHD
insert into cthd values(1001,'TV02',10)
insert into cthd values(1001,'ST01',5)
insert into cthd values(1001,'BC01',5)
insert into cthd values(1001,'BC02',10)
insert into cthd values(1001,'ST08',10)
insert into cthd values(1002,'BC04',20)
insert into cthd values(1002,'BB01',20)
insert into cthd values(1002,'BB02',20)
insert into cthd values(1003,'BB03',10)
insert into cthd values(1004,'TV01',20)
insert into cthd values(1004,'TV02',10)
insert into cthd values(1004,'TV03',10)
insert into cthd values(1004,'TV04',10)
insert into cthd values(1005,'TV05',50)
insert into cthd values(1005,'TV06',50)
insert into cthd values(1006,'TV07',20)
insert into cthd values(1006,'ST01',30)
insert into cthd values(1006,'ST02',10)
insert into cthd values(1007,'ST03',10)
insert into cthd values(1008,'ST04',8)
insert into cthd values(1009,'ST05',10)
insert into cthd values(1010,'TV07',50)
insert into cthd values(1010,'ST07',50)
insert into cthd values(1010,'ST08',100)
insert into cthd values(1010,'ST04',50)
insert into cthd values(1010,'TV03',100)
insert into cthd values(1011,'ST06',50)
insert into cthd values(1012,'ST07',3)
insert into cthd values(1013,'ST08',5)
insert into cthd values(1014,'BC02',80)
insert into cthd values(1014,'BB02',100)
insert into cthd values(1014,'BC04',60)
insert into cthd values(1014,'BB01',50)
insert into cthd values(1015,'BB02',30)
insert into cthd values(1015,'BB03',7)
insert into cthd values(1016,'TV01',5)
insert into cthd values(1017,'TV02',1)
insert into cthd values(1017,'TV03',1)
insert into cthd values(1017,'TV04',5)
insert into cthd values(1018,'ST04',6)
insert into cthd values(1019,'ST05',1)
insert into cthd values(1019,'ST06',2)
insert into cthd values(1020,'ST07',10)
insert into cthd values(1021,'ST08',5)
insert into cthd values(1021,'TV01',7)
insert into cthd values(1021,'TV02',10)
insert into cthd values(1022,'ST07',1)
insert into cthd values(1023,'ST04',6)
----------------------------------------------------------------

--I 

--2 Thêm vào thuộc tính GHICHU có kiểu dữ liệu varchar(20) cho quan hệ SANPHAM.
ALTER TABLE SANPHAM ADD GHICHU varchar(20);

--3 Thêm vào thuộc tính LOAIKH có kiểu dữ liệu là tinyint cho quan hệ KHACHHANG.
ALTER TABLE KHACHHANG ADD LOAIKH tinyint;

--4 Sửa kiểu dữ liệu của thuộc tính GHICHU trong quan hệ SANPHAM thành varchar(100).
ALTER TABLE SANPHAM ALTER COLUMN GHICHU varchar(100);

--5 Xóa thuộc tính GHICHU trong quan hệ SANPHAM.
ALTER TABLE SANPHAM DROP COLUMN GHICHU;

--6 Làm thế nào để thuộc tính LOAIKH trong quan hệ KHACHHANG có thể lưu các giá trị là: “Vang lai”, “Thuong xuyen”, “Vip”, …
ALTER TABLE KHACHHANG
ADD CONSTRAINT CK_KHACHHANG_LOAIKH
CHECK (LOAIKH IN ('Vang lai', 'Thuong xuyen', 'Vip'));

--7 Đơn vị tính của sản phẩm chỉ có thể là (“cay”,”hop”,”cai”,”quyen”,”chuc”)
ALTER TABLE SANPHAM
ADD CONSTRAINT CK_SANPHAM_DVT
CHECK (DVT IN ('cay', 'hop', 'cai', 'quyen', 'chuc'));

--8 Giá bán của sản phẩm từ 500 đồng trở lên.
ALTER TABLE SANPHAM
ADD CONSTRAINT CK_SANPHAM_GIA
CHECK (GIA >=500);

--9 Mỗi lần mua hàng, khách hàng phải mua ít nhất 1 sản phẩm.
ALTER TABLE CTHD
ADD CONSTRAINT CK_CTHD_SL
CHECK (SL>=1);

--10 Ngày khách hàng đăng ký là khách hàng thành viên phải lớn hơn ngày sinh của người đó.
ALTER TABLE KHACHHANG
ADD CONSTRAINT CK_KHACHHANG_NGDK
CHECK (NGDK>NGSINH);

--11 Ngày mua hàng (NGHD) của một khách hàng thành viên sẽ lớn hơn hoặc bằng ngày khách hàng đó đăng ký thành viên (NGDK).

--12 Ngày bán hàng (NGHD) của một nhân viên phải lớn hơn hoặc bằng ngày nhân viên đó vào làm.

--13 Mỗi một hóa đơn phải có ít nhất một chi tiết hóa đơn.

--14 Trị giá của một hóa đơn là tổng thành tiền (số lượng*đơn giá) của các chi tiết thuộc hóa đơn đó.

--15 Doanh số của một khách hàng là tổng trị giá các hóa đơn mà khách hàng thành viên đó đã mua.

--II

--2 Tạo quan hệ SANPHAM1 chứa toàn bộ dữ liệu của quan hệ SANPHAM. Tạo quan hệ KHACHHANG1 chứa toàn bộ dữ liệu của quan hệ KHACHHANG.
SELECT* INTO KHACHHANG1
FROM KHACHHANG
SELECT* INTO SANPHAM1
FROM SANPHAM

--3 Cập nhật giá tăng 5% đối với những sản phẩm do “Thai Lan” sản xuất (cho quan hệ SANPHAM1)
UPDATE SANPHAM1
SET GIA=GIA*1.05
WHERE SANPHAM1.NUOCSX='Thai Lan';

--4 Cập nhật giá giảm 5% đối với những sản phẩm do “Trung Quoc” sản xuất có giá từ 10.000 trở xuống (cho quan hệ SANPHAM1).
UPDATE SANPHAM1
SET GIA=GIA*0.95
WHERE SANPHAM1.NUOCSX='Trung Quoc' AND SANPHAM1.GIA<=10000;

--5 Cập nhật giá trị LOAIKH là “Vip” đối với những khách hàng đăng ký thành viên 
-- trước ngày 1/1/2007 có doanh số từ 10.000.000 trở lên hoặc khách hàng đăng ký thành viên 
-- từ 1/1/2007 trở về sau có doanh số từ 2.000.000 trở lên (cho quan hệ KHACHHANG1).
UPDATE KHACHHANG1
SET LOAIKH='Vip'
WHERE (NGDK<'2007-01-01' AND DOANHSO>=10000000)
   OR (NGDK>='2007-01-01' AND DOANHSO>=2000000);

--III

--1 In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất.
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX='Trung Quoc'

--2 In ra danh sách các sản phẩm (MASP, TENSP) có đơn vị tính là “cay”, ”quyen”.
SELECT MASP, TENSP
FROM SANPHAM
WHERE DVT='cay' OR DVT='quyen'

--3 In ra danh sách các sản phẩm (MASP,TENSP) có mã sản phẩm bắt đầu là “B” và kết thúc là “01”.
SELECT MASP, TENSP
FROM SANPHAM
WHERE MASP LIKE('B%01')

--4 In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có giá từ 30.000 đến 40.000.
SELECT MASP, TENSP
FROM SANPHAM
WHERE GIA>=30000 AND GIA <=40000 
AND NUOCSX='Trung Quoc'

--5 In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” hoặc “Thai Lan” sản xuất có giá từ 30.000 đến 40.000.
SELECT MASP, TENSP
FROM SANPHAM
WHERE GIA>=30000 AND GIA <=40000 AND (NUOCSX IN('Trung Quoc','Thai Lan'))

--6 In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2007 và ngày 2/1/2007.
SELECT SOHD, TRIGIA
FROM HOADON
WHERE NGHD='1/1/2007' OR NGHD='2/1/2007'

--7 In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo ngày (tăng dần) và trị giá của hóa đơn (giảm dần).
SELECT SOHD, TRIGIA
FROM HOADON
WHERE MONTH(NGHD)=1 AND YEAR(NGHD)=2007		
ORDER BY NGHD ASC, TRIGIA DESC

--8 In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.
SELECT MAKH, HOTEN
FROM KHACHHANG
WHERE EXISTS(
    SELECT *
    FROM HOADON
    WHERE NGHD='1/1/2007' 
    AND KHACHHANG.MAKH=HOADON.MAKH
);

--9 In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Nguyen Van B” lập trong ngày 28/10/2006.
SELECT SOHD, TRIGIA
FROM HOADON
WHERE NGHD='28/10/2006' AND EXISTS(
    SELECT *
    FROM NHANVIEN
    WHERE NHANVIEN.MANV=HOADON.MANV 
    AND NHANVIEN.HOTEN='Nguyen Van B'
)

--10 In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyen Van A” mua trong tháng 10/2006.
SELECT MASP, TENSP
FROM SANPHAM
WHERE EXISTS(
    SELECT *
    FROM CTHD
    WHERE CTHD.MASP=SANPHAM.MASP AND EXISTS(
	    SELECT *
	    FROM HOADON
	    WHERE CTHD.SOHD=HOADON.SOHD AND MONTH(NGHD)=10 AND YEAR(NGHD)=2006 AND EXISTS(
		    SELECT *
		    FROM KHACHHANG
		    WHERE KHACHHANG.HOTEN='Nguyen Van A' AND KHACHHANG.MAKH=HOADON.MAKH
        )
    )
)

--11 Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”.
SELECT SOHD
FROM HOADON
WHERE EXISTS(
    SELECT *
    FROM CTHD
    WHERE CTHD.MASP IN('BB01','BB02') 
    AND CTHD.SOHD=HOADON.SOHD
)

--12 Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
SELECT SOHD
FROM HOADON
WHERE EXISTS(
    SELECT *
    FROM CTHD
    WHERE CTHD.MASP IN('BB01','BB02') 
    AND CTHD.SOHD=HOADON.SOHD 
    AND CTHD.SL>=10 AND CTHD.SL<=20
)

--13 Tìm các số hóa đơn mua cùng lúc 2 sản phẩm có mã số “BB01” và “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
SELECT SOHD
FROM HOADON
WHERE EXISTS(
    SELECT *
    FROM CTHD
    WHERE CTHD.MASP='BB01' 
    AND CTHD.SOHD=HOADON.SOHD 
    AND CTHD.SL>=10 AND CTHD.SL<=20
) 
    AND EXISTS(
    SELECT *
    FROM CTHD
    WHERE CTHD.MASP='BB02' 
    AND CTHD.SOHD=HOADON.SOHD 
    AND CTHD.SL>=10 AND CTHD.SL<=20
)

--14 In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất hoặc các sản phẩm được bán ra trong ngày 1/1/2007.
SELECT MASP,TENSP
FROM SANPHAM
WHERE SANPHAM.NUOCSX='Trung Quoc' OR EXISTS(
    SELECT *
    FROM CTHD
    WHERE CTHD.MASP=SANPHAM.MASP AND EXISTS(
        SELECT *
        FROM HOADON
        WHERE HOADON.SOHD=CTHD.SOHD 
        AND HOADON.NGHD='1/1/2007'
    )
)

--15 In ra danh sách các sản phẩm (MASP,TENSP) không bán được.
SELECT MASP,TENSP
FROM SANPHAM
WHERE NOT EXISTS(
    SELECT *
    FROM CTHD
    WHERE CTHD.MASP=SANPHAM.MASP
)

--16 In ra danh sách các sản phẩm (MASP,TENSP) không bán được trong năm 2006.
SELECT MASP,TENSP
FROM SANPHAM
WHERE NOT EXISTS(
    SELECT *
    FROM CTHD
    WHERE CTHD.MASP=SANPHAM.MASP AND EXISTS(
        SELECT *
        FROM HOADON
        WHERE CTHD.SOHD=HOADON.SOHD 
        AND YEAR(HOADON.NGHD)=2006
    )
)

--17 In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất không bán được trong năm 2006.
SELECT MASP,TENSP
FROM SANPHAM
WHERE SANPHAM.NUOCSX='Trung Quoc' AND NOT EXISTS(
    SELECT *
    FROM CTHD
    WHERE CTHD.MASP=SANPHAM.MASP AND EXISTS(
        SELECT *
        FROM HOADON
        WHERE CTHD.SOHD=HOADON.SOHD AND YEAR(HOADON.NGHD)=2006
    )
)

--18 Tìm số hóa đơn đã mua tất cả các sản phẩm do Singapore sản xuất.
select SOHD
from HOADON
where not exists(
    select 1
    from SANPHAM
    where NUOCSX='Singapore' and not exists(
        select 1
        from CTHD
        where SANPHAM.MASP=CTHD.MASP and HOADON.SOHD=CTHD.SOHD
    )
)

--19 Tìm số hóa đơn trong năm 2006 đã mua ít nhất tất cả các sản phẩm do Singapore sản xuất 
select SOHD
from HOADON
where YEAR(NGHD)=2006 and not exists(
    select 1
    from SANPHAM
    where NUOCSX='Singapore' and not exists(
        select 1
        from CTHD
        where CTHD.SOHD=HOADON.SOHD and CTHD.MASP=SANPHAM.MASP
    )
)

--20 Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?
select count(SOHD)
from HOADON
where not exists(
    select 1
    from KHACHHANG
    where KHACHHANG.MAKH=HOADON.MAKH
)

--21 Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006.
select count(distinct MASP)
from HOADON 
join CTHD on CTHD.SOHD=HOADON.SOHD
where YEAR(NGHD)=2006

--22 Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu ?
select max(TRIGIA) as TriGiaCaoNhat, min(TRIGIA) as TriGiaThapNhat
from HOADON

--23 Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?
select avg(TRIGIA) TriGiaTrungBinh
from HOADON
where year(NGHD)=2006

--24 Tính doanh thu bán hàng trong năm 2006.
select sum(TRIGIA) as DoanhThu2006
from HOADON
where year(NGHD)=2006

--25 Tìm số hóa đơn có trị giá cao nhất trong năm 2006.
select SOHD
from HOADON
where TRIGIA=(
    select max(TRIGIA)
    from HOADON hd
    where year(NGHD)=2006
)

--26 Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.
select HOTEN
from KHACHHANG join HOADON 
on KHACHHANG.MAKH=HOADON.MAKH
where year(NGHD)=2006 and TRIGIA=(
    select max(TRIGIA)
    from HOADON hd 
    where year(NGHD)=2006
)

--27 In ra danh sách 3 khách hàng đầu tiên (MAKH, HOTEN) sắp xếp theo doanh số giảm dần
select top 3 MAKH, HOTEN 
from KHACHHANG
order by DOANHSO desc

--28 In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao nhất.
select MASP, TENSP
from SANPHAM
where GIA in(
    select top 3 GIA
    from SANPHAM sp 
    order by GIA desc
)

--29 In ra danh sách các sản phẩm (MASP, TENSP) do “Thai Lan” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của tất cả các sản phẩm).
select MASP, TENSP
from SANPHAM
where NUOCSX='Thai Lan' and GIA in(
    select top 3 GIA
    from SANPHAM sp 
    order by GIA desc
)

--30 In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quoc” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của sản phẩm do “Trung Quoc” sản xuất).
select MASP, TENSP
from SANPHAM
where NUOCSX='Trung Quoc' and GIA in(
    select top 3 GIA
    from SANPHAM sp 
    where NUOCSX='Trung Quoc'
    order by GIA desc
)

--31 * In ra danh sách khách hàng nằm trong 3 hạng cao nhất (xếp hạng theo doanh số).
select top 3 *
from KHACHHANG
order by DOANHSO DESC

--32 Tính tổng số sản phẩm do “Trung Quoc” sản xuất.
select count(*) as TongSanPham
from SANPHAM
where NUOCSX='Trung Quoc'

--33 Tính tổng số sản phẩm của từng nước sản xuất.
select NUOCSX, count(*) as TongSanPham
from SANPHAM
group by NUOCSX

--34 Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.
select NUOCSX, 
max(GIA) as GiaCaoNhat, 
min(GIA) as GiaThapNhat, 
avg(GIA) as GiaTrungBinh
from SANPHAM 
group by NUOCSX

--35 Tính doanh thu bán hàng mỗi ngày.
select NGHD, sum(TRIGIA) as DoanhThu
from HOADON
group by NGHD

--36 Tính tổng số lượng của từng sản phẩm bán ra trong tháng 10/2006.
select MASP, sum(SL) as TongSoLuong
from HOADON
join CTHD ON HOADON.SOHD=CTHD.SOHD
where month(NGHD)=10 and year(NGHD)=2006
group by MASP

--37 Tính doanh thu bán hàng của từng tháng trong năm 2006.
select month(NGHD) as Thang , sum(TRIGIA) as DoanhThu
from HOADON
where year(NGHD)=2006
group by month(NGHD)
order by Thang

--38 Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau.
select SOHD
from CTHD
group by SOHD
having count(distinct MASP)>=4

--39 Tìm hóa đơn có mua 3 sản phẩm do “Viet Nam” sản xuất (3 sản phẩm khác nhau).
select SOHD
from CTHD 
join SANPHAM on CTHD.MASP=SANPHAM.MASP
where NUOCSX='Viet Nam'
group by SOHD
having count(distinct CTHD.MASP)=3

--40 Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất.
select MAKH, HOTEN
from KHACHHANG
where MAKH=(
    select top 1 with ties HOADON.MAKH
    from HOADON 
    group by HOADON.MAKH
    order by count(HOADON.MAKH) desc	
)

--41 Tháng mấy trong năm 2006, doanh số bán hàng cao nhất ?
select top 1 month(NGHD) as Thang, sum(TRIGIA) DoanhSo
from HOADON 
where YEAR(NGHD)=2006
group by month(NGHD)
order by sum(TRIGIA) desc

--42 Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.
select MASP, TENSP
from SANPHAM
where MASP=(
    select top 1 with ties MASP
    from HOADON 
    join CTHD on HOADON.SOHD=CTHD.SOHD
    where year(NGHD)=2006
    group by MASP
    order by sum(SL) asc
)

--43 *Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất.
select NUOCSX, MASP, TENSP
from SANPHAM
where not exists(
    select 1
    from SANPHAM sp 
    where SANPHAM.NUOCSX=sp.NUOCSX 
    and sp.GIA>SANPHAM.GIA
)
order by NUOCSX

--44 Tìm nước sản xuất sản xuất ít nhất 3 sản phẩm có giá bán khác nhau.select NUOCSX
from SANPHAM
group by NUOCSX
having count(distinct GIA)>=3

--45 *Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều nhất.
