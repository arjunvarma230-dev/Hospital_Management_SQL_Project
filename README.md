# 🏥 Hospital Management System (SQL Project)

This project demonstrates a complete **Hospital Management Database System** built using **MySQL**.  
It was created to manage patients, doctors, and appointments efficiently — and includes advanced SQL features like joins, stored procedures, and aggregate queries.

---

## 📘 Project Overview

The database system covers:
- **Patient Information:** Stores patient details such as ID, name, and contact info.
- **Doctor Information:** Stores doctor details, including specialization and fees.
- **Appointments:** Records appointment dates, diagnoses, and doctor–patient mappings.

---

## ⚙️ Stored Procedures

### 1. `Get_Patient_Appointments1(p_patient_id)`
Returns all appointments for a specific patient with:
- Appointment Date  
- Doctor Name  
- Specialization  
- Diagnosis  
- Fees  

### 2. `Get_Doctor_Appointments(p_doctor_id)`
Displays all patients who visited a specific doctor along with:
- Patient Name  
- Appointment Date  
- Diagnosis  

### 3. `get_appointments_in_range(start_date, end_date)`
Fetches all appointments that occurred between two given dates.

### 4. `get_total_earnings_by_doctor(Doc_ID)`
Calculates the total earnings for a specific doctor using the SUM() function.

### 5. `get_most_visited_doctor() `
Returns the doctors name that are the most visited ones with the data:
- Doctor Name
- Total Patients

---

##  SQL Concepts Used
- Table Creation and Relationships  
- **INNER JOINs**  
- **Stored Procedures (with IN parameters)**  
- **GROUP BY** and **HAVING** clauses  
- **Aggregate Functions (SUM, COUNT)**  
- **DELIMITER usage**

---

## 🗂️ Files Included
- `hospital_management.sql` → contains all SQL code (tables, sample data, and procedures)
- `README.md` → project documentation

---

## 🎓 Created By
**Arjun Varma**  
As part of a Data Analytics / SQL learning project submission.

---

## 🧩 Tools Used
- MySQL Workbench
- GitHub (for project version control and sharing)

---
