# PowerBuilder Employee Management System (EMS)

## 📌 Project Overview  
The **PowerBuilder Employee Management System (EMS)** is a desktop application designed to manage employee records efficiently. Built using **PowerBuilder 2022 R3**, it integrates with **AWS RDS** (Amazon Web Services Relational Database Service) for secure cloud storage and retrieval of employee data. The application implements **SQL queries** for data retrieval, validation, and management, offering a robust solution for employee record management.

### Key Highlights:
- Integrated with **AWS RDS** for cloud-based database management.
- Secure handling of data, with sensitive endpoint information protected through environment variables.
- Easy-to-use interface for managing employee data efficiently.

## 🛠️ Tech Stack  
- **Frontend:** PowerBuilder 2022 R3 *(I'm using their trial version for this project)*
- **Backend:** AWS RDS (formerly MS SQL Server for previous versions)  
- **Source Control:** Git  
- **Development Tools:** PowerBuilder IDE, SQL Server Management Studio (SSMS), AWS Management Console, GitHub  

## 🚀 Features  
   ✔️ **CRUD Operations:** Insert, Update, Delete, and View Employee Records  
   ✔️ **AWS RDS Integration:** Stores employee data securely in the cloud  
   ✔️ **Advanced SQL Queries:** Efficient data handling via **stored procedures** for inserting, updating, deleting, and retrieving employee records
   ✔️ **Data Integrity & Validation:** Ensures accurate and secure data input  
   ✔️ **Source Control Integration:** Managed with Git  
   ✔️ **Unit Testing & Documentation:** Ensuring quality, maintainability, and versioning  
   ✔️ **Production Support & Change Management:** Error logging, deployment monitoring, and version control  

## 🏗️ Installation & Setup  
### Prerequisites  
- PowerBuilder 2022 R3  
- AWS RDS (for cloud-based database) or MS SQL Server (for local setups)  
- Git

### Steps  
1. Clone the repository:  
   ```sh
   git clone https://github.com/AmeyPSawant/PowerBuilder-Based-Employee-Management-System-EMS.git
   cd PowerBuilder-Based-Employee-Management-System-EMS

2. Set up the AWS RDS Database for cloud-based storage:  
   - Create an **AWS RDS instance** via the AWS Management Console.  
   - Replace the database endpoint in the configuration files with your **AWS RDS endpoint** (ensure no sensitive data is exposed in public demos). Use **environment variables** for storing credentials securely.  
   - Run the required **SQL scripts** (located in [`/SQL_Scripts/`](https://github.com/AmeyPSawant/PowerBuilder-Based-Employee-Management-System-EMS/tree/main/SQL_Scripts)) to initialize the database.  
   - **SSMS (SQL Server Management Studio) was used** to connect to AWS RDS, perform initial database setup, execute queries, and verify data integrity.  
   - Perform CRUD operations using **stored procedures** to test functionality:  
     - `SP_InsertEmployee.sql` for inserting employees.  
     - `SP_UpdateEmployee.sql` for updating records.  
     - `SP_DeleteEmployee.sql` for removing employees.  
     - `SP_GetEmployeeById.sql` and `SP_GetEmployees.sql` for data retrieval.  

💡 **Note:** Ensure that your AWS RDS credentials (username, password, and endpoint) are securely stored and not exposed in public repositories.  

  
3. Install the required dependencies and libraries using PowerBuilder IDE.

4. If using a local database, ensure MS SQL Server or Sybase ASE is installed and configured correctly.

5. Open the project in PowerBuilder IDE, compile, and run the application.

## 🌐 AWS RDS Integration
This project utilizes AWS RDS to store employee data securely in the cloud.

## 📹 Demo
Watch the demo video to see how the PowerBuilder EMS app integrates with AWS RDS for employee management.
<img src="https://github.com/AmeyPSawant/PowerBuilder-Based-Employee-Management-System-EMS/blob/main/Media/Powerbuilder-EMS_demo.gif" width="600">

## 💡 Important Notes
- **Security:** Ensure that your AWS RDS connection credentials (username, password, endpoint) are kept secure and not exposed in public demos or repositories.
- **Data Privacy:** Avoid including sensitive data in any screenshots or demos, and use placeholder values if needed.
