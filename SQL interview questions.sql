CREATE DATABASE Hospital_database;
USE Hospital_database;

CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR(10),
    DateOfBirth DATE,
    PhoneNumber VARCHAR(15),
    Address VARCHAR(100)
);

CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Specialty VARCHAR(50),
    PhoneNumber VARCHAR(15),
    Department VARCHAR(50),
    Availability VARCHAR(50)
);

CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE,
    TimeSlot VARCHAR(10),
    Status VARCHAR(20),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

INSERT INTO Patients (PatientID, FirstName, LastName, Gender, DateOfBirth, PhoneNumber, Address)
VALUES
(1, 'John', 'Doe', 'Male', '1985-08-15', '555-123-4567', '123 Elm St, NY'),
(2, 'Jane', 'Smith', 'Female', '1992-05-10', '555-234-5678', '456 Oak St, SF'),
(3, 'Alice', 'Johnson', 'Female', '1980-12-22', '555-345-6789', '789 Pine St, CHI'),
(4, 'Bob', 'Brown', 'Male', '1975-03-30', '555-456-7890', '101 Maple St, NY'),
(5, 'Charlie', 'Davis', 'Male', '1998-11-14', '555-567-8901', '202 Cedar St, SF');


INSERT INTO Doctors (DoctorID, FirstName, LastName, Specialty, PhoneNumber, Department, Availability)
VALUES
(101, 'Emily', 'Taylor', 'Cardiologist', '555-678-9012', 'Cardiology', 'Mon-Fri, 9 AM-5 PM'),
(102, 'Michael', 'White', 'Neurologist', '555-789-0123', 'Neurology', 'Tue-Thu, 10 AM-4 PM'),
(103, 'Sarah', 'Green', 'Pediatrician', '555-890-1234', 'Pediatrics', 'Mon-Sat, 10 AM-6 PM'),
(104, 'James', 'Black', 'Orthopedic', '555-901-2345', 'Orthopedics', 'Wed-Fri, 11 AM-5 PM'),
(105, 'Laura', 'Wilson', 'Dermatologist', '555-012-3456', 'Dermatology', 'Mon-Fri, 8 AM-4 PM');

INSERT INTO Appointments (AppointmentID, PatientID, DoctorID, AppointmentDate, TimeSlot, Status)
VALUES
(201, 1, 101, '2024-01-02', '10:00 AM', 'Confirmed'),
(202, 2, 103, '2024-01-03', '11:30 AM', 'Cancelled'),
(203, 3, 104, '2024-01-05', '02:00 PM', 'Confirmed'),
(204, 4, 102, '2024-01-07', '01:00 PM', 'Rescheduled'),
(205, 5, 105, '2024-01-08', '09:00 AM', 'Confirmed');

-- Retrieve the full names and phone numbers of all patients.

select 
firstName, 
Lastname,
PhoneNumber
from patients;

-- List all appointments scheduled on or after January 1, 2024.

select AppointmentID,
PatientID,
DoctorID,
Status
from appointments
where AppointmentDate >= "2024-01-01";

-- Find all doctors specializing in "Cardiology."

select 
DoctorID,
FirstName,
LastName
from doctors
where Specialty = "Cardiologist";

-- Show the list of patients who live in "San Francisco."

select 
PatientID,
FirstName,
LastName
from patients
where Address = '202 Cedar St, SF';

-- Retrieve distinct specialties of doctors.

select distinct Specialty
from doctors;
-- List the full names of patients along with the names of their doctors for all confirmed appointments.

SELECT 
    pt.PatientID, pt.FirstName, dt.FirstName, ap.Status
FROM
    appointments ap
        JOIN
    doctors dt ON ap.DoctorID = dt.DoctorID
        JOIN
    patients pt ON ap.PatientID = pt.PatientID
WHERE
    ap.Status = 'Confirmed';

-- Calculate the total number of patients for each doctor.

SELECT 
    dt.FirstName AS DoctorName,
    COUNT(ap.PatientID) AS TotalPatients
FROM
    Doctors dt
        JOIN
    Appointments ap ON ap.DoctorID = dt.DoctorID
        JOIN
    Patients pt ON ap.PatientID = pt.PatientID
GROUP BY dt.FirstName;

-- For each department, count the number of doctors working in it.

select count(DoctorID) as total_doctors,
Department
from doctors
group by Department;

-- etrieve the name of the patient with the maximum number of confirmed appointments.

select pt.FirstName, count(ap.AppointmentID) as total_appointments
from appointments ap
join patients pt
on ap.PatientID = ap.PatientID
where Status = "Confirmed"
group by pt.FirstName;

-- Find the average age of patients for each gender.

SELECT 
    Gender,
    AVG(TIMESTAMPDIFF(YEAR, DateOfBirth, CURDATE())) AS AverageAge
FROM 
    Patients
GROUP BY 
    Gender;

