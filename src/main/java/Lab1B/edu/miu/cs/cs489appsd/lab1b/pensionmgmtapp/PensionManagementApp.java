package Lab1B.edu.miu.cs.cs489appsd.lab1b.pensionmgmtapp;

import Lab1B.edu.miu.cs.cs489appsd.lab1b.pensionmgmtapp.model.Employee;
import Lab1B.edu.miu.cs.cs489appsd.lab1b.pensionmgmtapp.model.PensionPlan;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import java.time.LocalDate;
import java.time.Month;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

public class PensionManagementApp {
    public static void main(String[] args) throws Exception {
        List<Employee> employees = loadSampleEmployees();

        System.out.println("\nAll Employees (with Pension Info), Sorted:");
        printAllEmployeesSortedAsJson(employees);

        System.out.println("\nQuarterly Upcoming Enrollees Report:");
        printUpcomingEnrollees(employees);
    }

    private static List<Employee> loadSampleEmployees() {
        List<Employee> list = new ArrayList<>();

        Employee e1 = new Employee(1, "Daniel", "Agar", LocalDate.of(2018, 1, 17), 105945.50);
        Employee e2 = new Employee(2, "Bernard", "Shaw", LocalDate.of(2022, 9, 3), 197750.00);
        Employee e3 = new Employee(3, "Carly", "Agar", LocalDate.of(2014, 5, 16), 842000.75);
        Employee e4 = new Employee(4, "Wesley", "Schneider", LocalDate.of(2021, 7, 21), 74500.00);
        Employee e5 = new Employee(5, "Anna", "Wiltord", LocalDate.of(2021, 6, 15), 85750.00);
        Employee e6 = new Employee(6, "Yosef", "Tesfalem", LocalDate.of(2021, 10, 31), 100000.00);

        // Assign pension plan manually if it already exists
        e1.assignPensionPlan(new PensionPlan("EX1089", LocalDate.of(2023, 1, 17), 100.00));
        e3.assignPensionPlan(new PensionPlan("SM2307", LocalDate.of(2019, 11, 16), 1555.50));

        list.add(e1);
        list.add(e2);
        list.add(e3);
        list.add(e4);
        list.add(e5);
        list.add(e6);

        return list;
    }

    private static void printAllEmployeesSortedAsJson(List<Employee> employees) throws Exception {
        List<Employee> sortedList = employees.stream()
                .sorted(Comparator.comparing(Employee::getYearlySalary).reversed()
                        .thenComparing(Employee::getLastName))
                .collect(Collectors.toList());

        ObjectMapper mapper = new ObjectMapper();
        mapper.registerModule(new JavaTimeModule());
        mapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS);
        mapper.enable(SerializationFeature.INDENT_OUTPUT);

        System.out.println(mapper.writeValueAsString(sortedList));
    }

    private static void printUpcomingEnrollees(List<Employee> employees) throws Exception {
        LocalDate today = LocalDate.now();
        int currentQuarter = (today.getMonthValue() - 1) / 3 + 1;
        int nextQuarter = (currentQuarter % 4) + 1;
        int year = (nextQuarter == 1) ? today.getYear() + 1 : today.getYear();

        Month startMonth = Month.of((nextQuarter - 1) * 3 + 1);
        LocalDate quarterStart = LocalDate.of(year, startMonth, 1);
        LocalDate quarterEnd = quarterStart.plusMonths(3).minusDays(1);

        List<Employee> upcomingEnrollees = employees.stream()
                .filter(e -> e.getPensionPlan() == null)
                .filter(e -> {
                    LocalDate threeYearDate = e.getEmploymentDate().plusYears(3);
                    return (!threeYearDate.isBefore(quarterStart)) && (!threeYearDate.isAfter(quarterEnd));
                })
                .sorted(Comparator.comparing(Employee::getEmploymentDate).reversed())
                .collect(Collectors.toList());

        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.registerModule(new JavaTimeModule());
        objectMapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS);
        objectMapper.enable(SerializationFeature.INDENT_OUTPUT);

        System.out.println(objectMapper.writeValueAsString(upcomingEnrollees));
    }
}
