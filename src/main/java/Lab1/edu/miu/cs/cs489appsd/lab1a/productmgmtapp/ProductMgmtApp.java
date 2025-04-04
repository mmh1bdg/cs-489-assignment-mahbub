package Lab1.edu.miu.cs.cs489appsd.lab1a.productmgmtapp;

import Lab1.edu.miu.cs.cs489appsd.lab1a.productmgmtapp.model.Product;

import java.io.FileWriter;
import java.io.IOException;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.opencsv.CSVWriter;

public class ProductMgmtApp {
    public static void main(String[] args) {
        List<Product> products = Arrays.asList(
                new Product(3128874119L, "Banana", LocalDate.of(2023, 1, 24), 124, 0.55),
                new Product(2927458265L, "Apple", LocalDate.of(2022, 12, 9), 18, 1.09),
                new Product(9189927460L, "Carrot", LocalDate.of(2023, 3, 31), 89, 2.99)
        );

       printProducts(products);


    }

    public static void printProducts(List<Product> products){
        if(products==null || products.isEmpty()){
            System.out.println("No products to print");
        }
        else {
            //ascending order
            //products.sort((p1, p2) -> Double.compare(p1.getUnitPrice(), p2.getUnitPrice()));

            //descending order
            products.sort((p1, p2) -> Double.compare(p2.getUnitPrice(), p1.getUnitPrice()));

            try {
                //generateJSON(products);
                //generateXML(products);
                generateCSV(products);
            } catch (IOException e) {
                e.printStackTrace();
            }

        }

    }

    private static void generateJSON(List<Product> products) throws IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.registerModule(new JavaTimeModule()); // Register JavaTimeModule
        objectMapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS); // Proper date formatting

        String jsonOutput = objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(products);
        System.out.println("\n Printed in JSON Format:\n" + jsonOutput);

        objectMapper.writeValue(new FileWriter("products.json"), products);
    }

    private static void generateXML(List<Product> products) throws IOException {
        XmlMapper xmlMapper = new XmlMapper();
        xmlMapper.registerModule(new JavaTimeModule()); // Register JavaTimeModule for XML
        xmlMapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS);

        String xmlOutput = xmlMapper.writerWithDefaultPrettyPrinter().writeValueAsString(products);
        System.out.println("\n Printed in XML Format:\n" + xmlOutput);

        xmlMapper.writeValue(new FileWriter("products.xml"), products);
    }

    private static void generateCSV(List<Product> products) throws IOException {
        try (CSVWriter writer = new CSVWriter(new FileWriter("products.csv"))) {
            // Writing CSV header
            writer.writeNext(new String[]{"Product ID", "Name", "Date Supplied", "Quantity", "Unit Price"});

            // Writing data rows
            for (Product product : products) {
                writer.writeNext(new String[]{
                        String.valueOf(product.getProductId()),
                        product.getName(),
                        product.getDateSupplied().toString(),
                        String.valueOf(product.getQuantityInStock()),
                        String.valueOf(product.getUnitPrice())
                });
            }
        }

    }
}
