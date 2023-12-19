CREATE TABLE Member
( 
	MemberID             char(5)  NOT NULL ,
	Name                 char(30)  NULL ,
	ContactMethod        char(16)  NULL ,
	StartDate            date  NULL ,
	EndDate              date  NULL ,
	PRIMARY KEY  CLUSTERED (MemberID ASC)
)
go

CREATE TABLE ProjectManager
( 
	MemberID             char(5)  NOT NULL ,
	ProjectReview        datetime  NULL ,
	PRIMARY KEY  CLUSTERED (MemberID ASC),
	 FOREIGN KEY (MemberID) REFERENCES Member(MemberID)
)
go

CREATE TABLE Manager
( 
	MemberID             char(5)  NOT NULL ,
	LastAccess           datetime  NULL ,
	PRIMARY KEY  CLUSTERED (MemberID ASC),
	 FOREIGN KEY (MemberID) REFERENCES Member(MemberID)
)
go

CREATE TABLE Region
( 
	RegionID             char(2)  NOT NULL ,
	Name                 char(30)  NULL ,
	MemberID             char(5)  NULL ,
	PRIMARY KEY  CLUSTERED (RegionID ASC),
	 FOREIGN KEY (MemberID) REFERENCES Manager(MemberID)
)
go

CREATE TABLE Classification
( 
	ClassificationID     char(1)  NOT NULL ,
	Name                 char(30)  NULL ,
	PRIMARY KEY  CLUSTERED (ClassificationID ASC)
)
go

CREATE TABLE Farm
( 
	FarmID               char(6)  NOT NULL ,
	RegionID             char(2)  NULL ,
	FarmName             char(30)  NULL ,
	Size                 integer  NULL ,
	ClassificationID     char(1)  NULL ,
	PRIMARY KEY  CLUSTERED (FarmID ASC),
	 FOREIGN KEY (RegionID) REFERENCES Region(RegionID),
	 FOREIGN KEY (ClassificationID) REFERENCES Classification(ClassificationID)
)
go

CREATE TABLE Owner
( 
	MemberID             char(5)  NOT NULL ,
	FarmID               char(6)  NULL ,
	PRIMARY KEY  CLUSTERED (MemberID ASC),
	 FOREIGN KEY (FarmID) REFERENCES Farm(FarmID),
	 FOREIGN KEY (MemberID) REFERENCES Member(MemberID)
)
go

CREATE TABLE Status
( 
	Status               int  NOT NULL ,
	Code                 char(6)  NULL ,
	PRIMARY KEY  CLUSTERED (Status ASC)
)
go

CREATE TABLE Field
( 
	FarmID               char(6)  NOT NULL ,
	FieldNum             integer  NOT NULL ,
	Loc                  char(5)  NULL ,
	NumHarv              int  NULL ,
	PRIMARY KEY  CLUSTERED (FarmID ASC,FieldNum ASC),
	 FOREIGN KEY (FarmID) REFERENCES Farm(FarmID)
)
go

CREATE TABLE Variety
( 
	VarietyID            char(5)  NOT NULL ,
	Description          char(50)  NULL ,
	AverageYield         decimal(4,1)  NULL ,
	PRIMARY KEY  CLUSTERED (VarietyID ASC)
)
go

CREATE TABLE Planting
( 
	FarmID               char(6)  NOT NULL ,
	FieldNum             integer  NOT NULL ,
	PlantDate            char(8)  NOT NULL ,
	VarietyID            char(5)  NULL ,
	PRIMARY KEY  CLUSTERED (FarmID ASC,FieldNum ASC,PlantDate ASC),
	 FOREIGN KEY (FarmID,FieldNum) REFERENCES Field(FarmID,FieldNum),
	 FOREIGN KEY (VarietyID) REFERENCES Variety(VarietyID)
)
go

CREATE TABLE Hrarvester
( 
	MemberID             char(5)  NOT NULL ,
	ClassificationID     char(1)  NULL ,
	PRIMARY KEY  CLUSTERED (MemberID ASC),
	 FOREIGN KEY (ClassificationID) REFERENCES Classification(ClassificationID),
	 FOREIGN KEY (MemberID) REFERENCES Member(MemberID)
)
go

CREATE TABLE Harvest
( 
	HarvestNum           integer  NOT NULL ,
	FarmID               char(6)  NOT NULL ,
	FieldNum             integer  NOT NULL ,
	PlantDate            char(8)  NOT NULL ,
	BushelsPerAcre       decimal(4,1)  NULL ,
	HarvestDate          char(8)  NULL ,
	Status               int  NULL ,
	MemberID             char(5)  NULL ,
	PRIMARY KEY  CLUSTERED (HarvestNum ASC,FarmID ASC,FieldNum ASC,PlantDate ASC),
	 FOREIGN KEY (Status) REFERENCES Status(Status),
	 FOREIGN KEY (FarmID,FieldNum,PlantDate) REFERENCES Planting(FarmID,FieldNum,PlantDate),
	 FOREIGN KEY (MemberID) REFERENCES Hrarvester(MemberID)
)
go
