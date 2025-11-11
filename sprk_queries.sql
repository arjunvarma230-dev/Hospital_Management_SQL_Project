use hospital;
show tables;
Create table patients(
	Patient_ID INT primary key auto_increment,
    Patient_Name Varchar(100),
    Patient_Age INT,
    Patient_Gender ENUM('Male', 'Female', 'Others')
);

Create table doctors(
	Doctor_ID INT primary key auto_increment,
    Doctor_Name VARCHAR(100),
    Specialization Varchar(100)
);

Create table appointments(
	Appointment_id INT Primary key auto_increment,
    Patient_ID INT,
    Doctor_ID INT,
    Appointment_date DATE,
    Diagnosis VARCHAR(255),
    Fees decimal(10,2),
    FOREIGN KEY(Patient_ID) references Patients(Patient_ID),
    FOREIGN KEY(Doctor_ID) references Doctors(Doctor_ID)
);

INSERT INTO Patients(Patient_Name,Patient_Age,Patient_Gender) VALUES
('John Doe',30,'Male'),
('Jane Smith',45,'Female'),
('Emily Davis',28,'Female');

select * From patients;

INSERT INTO Doctors(Doctor_Name,Specialization) VALUES
('Dr. Robert Willson','Cardiologist'),
('Dr. Lisa Brown','Dermatologist'),
('Dr. Mark Johnson','Neurologist');

select * from doctors;

use hospital;
show tables;
INSERT INTO Appointments(Patient_ID,Doctor_ID,Appointment_Date,Diagnosis,Fees) VALUES
(1,1,'2024-03-01','Hypertension',200.00),
(2,2,'2024-03-05','Skin Rash',150.00),
(1,3,'2024-03-10','Migrane',250.00),
(3,1,'2024-03-15','Chest Pain',300.00);

select * From appointments;
select * from doctors;
select * from patients;

SELECT 
    a.Appointment_Date,
    D.Doctor_Name,
    D.specialization,
    a.Diagnosis,
    a.fees
FROM
    appointments AS a
        JOIN
    doctors AS d ON a.doctor_ID = d.doctor_ID;
    
    
DELIMITER $$
CREATE procedure Get_Patient_Appointments1(p_patient_id INT)
BEGIN
SELECT 
    a.Appointment_Date,
    D.Doctor_Name,
    D.specialization,
    a.Diagnosis,
    a.fees
FROM
    appointments AS a
        JOIN
    doctors AS d ON a.doctor_ID = d.doctor_ID WHERE p_patient_id = a.patient_id;
    END $$
DELIMITER ;

drop procedure if exists Get_Patient_Appointments ;

call Get_Patient_Appointments1(2);

# Get_Patient_Appointments1 is our first Stored Procedure that gets the details of the patient

select * from patients;
select * From appointments;
select * from doctors;
SELECT 
    a.Doctor_ID, p.patient_name, a.appointment_date, a.diagnosis
FROM
    patients AS p
        JOIN
    appointments AS a ON p.patient_ID = a.patient_ID
        JOIN
    doctors AS d ON d.doctor_ID = a.doctor_ID;
    
DELIMITER $$
CREATE PROCEDURE Get_Doctor_Appointments(IN p_Doctor_ID INT)
BEGIN
SELECT 
    a.Doctor_ID,d.Doctor_Name, p.patient_name, a.appointment_date, a.diagnosis
FROM
    patients AS p
        JOIN
    appointments AS a ON p.patient_ID = a.patient_ID
        JOIN
    doctors AS d ON d.doctor_ID = a.doctor_ID WHERE a.doctor_ID = p_Doctor_ID;
END $$
DELIMITER ;

select * From appointments;
select * From patients;
select * from doctors;

CALL Get_Doctor_Appointments(1);

use hospital;
# Get_Doctor_Appointments is our second procedure which shows all doctor details just by taking doctor ID 


SELECT 
    a.appointment_date,d.doctor_name, p.patient_name, a.diagnosis
FROM
    patients AS p
        JOIN
    appointments AS a ON p.patient_id = a.patient_id
        JOIN
    doctors AS d ON d.doctor_id = a.doctor_id;
    
DELIMITER $$
create procedure get_appointments_in_range(IN Date1 DATE, IN Date2 DATE)
BEGIN

SELECT 
    a.appointment_date,d.doctor_name, p.patient_name, a.diagnosis
FROM
    patients AS p
        JOIN
    appointments AS a ON p.patient_id = a.patient_id
        JOIN
    doctors AS d ON d.doctor_id = a.doctor_id WHERE Appointment_date BETWEEN Date1 AND Date2;
END $$
DELIMITER ;


CALL get_appointments_in_range('2024-03-1','2024-03-30');

-- get_appointments_in_range is our third procedure which takes 2 dates as input and gives appointments between the two dates

select * from appointments;
select* from doctors;

SELECT 
    d.Doctor_Name, SUM(a.fees)
FROM
    Doctors AS d
        JOIN
    appointments AS a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_name;

DELIMITER $$
Create procedure get_total_earnings_by_doctor(IN Doc_ID INT)
BEGIN
SELECT 
    d.Doctor_Name, SUM(a.fees)
FROM
    Doctors AS d
        JOIN
    appointments AS a ON d.doctor_id = a.doctor_id WHERE d.doctor_id = Doc_ID
GROUP BY d.doctor_name;
END $$
DELIMITER ;

call get_total_earnings_by_doctor(1);

-- get_total_earnings_by_doctor is our fourth procedure which calculates the total earnings of a doctor by taking doctor id as input


select * from doctors;
select * from appointments;
select * from patients;

SELECT 
    d.doctor_name Doctor_Name, COUNT(a.Patient_ID) Total_Patients
FROM
    doctors d
        JOIN
    appointments a ON d.doctor_ID = a.doctor_ID
GROUP BY d.doctor_name
ORDER BY Total_Patients DESC;


DELIMITER $$
CREATE PROCEDURE get_most_visited_doctor()
BEGIN
SELECT 
    d.doctor_name Doctor_Name, COUNT(a.Patient_ID) Total_Patients
FROM
    doctors d
        JOIN
    appointments a ON d.doctor_ID = a.doctor_ID
GROUP BY d.doctor_name
ORDER BY Total_Patients DESC;
END $$
DELIMITER ;


call get_most_visited_doctor();

-- get_most_visited_doctor() is our fifth and last procedure which returns the doctors name that are the most visited ones
