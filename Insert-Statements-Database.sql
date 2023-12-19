USE COB34;
INSERT INTO Classification (ClassificationID, Name)
VALUES
	('A', 'AgriBusiness'),
	('C', 'Co-Op'),
	('F', 'Farmer Owned');
 
INSERT INTO Variety (VarietyID, Description, AverageYield)
VALUES
	('BC28', 'Corn Stress Tolerant', 180),
	('BC39', 'Corn Top Yield', 200),
	('BS4N', 'Soybean Excellent yield', 43.5),
	('BS81', 'Soybean Top Yield', 50),
	('P81Y', 'Soybean good with low iron', 45),
	('P98C', 'Corn Hybred Corn', 180);
 
INSERT INTO Status (Status, Code)
VALUES
	(0, 'Late'),
	(1, 'OK');
 
INSERT INTO Member (MemberID, Name, ContactMethod, StartDate, EndDate)
VALUES
	('M0000', 'Bob Bureaucrat', 'BB@REDD.net', '2016-05-09', NULL),
	('M1012', 'Jackson Smith', NULL, '2016-06-01', '2020-07-23'),
	('M1013', 'Jose Castro', '555-1212', '2016-06-01', NULL),
	('M1023', 'Avinash Pandey', 'U@REDD.net', '2016-06-15', NULL),
	('M1024', 'Carl Carlson', 'CC@REDD.net', '2016-06-20', NULL),
	('M1201', 'Laura Fergeson', 'LF@REDD.net', '2016-08-20', NULL),
	('M1202', 'Kevin Kilroy', NULL, '2016-08-20', NULL),
	('M1203', 'Gabrielle Miller', 'P.O. Box 333', '2016-08-25', NULL),
	('M1204', 'Marco Miller', 'P.O. Box 333', '2016-08-25', NULL),
	('M0101', 'Sam Supervisor', 'SS@REDD.net', '2016-05-30', NULL),
	('M0102', 'Fred Foreman', 'FF@REDD.net', '2016-05-31', NULL),
	('M0103', 'Mary Manager', 'MM@REDD.net', '2016-06-01', NULL),
	('M0201', 'ABC Combine', 'AC@COB.net', '2016-08-15', NULL),
	('M0207', 'Bill Smith', 'BS@COB.net', '2016-08-15', NULL),
	('M0214', 'Doe Farming', 'DF@COB.net', '2016-08-15', NULL),
	('M0217', 'Deere Equip', 'DE@COB.net', '2016-08-15', NULL),
	('M0219', 'Southern Harvest', 'SH@COB.net', '2016-08-15', NULL),
	('M0220', 'Harvest, Inc', 'HI@COB.net', '2016-08-15', '2020-10-14');
 
INSERT INTO Manager (MemberID, LastAccess)
VALUES
	('M0101', NULL),
	('M0102', NULL),
	('M0103', NULL);
 
INSERT INTO ProjectManager (MemberID, ProjectReview)
VALUES
	('M0000', NULL);
 
INSERT INTO Hrarvester (MemberID, ClassificationID)
VALUES
	('M0201', 'A'),
	('M0207', 'C'),
	('M0214', 'F'),
	('M0217', 'F'),
	('M0219', 'C'),
	('M0220', 'C');
 
INSERT INTO Region (RegionID, Name, MemberID)
VALUES
	('CI', 'Central IN', 'M0101'),
	('NI', 'Northern IN', 'M0102'),
	('SI', 'Southern IN', 'M0103');
 
INSERT INTO Farm (FarmID, RegionID, FarmName, Size, ClassificationID)
VALUES
	('AA4', 'NI', 'Ace-Agri', 1300, 'A'),
	('AF-100', 'SI', 'Acme Farms', 1000, 'A'),
	('F-8', 'NI', 'Farm 8', 870, 'C'),
	('Mill-1', 'SI', 'Miller Farm', 400, 'F'),
	('Mill-2', 'SI', 'Miller Farm', 244, 'F'),
	('RI-200', 'CI', 'Rancho Inc', 400, 'C'),
	('VA-300', 'CI', 'Verde Acres', 300, 'F');
 
INSERT INTO Field (FarmID, FieldNum, Loc, NumHarv)
VALUES
	('F-8', 21, 'N1W1', 3),
	('AA4', 95, 'S4E3', 1),
	('Mill-1', 82, 'N2W1', 2),
	('AF-100', 19, 'N1W2', 1),
	('VA-300', 95, 'N2E4', 1),
	('AF-100', 63, 'N1W1', 1),
	('Mill-2', 88, 'N1E5', 1),
	('Mill-1', 19, 'N1W1', 1),
	('AA4', 63, 'S4E2', 1),
	('RI-200', 63, 'S2E2', 1),
	('F-8', 19, 'N1E4', 1),
	('AF-100', 88, 'N1W1', 1);
 
INSERT INTO Planting (FarmID, FieldNum, PlantDate, VarietyID)
VALUES
	('AA4', 95, '2019/06', 'P98C'),
	('F-8', 21, '2020/05', 'BS81'),
	('F-8', 21, '2020/06', 'BS81'),
	('Mill-1', 82, '2020/07', 'BC39'),
	('AF-100', 19, '2019/07', 'P81Y'),
	('VA-300', 95, '2019/06', 'BC39'),
	('Mill-1', 82, '2019/06', 'BC39'),
	('AF-100', 63, '2020/07', 'P98C'),
	('Mill-2', 88, '2019/06', 'BS81'),
	('AF-100', 63, '2020/04', 'P98C'),
	('Mill-1', 19, '2019/05', 'BS4N'),
	('AA4', 63, '2019/06', 'BS4N'),
	('RI-200', 63, '2020/06', 'BC28'),
	('F-8', 21, '2019/06', 'BS81'),
	('F-8', 19, '2019/04', 'P98C'),
	('AF-100', 88, '2019/07', 'BC39');

INSERT INTO Harvest (HarvestNum, FarmID, FieldNum, PlantDate, BushelsPerAcre, HarvestDate, Status, MemberID)
VALUES
	(20, 'AA4', 95, '2019/06', 175, '2019/09', 1, 'M0201'),
	(15, 'F-8', 21, '2020/05', 140, '2020/08', 1, NULL),
	(25, 'F-8', 21, '2020/06', 43, '2020/09', 1, NULL),
	(42, 'Mill-1', 82, '2020/07', 0, NULL, 0, NULL),
	(43, 'AF-100', 19, '2019/07', 44, '2019/10', 1, 'M0201'),
	(45, 'VA-300', 95, '2019/06', 190, '2019/10', 1, NULL),
	(46, 'Mill-1', 82, '2019/06', 204, '2019/09', 1, NULL),
	(54, 'AF-100', 63, '2020/07', 205.5, '2020/09', 1, 'M0201'),
	(57, 'Mill-2', 88, '2019/06', 54, '2019/09', 1, NULL),
	(66, 'AF-100', 63, '2020/04', 170, '2020/06', 1, 'M0201'),
	(77, 'Mill-1', 19, '2019/05', 48, '2019/08', 1, NULL),
	(80, 'AA4', 63, '2019/06', 46,, '2019/09', 1, 'M0201'),
	(98, 'RI-200', 63, '2020/06', 180, '2020/09', 1, NULL),
	(35, 'F-8', 21, '2019/06', 46, '2019/10', 1, NULL),
	(46, 'F-8', 19, '2019/04', 0, '2019/09', 0, NULL),
	(80, 'AF-100', 88, '2019/07', 170, '2019/10', 1, 'M0201');
 
INSERT INTO Owner VALUES
('M1024', 'F-8'),
('M1202', 'AA4'),
('M1203', 'Mill-1'),
('M1013', 'AF-100'),
('M1023', 'VA-300'),
('M1204', 'Mill-2'),
('M1012', 'RI-200'),
('M1201', 'VA-300');
