package Lab1B.edu.miu.cs.cs489appsd.lab1b.pensionmgmtapp.service;

import Lab1B.edu.miu.cs.cs489appsd.lab1b.pensionmgmtapp.model.Employee;


import java.util.List;

public interface EmployeeServices {
    void addNewEmployees(String firstName, String lastName, String employmentDate, String yearlySalary, String planReferenceNumber, String enrollmentDate, String monthlyContribution);

    void deleteEmployee(Long employeeId);

    void getEmployeeById(Long employeeId);

    List<Employee> getAllEmployees();

    List<Employee> getUpComingEnrolleesForNextQuarter();

}