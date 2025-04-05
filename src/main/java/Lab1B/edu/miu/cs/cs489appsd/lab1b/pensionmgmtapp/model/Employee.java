package Lab1B.edu.miu.cs.cs489appsd.lab1b.pensionmgmtapp.model;

import java.time.LocalDate;

public class Employee {
    private final long employeeId;
    private final String firstName;
    private final String lastName;
    private final LocalDate employmentDate;
    private final double yearlySalary;
    private PensionPlan pensionPlan; // Assigned dynamically in PensionManagementApp

    public Employee(long employeeId, String firstName, String lastName,
                    LocalDate employmentDate, double yearlySalary) {
        this.employeeId = employeeId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.employmentDate = employmentDate;
        this.yearlySalary = yearlySalary;
    }

    // Getters
    public long getEmployeeId() { return employeeId; }
    public String getFirstName() { return firstName; }
    public String getLastName() { return lastName; }
    public LocalDate getEmploymentDate() { return employmentDate; }
    public double getYearlySalary() { return yearlySalary; }
    public PensionPlan getPensionPlan() { return pensionPlan; }

    // Used by system logic to assign pension plan dynamically
    public void assignPensionPlan(PensionPlan pensionPlan) {
        this.pensionPlan = pensionPlan;
    }

    @Override
    public String toString() {
        return firstName + " " + lastName + " (ID: " + employeeId + ")";
    }
}