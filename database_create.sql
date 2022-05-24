CREATE TABLE Faculty (
    Dean VARCHAR(50) NOT NULL,
    Location VARCHAR(50) NOT NULL,
    Faculty_Name VARCHAR(50) NOT NULL,
    University_Name VARCHAR(50) NOT NULL,
    PRIMARY KEY (Faculty_Name , University_Name)
);

CREATE TABLE Person (
    ID INT NOT NULL,
    First_Name VARCHAR(50) NOT NULL,
    Second_Name VARCHAR(50) NOT NULL,
    Date_Of_Birth DATE NOT NULL,
    Address VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Faculty_Name VARCHAR(50) NOT NULL,
    University_Name VARCHAR(50) NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (Faculty_Name , University_Name)
        REFERENCES Faculty (Faculty_Name , University_Name) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Student (
    GPA FLOAT NOT NULL,
    ID INT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (ID)
        REFERENCES Person (ID) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Department (
    Department_Head VARCHAR(50) NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Faculty_Name VARCHAR(50) NOT NULL,
    University_Name VARCHAR(50) NOT NULL,
    PRIMARY KEY (Name),
    FOREIGN KEY (Faculty_Name , University_Name)
        REFERENCES Faculty (Faculty_Name , University_Name) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Salaried_Employee (
    Salary FLOAT NOT NULL,
    ID INT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (ID)
        REFERENCES Person (ID) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Lecturer (
    Salary FLOAT NOT NULL,
    ID INT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (ID)
        REFERENCES Salaried_Employee (ID) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Worker (
    Salary FLOAT NOT NULL,
    ID INT NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (ID)
        REFERENCES Salaried_Employee (ID) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Course (
    Course_ID INT NOT NULL,
    Course_Name VARCHAR(50) NOT NULL,
    Credit_Hours INT NOT NULL,
    Student_Capacity INT NOT NULL,
    PreReq_Course INT,
    Department_Name VARCHAR(50) NOT NULL,
    Lecturer_ID INT NOT NULL,
    PRIMARY KEY (Course_ID),
    FOREIGN KEY (PreReq_Course)
        REFERENCES Course (Course_ID) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (Department_Name)
        REFERENCES Department (Name) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (Lecturer_ID)
        REFERENCES Lecturer (ID) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Studies (
    Student_ID INT NOT NULL,
    Course_ID INT NOT NULL,
    PRIMARY KEY (Student_ID , Course_ID),
    FOREIGN KEY (Student_ID)
        REFERENCES Student (ID) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (Course_ID)
        REFERENCES Course (Course_ID) ON DELETE RESTRICT ON UPDATE CASCADE
);