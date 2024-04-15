CREATE DATABASE QuanLySinhVien;

CREATE TABLE Class(

         ClassID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,

          ClassName VARCHAR(60) NOT NULL,

          StartDate DATETIME NOT NULL,

          Status BIT

);

CREATE TABLE Student(

          StudentId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,

          StudentName VARCHAR(30) NOT NULL,

          Address VARCHAR(50),

          Phone VARCHAR(20),

          Status BIT,

          ClassId INT NOT NULL,

          FOREIGN KEY (ClassId) REFERENCES Class (ClassID)

);

CREATE TABLE Subject(

         SubId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,

         SubName VARCHAR(30) NOT NULL,

         Credit TINYINT NOT NULL DEFAULT 1 CHECK ( Credit >= 1 ),

         Status BIT DEFAULT 1

);

CREATE TABLE Mark(

        MarkId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,

        SubId INT NOT NULL,

        StudentId INT NOT NULL,

        Mark FLOAT DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),

        ExamTimes TINYINT DEFAULT 1,

        UNIQUE (SubId, StudentId),

        FOREIGN KEY (SubId) REFERENCES Subject (SubId),

        FOREIGN KEY (StudentId) REFERENCES Student (StudentId)

 );
 
INSERT INTO Class
VALUES (1, 'A1', '2004-01-31', 1);
INSERT INTO Class
VALUES (2, 'A2', '2004-10-22', 0);
INSERT INTO Class
VALUES (3, 'A3', current_date, 0);

INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Cuong', 'PhuYen', '0342116479', 0, 2);
INSERT INTO Student (StudentName, Address, Status, ClassId)
VALUES ('Thanh', 'Daklak', 1, 1);

INSERT INTO Subject
VALUES (1, 'AA', 5, 0),
 (2, 'BB', 6, 1),
 (3, 'C', 5, 1),
 (4, 'D', 10, 1);
 
INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES (1, 2, 7,1);
SELECT *
FROM Subject
WHERE Credit = (
    SELECT MAX(Credit)
    FROM Subject
);
SELECT subject.SubId, subject.SubName, subject.Credit, mark.Mark
FROM Subject 
INNER JOIN Mark ON subject.SubId = mark.SubId
WHERE Mark = (
    SELECT MAX(Mark)
    FROM Mark
);
SELECT student.StudentId, student.StudentName, AVG(mark.Mark) AS 'Điểm trung bình'
FROM Student 
INNER JOIN Mark ON student.StudentId = mark.StudentId
GROUP BY student.StudentId, student.StudentName
ORDER BY AVG(mark.Mark) DESC;