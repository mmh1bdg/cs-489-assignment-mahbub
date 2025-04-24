
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

