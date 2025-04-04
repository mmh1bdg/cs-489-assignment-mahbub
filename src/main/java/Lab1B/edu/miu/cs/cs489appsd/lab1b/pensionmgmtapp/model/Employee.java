package Lab1B.edu.miu.cs.cs489appsd.lab1b.pensionmgmtapp.model;

import java.math.BigDecimal;
import java.time.LocalDate;

public class Employee {
    private long employeeId;
    private String firstName;
    private String lastName;
    private LocalDate employmentDate;
    private BigDecimal yearlySalary;
    private PensionPlan pensionPlan;

    public Employee(long employeeId, String firstName, String lastName, LocalDate employmentDate, BigDecimal yearlySalary) {
        this.employeeId = employeeId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.employmentDate = employmentDate;
        this.yearlySalary = yearlySalary;
    }

    public long getEmployeeId() { return employeeId; }
    public String getFirstName() { return firstName; }
    public String getLastName() { return lastName; }
    public LocalDate getEmploymentDate() { return employmentDate; }
    public BigDecimal getYearlySalary() { return yearlySalary; }
    public PensionPlan getPensionPlan() { return pensionPlan; }
    public void setPensionPlan(PensionPlan pensionPlan) { this.pensionPlan = pensionPlan; }

    @Override
    public String toString() {
        return firstName + " " + lastName + " (ID: " + employeeId + ")";
    }
}
