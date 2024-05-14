create database surgery_department;
CREATE TABLE Patient (
    Pid serial primary key,
    pfname VARCHAR(255),
    Plname VARCHAR(255),
    Page INT,
    Paddress VARCHAR(255),
    Psex CHAR(1),
    Pphone VARCHAR(20),
    pmail VARCHAR(255),
    Ppassword VARCHAR(255)
);
CREATE TABLE Department (
    Did serial PRIMARY KEY,
    Dname VARCHAR(255),
    Dphone VARCHAR(20),
    Dmail VARCHAR(255)
);
CREATE TABLE Doctor (
    Did serial PRIMARY KEY,
    Dfname VARCHAR(255),
    Dlname VARCHAR(255),
    Dspeciality VARCHAR(255),
    Dsex CHAR(1),
    Dage INT,
    Dphone VARCHAR(20),
    Dmail VARCHAR(255),
    Dpassword VARCHAR(255),
    Dschedule VARCHAR(255),
    Dep_id INT ,
    foreign key (Dep_id) references  department(Did)
);

CREATE TABLE Staff (
    Sid serial PRIMARY KEY,
    Sfname VARCHAR(255),
    Slname VARCHAR(255),
    Sspeciality VARCHAR(255),
    Ssex CHAR(1),
    Smail VARCHAR(255),
    Spassword VARCHAR(255),
    Dep_id INT ,
    foreign key (Dep_id) references  department(Did)
);

CREATE TABLE Admin (
    id serial PRIMARY KEY,
    Afname VARCHAR(255),
    Alname VARCHAR(255),
    Apassword VARCHAR(255),
    Amail VARCHAR(255),
    Aphone VARCHAR(20),
    Dep_id INT ,
    foreign key (Dep_id) references  department(Did)
);

CREATE TABLE Operation_Room (
    OPRnumber INT PRIMARY KEY,
    OPRlocation VARCHAR(255),
    OPRstate VARCHAR(255)
);
CREATE TABLE Appointment (
    APid serial PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    APdate DATE,
    APreason VARCHAR(255),
    APnotes TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patient(Pid),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(Did)
);

CREATE TABLE Surgery (
    Sid serial PRIMARY KEY,
    patient_id INT,
    operation_room_num INT,
    Sdate DATE,
    Stype VARCHAR(255),
    Sexpected_duration TIME,
    Snotes TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patient(Pid),
    FOREIGN KEY (operation_room_num) REFERENCES Operation_Room(OPRnumber)
);

CREATE TABLE Medical_Records (
    MRid serial,
    patient_id INT,
    MRdate DATE,
    MRmedical_details TEXT,
    PRIMARY KEY (MRid, patient_id),
    FOREIGN KEY (patient_id) REFERENCES Patient(Pid)
);

CREATE TABLE Perform (
    surgery_id INT,
    doctor_id INT,
    staff_id INT,
    PRIMARY KEY (surgery_id, doctor_id, staff_id),
    FOREIGN KEY (surgery_id) REFERENCES Surgery(Sid),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(Did),
    FOREIGN KEY (staff_id) REFERENCES Staff(Sid)
);



