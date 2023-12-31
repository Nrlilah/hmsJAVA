## Requirements:
### SQL Database
* src/main/webapp/sql dumps/Dump20231010
* DB Name: hmsdb 
* User: root@localhost
* Password: password
* Port: 3306

### Env
* JDK 17
* Server Apache Tomcat 8.5.93 (Port: 8080)
* src/main/java/com/hms/controller/DatabaseConnection.java (For connection setup)

### Executing program
* Run from src/main/webapp/jsp/Login.jsp


***


# Hospital Management System
The aim of the project is to build a hospital management system that efficiently manages various aspects of hospital operations, including:
* Patient records, appointments, medical history and predicament history.
* Doctor scheduling.
* User management.


## Objective
The objectives of this project are:
* To achieve efficient management of patient records, appointments, predicament and medical history.
* To Implement a streamlined registration process, medication prescription, predicament tracking and discharge process, enhancing efficacy and reducing manual process .
* To facilitate convenient and secure access to patient information for healthcare professionals, enabling well-informed decision-making and prompt delivery of care.


## Functionality
* Patient Registration
    * User administrators and nurses can register patients using the add button. A search feature allows a user to find any column names. A view function of more detail included to show full details of the patient.
* Patient Assignation
    * User doctors and nurses can view a patient list that has been registered in the system and change the patient status to be assigned to a specific doctor. A search feature allows a user to find any column names. A view function of more detail included to show full details of the patient.
* Patient Diagnosis
    * User doctors can add diagnosis under medication and predicament when they have a patient. Previous medication and predicament are stored under history. A delete button is used to delete the history of medication and predicament that was previously added.  A search feature allows a user to find any column names. A view function of more detail included to show full details of the patient.
* Scheduling
    * User doctors can view the schedule for the patient appointment in the queue list. A search feature allows a user to find any column names. A view function of more detail included to show full details of the patient.
* System Administration
    * Only user administrators are able to view this page to use the function to add users, add medication and add predicament. A search feature allows a user to find any column names in each table. A view function of more detail is included to show full details of the users. An edit button can be used to edit on predicament list names and medication list names.


## Contributors
* Arif Amiruddin   [@psakurai](https://www.linkedin.com/in/arif-a-a269b4142/)
* Nur Hafizatul Izzah [@izzaharsyd](http://www.linkedin.com/in/izzah-arsyad-6923b8123)
* Nurul Nabilah [@Nrlilah](https://www.linkedin.com/in/nurul-nabilah-salahudin-487a11229)
* Osman Sairi [@Twowisesana](https://www.linkedin.com/in/osman-sairi-682a42282/)
* Nur Aleina [@inazuma7](https://www.linkedin.com/in/nur-a-1a7a801a4/)
