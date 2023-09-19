CREATE TABLE Doctors (
    DoctorID int,
    FirstName varchar(50),
    MiddleName varchar(50),
    LastName varchar(50),
    Gender varchar(10),
    CONSTRAINT PK_Doctors PRIMARY KEY (DoctorID)
);

CREATE TABLE Contacts (
    DoctorID int NOT NULL,
    PhoneNumber varchar(25) NOT NULL,
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),
    CONSTRAINT chk_phonenumber_format CHECK (PhoneNumber REGEXP '^[(][0-9]{3}[)][-][0-9]{3}[-][0-9]{4}$')
);

CREATE TABLE Services (
    DoctorID int NOT NULL,
    Teleconsultation varchar(1) NOT NULL DEFAULT "N",
    IndividualMedicare varchar(1) NOT NULL,
    GroupMedicare varchar(1) NOT NULL,
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

CREATE TABLE Schools (
    SchoolID int AUTO_INCREMENT,
    SchoolName varchar(255),
    CONSTRAINT PK_Schools PRIMARY KEY (SchoolID)
);

CREATE TABLE Education (
    DoctorID int NOT NULL,
    SchoolID int NOT NULL,
    Credential varchar(5),
    GraduationYear YEAR NOT NULL,
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),
    FOREIGN KEY (SchoolID) REFERENCES Schools(SchoolID)
);

CREATE TABLE Specialties (
    SpecialtyID int NOT NULL AUTO_INCREMENT,
    SpecialtyName varchar(255) NOT NULL,
    CONSTRAINT PK_Specialties PRIMARY KEY (SpecialtyID)
) AUTO_INCREMENT = 100;

CREATE TABLE DoctorSpecialties (
    DoctorID int NOT NULL,
    SpecialtyID int,
    IsPrimary boolean,
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),
    FOREIGN KEY (SpecialtyID) REFERENCES Specialties(SpecialtyID)
);

CREATE TABLE Addresses (
    AddressID varchar(50),
    AdressLine1 varchar(255) NOT NULL,
    AdressLine2 varchar(255),
    City varchar(255) NOT NULL,
    State varchar(255) NOT NULL,
    Zip varchar(15) NOT NULL,
    CONSTRAINT PK_Adresses PRIMARY KEY (AddressID),
    CONSTRAINT chk_zip_format CHECK (zip_code REGEXP '^[0-9]{5}[-][0-9]{4}$')
);

ALTER TABLE Addresses MODIFY Zip varchar(15);

CREATE TABLE DoctorClinics (
    DoctorID int NOT NULL,
    AddressID varchar(50) NOT NULL,
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),
    FOREIGN KEY (AddressID) REFERENCES Addresses(AddressID)
);

CREATE TABLE Organizations (
    OrganizationID varchar(50),
    OrganizationName varchar(255) NOT NULL,
    AddressID varchar(50) NOT NULL,
    Members int,
    CONSTRAINT PK_Organizations PRIMARY KEY (OrganizationID),
    FOREIGN KEY (AddressID) REFERENCES Addresses(AddressID)
);

CREATE TABLE DoctorOrganizations (
    DoctorID int,
    OrganizationID varchar(50) NOT NULL,
    isHospital boolean DEFAULT FALSE,
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),
    FOREIGN KEY (OrganizationID) REFERENCES Organizations(OrganizationID)
);

CREATE TABLE Patients (
    PatientID int NOT NULL AUTO_INCREMENT,
    FirstName varchar(50) NOT NULL,
    LastName varchar(50) NOT NULL,
    Gender varchar(10) NOT NULL,
    Email varchar(50) NOT NULL,
    CONSTRAINT PK_Patients PRIMARY KEY (PatientID),
    CONSTRAINT chk_email_format CHECK(Email REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$')
) AUTO_INCREMENT = 100;

CREATE TABLE Appointments (
    AppointmentID int NOT NULL AUTO_INCREMENT,
	PatientID int NOT NULL,
	DoctorID int NOT NULL,
    AppointmentDate DATE NOT NULL,
    ApppointmentTime TIME NOT NULL,
    CONSTRAINT PK_Appointments PRIMARY KEY (AppointmentID),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
) AUTO_INCREMENT = 1000;

INSERT INTO DoctorSpecialties VALUES 
SELECT NPI, (SELECT SpecialtyID FROM Specialties WHERE SpecialtyName = Specialty), IsPrimary FROM Specialty
