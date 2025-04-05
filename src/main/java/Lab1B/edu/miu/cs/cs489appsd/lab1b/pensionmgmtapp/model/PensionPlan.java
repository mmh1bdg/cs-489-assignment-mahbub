package Lab1B.edu.miu.cs.cs489appsd.lab1b.pensionmgmtapp.model;

//import java.math.BigDecimal;
import java.time.LocalDate;

public class PensionPlan {
    private String planReferenceNumber;
    private LocalDate enrollmentDate;
    private double monthlyContribution;

    public PensionPlan(String planReferenceNumber, LocalDate enrollmentDate, double monthlyContribution) {
        this.planReferenceNumber = planReferenceNumber;
        this.enrollmentDate = enrollmentDate;
        this.monthlyContribution = monthlyContribution;
    }

    public String getPlanReferenceNumber() {
        return planReferenceNumber;
    }

    public LocalDate getEnrollmentDate() {
        return enrollmentDate;
    }

    public double getMonthlyContribution() {
        return monthlyContribution;
    }

    @Override
    public String toString() {
        return "Plan #" + planReferenceNumber + " (Enrolled: " + enrollmentDate + ", Contribution: $" + monthlyContribution + ")";
    }
}