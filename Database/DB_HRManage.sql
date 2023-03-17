-- Dumping database structure for human_resource_management
CREATE DATABASE IF NOT EXISTS `human_resource_management` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `human_resource_management`;

-- Dumping structure for table human_resource_management.department
CREATE TABLE IF NOT EXISTS `department` (
  `DepartmentID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'ID phòng ban',
  `DepartmentCode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'Mã phòng ban',
  `DepartmentName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'Tên phòng ban',
  `PhoneNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'Số đt phòng ban',
  PRIMARY KEY (`DepartmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Bảng phòng ban';

-- Dumping data for table human_resource_management.department: ~0 rows (approximately)
INSERT INTO `department` (`DepartmentID`, `DepartmentCode`, `DepartmentName`, `PhoneNumber`) VALUES
	('04aea886-797b-4c6c-9dbe-b0d95a2d7b81', 'D0003', 'Phòng kế toán', ''),
	('0ea648f3-76e6-4c46-8657-6758e6d6de1f', 'D0004', 'Phòng an ninh', ''),
	('315f777c-7362-47b8-80fd-3148140ccffa', 'D0001', 'Phòng nhân sự', ''),
	('53c979c5-2f75-4a60-a064-f6634f535281', 'D0006', 'Phòng lập trình', ''),
	('8cad9b59-4498-4cab-a21e-1c6a2a6a8617', 'D0005', 'Phòng truyền thông', ''),
	('9fc53d8a-263d-444b-92e2-7b3293546c7e', 'D0008', 'Phòng thu mua', ''),
	('a0f15e3e-5a0a-43e3-aba9-7b28db326302', 'D0007', 'Phòng kiểm thử', ''),
	('a3a9c66e-de54-493f-842a-74dfea87b427', 'D0002', 'Phòng đào tạo', '');

-- Dumping structure for table human_resource_management.employee
CREATE TABLE IF NOT EXISTS `employee` (
  `EmployeeID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'ID nhân viên',
  `EmployeeCode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'MÃ nhân viên',
  `EmployeeName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'Tên nhân viên',
  `DepartmentID` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'Mã phòng ban ,khóa ngoại đến bảng department',
  `PositionName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Tên vị tí',
  `Address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Địa chỉ',
  `DateOfBirth` date DEFAULT NULL COMMENT 'Ngày sinh',
  `Gender` enum('0','1','2') COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Giới tính (0:nam ,1 :nữ ,2: khác)',
  `IdentityNumber` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Số chứng minh nhân dân',
  `TelephoneNumber` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Số đt di động',
  `Email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Địa chỉ email',
  `BankAccountNumber` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Số tài khoản ngân hàng',
  `BankName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Tên ngân hàng',
  `IsManage` enum('1') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Salary` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`),
  UNIQUE KEY `IX_employee_EmployeeCode` (`EmployeeCode`),
  UNIQUE KEY `DepartmentID` (`DepartmentID`,`IsManage`),
  KEY `IX_employee_EmployeeName` (`EmployeeName`),
  KEY `IX_employee_TelephoneNumber` (`TelephoneNumber`),
  KEY `FK_employee_department_DepartmentId` (`DepartmentID`),
  CONSTRAINT `FK_employee_department_DepartmentId` FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`DepartmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Bảng thông tin nhân viên';

-- Dumping data for table human_resource_management.employee: ~0 rows (approximately)
INSERT INTO `employee` (`EmployeeID`, `EmployeeCode`, `EmployeeName`, `DepartmentID`, `PositionName`, `Address`, `DateOfBirth`, `Gender`, `IdentityNumber`, `TelephoneNumber`, `Email`, `BankAccountNumber`, `BankName`, `IsManage`, `Salary`) VALUES
	('14da7f9a-e5a4-4a90-9291-5dfbd5f4cafa', 'NV0003', 'Nguyễn Thị Thu Trà', 'a0f15e3e-5a0a-43e3-aba9-7b28db326302', 'Tổng giám đốc', '144 Xuân Thủy', '1999-05-24', '0', '027099004705', '0389646765', 'tienhoan2405@gmail.com', '19034743410011', 'Techcombank', '1', 20000000.00),
	('175a6dd2-62b1-4403-872f-2c12c03ca6d3', 'NV0001', 'Lưu Tiến Hoan', '315f777c-7362-47b8-80fd-3148140ccffa', 'Tổng giám đốc', '144 Xuân Thủy', '1999-05-24', '0', '027099004705', '0389646765', 'tienhoan2405@gmail.com', '19034743410011', 'Techcombank', '1', 20000000.00),
	('2b06c2fc-7a44-4555-95d2-1ac4176306e0', 'NV0002', 'Nguyễn Thị Thu Trà', '315f777c-7362-47b8-80fd-3148140ccffa', 'Tổng giám đốc', '144 Xuân Thủy', '1999-05-24', '0', '027099004705', '0389646765', 'tienhoan2405@gmail.com', '19034743410011', 'Techcombank', NULL, 20000000.00),
	('5ee3bcba-dbeb-4b13-941e-1ccc4f67edee', 'NV0004', 'Nguyễn Thị Thu Trà', '04aea886-797b-4c6c-9dbe-b0d95a2d7b81', 'Tổng giám đốc', '144 Xuân Thủy', '1999-05-24', '0', '027099004705', '0389646765', 'tienhoan2405@gmail.com', '19034743410011', 'Techcombank', '1', 20000000.00);

-- Dumping structure for table human_resource_management.user
CREATE TABLE IF NOT EXISTS `user` (
  `userId` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `userCode` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fullName` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table human_resource_management.user: ~0 rows (approximately)
INSERT INTO `user` (`userId`, `username`, `userCode`, `password`, `fullName`) VALUES
	('5329b76b-d244-4ef1-9deb-75babf5bba69', 'admin2', 'Ad002', '090998', 'Nguyễn Thị Thu Trà'),
	('c73e8eb5-daca-49e5-9ec8-8409669b1431', 'admin1', 'Ad001', '240599', 'Lưu Tiến Hoan');

