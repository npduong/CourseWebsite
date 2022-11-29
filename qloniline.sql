CREATE  TABLE `qlonline`.`hoadon` (
  `maHD` VARCHAR(10) NOT NULL ,
  `ngaydat` DATETIME NULL ,
  `maKH` VARCHAR(10) NULL ,
  `tinhtrang` VARCHAR(45) NULL ,
  PRIMARY KEY (`maHD`) ,
  INDEX `maKH_idx` (`maKH` ASC) ,
  CONSTRAINT `maKH`
    FOREIGN KEY (`maKH` )
    REFERENCES `qlonline`.`khoahoc` (`maKH` )
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `thongtintaikhoan` (
  `taikhoan` varchar(45) DEFAULT NULL,
  `matkhau` varchar(45) DEFAULT NULL,
  `hoten` varchar(45) DEFAULT NULL,
  `sdt` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `diachi` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`taikhoan`)
) 

CREATE  TABLE `qlonline`.`chitiethd` (
  `maHD` VARCHAR(10) NOT NULL ,
  `idKH` INT NULL ,
  `soHD` VARCHAR(45) NULL ,
  `soluong` VARCHAR(45) NULL ,
  PRIMARY KEY (`maHD`) ,
  INDEX `idKH_idx` (`idKH` ASC) ,
  CONSTRAINT `idKH`
    FOREIGN KEY (`idKH` )
    REFERENCES `qlonline`.`khanhhang` (`idKH` )
    ON DELETE CASCADE
    ON UPDATE CASCADE);

ALTER TABLE `qlonline`.`giangvien` ADD COLUMN `taikhoan` VARCHAR(45) NULL  AFTER `maKH` , 
  ADD CONSTRAINT `taikhoan`
  FOREIGN KEY (`taikhoan` )
  REFERENCES `qlonline`.`dangnhap` (`taikhoan` )
  ON DELETE CASCADE
  ON UPDATE CASCADE
, ADD INDEX `taikhoan_idx` (`taikhoan` ASC);
=

CREATE  TABLE `qlonline`.`khanhhang` (
  `idKH` INT NOT NULL ,
  `tenKH` VARCHAR(45) NULL ,
  `diachi` VARCHAR(100) NULL ,
  `sdt` VARCHAR(45) NULL ,
  `cccd` VARCHAR(45) NULL ,
  `gioitinh` VARCHAR(45) NULL ,
  `email` VARCHAR(45) NULL ,
  `taikhoan` VARCHAR(45) NULL ,
  PRIMARY KEY (`idKH`) );

CREATE  TABLE `qlonline`.`dangky` (
  `iddangky` INT NOT NULL ,
  `taikhoan` VARCHAR(45) NULL ,
  `matkhau` VARCHAR(45) NULL ,
  `hoten` VARCHAR(45) NULL ,
  `sdt` VARCHAR(45) NULL ,
  `email` VARCHAR(45) NULL ,
  `diachi` VARCHAR(45) NULL ,
  PRIMARY KEY (`iddangky`) );


CREATE  TABLE `qlonline`.`loaikhoahoc` (
  `maloai` VARCHAR(10) NOT NULL ,
  `tenloai` VARCHAR(45) NULL ,
  PRIMARY KEY (`maloai`) );

CREATE  TABLE `qlonline`.`khoahoc` (
  `maKH` VARCHAR(10) NOT NULL ,
  `tenKH` VARCHAR(45) NULL ,
  `chiphi` VARCHAR(45) NULL ,
  `ngaymo` DATE NULL ,
  `maloai` VARCHAR(10) NULL ,
  PRIMARY KEY (`maKH`) ,
  INDEX `maloai_idx` (`maloai` ASC) ,
  CONSTRAINT `maloai`
    FOREIGN KEY (`maloai` )
    REFERENCES `qlonline`.`loaikhoahoc` (`maloai` )
    ON DELETE CASCADE
    ON UPDATE CASCADE);


CREATE  TABLE `qlonline`.`giangvien` (
  `magiangvien` VARCHAR(20) NOT NULL ,
  `tengiangvien` VARCHAR(45) NULL ,
  `gioitinh` VARCHAR(45) NULL ,
  `sdt` VARCHAR(45) NULL ,
  `diachi` VARCHAR(45) NULL ,
  `email` VARCHAR(45) NULL ,
  `chuyenmon` TEXT NULL ,
  `maKH` VARCHAR(20) NULL ,
  PRIMARY KEY (`magiangvien`) ,
  INDEX `maKH_idx` (`maKH` ASC) ,
  CONSTRAINT `maKH`
    FOREIGN KEY (`maKH` )
    REFERENCES `qlonline`.`khoahoc` (`maKH` )
    ON DELETE CASCADE
    ON UPDATE CASCADE);


ALTER TABLE `qlonline`.`giangvien` ADD COLUMN `taikhoan` VARCHAR(45) NULL  AFTER `maKH` , 
  ADD CONSTRAINT `taikhoan`
  FOREIGN KEY (`taikhoan` )
  REFERENCES `qlonline`.`dangnhap` (`taikhoan` )
  ON DELETE CASCADE
  ON UPDATE CASCADE
, ADD INDEX `taikhoan_idx` (`taikhoan` ASC);

ALTER TABLE `qlonline`.`khanhhang` 
  ADD CONSTRAINT `taikhoan`
  FOREIGN KEY (`taikhoan` )
  REFERENCES `qlonline`.`thongtintaikhoan` (`taikhoan` )
  ON DELETE CASCADE
  ON UPDATE CASCADE
, ADD INDEX `taikhoan_idx` (`taikhoan` ASC);

CREATE TABLE `hoadon` (
  `maHD` varchar(10) NOT NULL,
  `ngaydat` datetime DEFAULT NULL,
  `maKH` varchar(10) DEFAULT NULL,
  `tinhtrang` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`maHD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
