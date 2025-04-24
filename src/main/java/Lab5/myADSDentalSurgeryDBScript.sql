# ============= Create Database Statements ==============================
Create DATABASE DSMS;
USE DSMS;


# ============= Create Table Statements ==================================

CREATE TABLE `appointments` (
  `appointmentId` int NOT NULL AUTO_INCREMENT,
  `appointmentDate` date DEFAULT NULL,
  `appointmentTime` time NOT NULL,
  `dentistId` int DEFAULT NULL,
  `patientId` int DEFAULT NULL,
  `surgeryId` Varchar(15) DEFAULT NULL,
  PRIMARY KEY (`appointmentId`),
  UNIQUE KEY `appointmentId_UNIQUE` (`appointmentId`),
  KEY `fk_appoinments_dentists_idx` (`dentistId`),
  KEY `fk_appointments_patientId_idx` (`patientId`),
  KEY `fk_appointment_surgery_idx` (`surgeryId`),
  CONSTRAINT `fk_appoinments_dentists` FOREIGN KEY (`dentistId`) REFERENCES `dentists` (`dentistId`) ON DELETE RESTRICT,
  CONSTRAINT `fk_appointment_surgery` FOREIGN KEY (`surgeryId`) REFERENCES `surgeries` (`surgeryId`) ON DELETE RESTRICT,
  CONSTRAINT `fk_appointments_patientId` FOREIGN KEY (`patientId`) REFERENCES `patients` (`patientId`) ON DELETE RESTRICT
);

CREATE TABLE `patients` (
  `patientId` int NOT NULL,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `phoneNumber` varchar(15) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `addressId` int DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`patientId`),
  UNIQUE KEY `patientId_UNIQUE` (`patientId`)
);

CREATE TABLE `dentists` (
  `dentistId` int NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `specialization` varchar(100) DEFAULT NULL,
  `userId` int NOT NULL,
  PRIMARY KEY (`dentistId`),
  UNIQUE KEY `dentist_id_UNIQUE` (`dentistId`)
);

CREATE TABLE `addresses` (
  `addressId` int NOT NULL,
  `street` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `zipCode` varchar(15) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`addressId`)
);

CREATE TABLE `surgeries` (
  `surgeryId` varchar(15) NOT NULL,
  `surgeryName` varchar(45) DEFAULT NULL,
  `addressId` int DEFAULT NULL,
  PRIMARY KEY (`surgeryId`)
);

CREATE TABLE `roles` (
  `roleId` int NOT NULL,
  `roleName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`roleId`)
);
CREATE TABLE `users` (
  `userId` int NOT NULL,
  `userName` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `roleId` int DEFAULT NULL,
  PRIMARY KEY (`userId`)
);

# ============= Create Relationships (add foreign keys ============================
ALTER TABLE `DSMS`.`appointments` 
ADD INDEX `fk_appoinments_dentists_idx` (`dentistId` ASC) VISIBLE,
ADD INDEX `fk_appointments_patientId_idx` (`patientId` ASC) VISIBLE,
ADD INDEX `fk_appointment_surgery_idx` (`surgeryId` ASC) VISIBLE;
;
ALTER TABLE `DSMS`.`appointments` 
ADD CONSTRAINT `fk_appoinments_dentists`
  FOREIGN KEY (`dentistId`)
  REFERENCES `DSMS`.`dentists` (`dentistId`)
  ON DELETE RESTRICT
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_appointments_patientId`
  FOREIGN KEY (`patientId`)
  REFERENCES `DSMS`.`patients` (`patientId`)
  ON DELETE RESTRICT
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_appointment_surgery`
  FOREIGN KEY (`surgeryId`)
  REFERENCES `DSMS`.`surgeries` (`surgeryId`)
  ON DELETE RESTRICT
  ON UPDATE NO ACTION;




ALTER TABLE `DSMS`.`dentists` 
ADD INDEX `fk_dentists_users_idx` (`userId` ASC) VISIBLE;
;
ALTER TABLE `DSMS`.`dentists` 
ADD CONSTRAINT `fk_dentists_users`
  FOREIGN KEY (`userId`)
  REFERENCES `DSMS`.`users` (`userId`)
  ON DELETE RESTRICT
  ON UPDATE NO ACTION;
  
  
ALTER TABLE `DSMS`.`patients` 
ADD INDEX `fk_patients_addresses_idx` (`addressId` ASC) VISIBLE,
ADD INDEX `fk_patients_users_idx` (`userId` ASC) VISIBLE;
;

ALTER TABLE `DSMS`.`patients` 
ADD CONSTRAINT `fk_patients_addresses`
  FOREIGN KEY (`addressId`)
  REFERENCES `DSMS`.`addresses` (`addressId`)
  ON DELETE RESTRICT
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_patients_users`
  FOREIGN KEY (`userId`)
  REFERENCES `DSMS`.`users` (`userId`)
  ON DELETE RESTRICT
  ON UPDATE NO ACTION;

  
ALTER TABLE `DSMS`.`surgeries` 
ADD INDEX `fk_surgeries_addresses_idx` (`addressId` ASC) VISIBLE;
;
ALTER TABLE `DSMS`.`surgeries` 
ADD CONSTRAINT `fk_surgeries_addresses`
  FOREIGN KEY (`addressId`)
  REFERENCES `DSMS`.`addresses` (`addressId`)
  ON DELETE RESTRICT
  ON UPDATE NO ACTION;

ALTER TABLE `DSMS`.`users` 
ADD INDEX `fk_users_roles_idx` (`roleId` ASC) VISIBLE;
;
ALTER TABLE `DSMS`.`users` 
ADD CONSTRAINT `fk_users_roles`
  FOREIGN KEY (`roleId`)
  REFERENCES `DSMS`.`roles` (`roleId`)
  ON DELETE RESTRICT
  ON UPDATE NO ACTION;

  
# INSERT SAMPLE DATA

# Insert Roles to roles tables 
INSERT INTO `DSMS`.`roles` (`roleId`, `roleName`) VALUES ('1', 'Staff');
INSERT INTO `DSMS`.`roles` (`roleId`, `roleName`) VALUES ('2', 'Dentist');
INSERT INTO `DSMS`.`roles` (`roleId`, `roleName`) VALUES ('3', 'Patient');
INSERT INTO `DSMS`.`roles` (`roleId`, `roleName`) VALUES ('4', 'Admin');


# Insert Users in users tables
INSERT INTO `DSMS`.`users` (`userId`, `userName`, `password`, `roleId`) VALUES ('1', 'Brian Adams', '12xxe2', '1');
INSERT INTO `DSMS`.`users` (`userId`, `userName`, `password`, `roleId`) VALUES ('2', 'Tony Smith', '1234', '2');
INSERT INTO `DSMS`.`users` (`userId`, `userName`, `password`, `roleId`) VALUES ('3', 'Helen Pearson', '1234', '2');
INSERT INTO `DSMS`.`users` (`userId`, `userName`, `password`, `roleId`) VALUES ('4', 'Robin Plevin', '1234', '2');
INSERT INTO `DSMS`.`users` (`userId`, `userName`, `password`, `roleId`) VALUES ('7', 'Admin Admin', 'admin', '4');
INSERT INTO `DSMS`.`users` (`userId`, `userName`, `password`, `roleId`) VALUES ('5', 'Gillian White', '1234', '3');
INSERT INTO `DSMS`.`users` (`userId`, `userName`, `password`, `roleId`) VALUES ('6', 'jill Bell', '1234', '3');
INSERT INTO `DSMS`.`users` (`userId`, `userName`, `password`, `roleId`) VALUES ('8', 'Ian Mackay', '123', '3');


# Insert Dentists
INSERT INTO `DSMS`.`dentists` (`dentistId`, `first_name`, `last_name`, `phone`, `email`, `specialization`, `userId`) VALUES ('1', 'Tony', 'Smith', '641-819-1351', 'tonny.smith@ads.com', 'orthodontics', '2');
INSERT INTO `DSMS`.`dentists` (`dentistId`, `first_name`, `last_name`, `phone`, `email`, `specialization`, `userId`) VALUES ('2', 'Helen', 'Pearson', '765-1234-6789', 'helen@ads.com', 'General', '3');
INSERT INTO `DSMS`.`dentists` (`dentistId`, `first_name`, `last_name`, `phone`, `email`, `specialization`, `userId`) VALUES ('3', 'Robin', 'Plevin', '123-1234-1234', 'robin@ads.com', 'General', '4');

# Insert Address
INSERT INTO addresses (addressId, street, city, state, zipCode) VALUES (1, '123 Main St', 'Plano', 'TX', '75023');
INSERT INTO addresses (addressId, street, city, state, zipCode) VALUES (2, '456 Oak Ave', 'Dallas', 'TX', '75201');

# Insert Patients
INSERT INTO `DSMS`.`patients` (`patientId`, `firstName`, `lastName`, `phoneNumber`, `email`, `addressId`, `dateOfBirth`, `userId`) VALUES (1, 'Gillian', 'White', '111-2222-3333', 'example1@example.com', 1, '1980-09-12', 5);
INSERT INTO `DSMS`.`patients` (`patientId`, `firstName`, `lastName`, `phoneNumber`, `email`, `addressId`, `dateOfBirth`, `userId`) VALUES (2, 'Jill', 'Bell', '222-3333-4444', 'example2@example.com', 2, '1970-09-12', 6);
INSERT INTO `DSMS`.`patients` (`patientId`, `firstName`, `lastName`, `phoneNumber`, `email`, `addressId`, `dateOfBirth`, `userId`) VALUES (3, 'Jhon', 'Walker', '111-2222-3333', 'example1@example.com', 1, '2010-05-19', 8);

# Insert Into Surgery
INSERT INTO `DSMS`.`surgeries` (`surgeryId`, `surgeryName`, `addressId`) VALUES ('S15', 'Tooth Extraction', '1');
INSERT INTO `DSMS`.`surgeries` (`surgeryId`, `surgeryName`, `addressId`) VALUES ('S13', 'Root Canal ', '2');
INSERT INTO `DSMS`.`surgeries` (`surgeryId`, `surgeryName`, `addressId`) VALUES ('S12', 'Gum Surgery', '1');
INSERT INTO `DSMS`.`surgeries` (`surgeryId`, `surgeryName`, `addressId`) VALUES ('S10', 'Bone Grafting', '2');

# Insert Inro Appointments
INSERT INTO `DSMS`.`appointments` (`appointmentDate`, `appointmentTime`, `dentistId`, `patientId`, `surgeryId`) VALUES ('2013-09-12', '10:00', '1', '1', 'S15');
INSERT INTO `DSMS`.`appointments` (`appointmentDate`, `appointmentTime`, `dentistId`, `patientId`, `surgeryId`) VALUES ('2013-09-12', '12:00', '1', '2', 'S15');
INSERT INTO `DSMS`.`appointments` (`appointmentDate`, `appointmentTime`, `dentistId`, `patientId`, `surgeryId`) VALUES ('2013-09-12', '10:00', '2', '3', 'S10');
INSERT INTO `DSMS`.`appointments` (`appointmentDate`, `appointmentTime`, `dentistId`, `patientId`, `surgeryId`) VALUES ('2013-09-14', '14:00', '2', '3', 'S10');
INSERT INTO `DSMS`.`appointments` (`appointmentDate`, `appointmentTime`, `dentistId`, `patientId`, `surgeryId`) VALUES ('2013-09-15', '16:30', '3', '2', 'S15');
INSERT INTO `DSMS`.`appointments` (`appointmentDate`, `appointmentTime`, `dentistId`, `patientId`, `surgeryId`) VALUES ('2013-09-15', '18:00', '3', '3', 'S13');




