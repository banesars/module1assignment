package module4;

import java.sql.*;
import java.util.Scanner;

public class Module4 {

    public static void main(String[] args) throws ClassNotFoundException, SQL Exception  {
           
        try {
            //Step 1 - create a connection to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/classicmodels","root", "admin");
            
            //step 2 - create a new SQL statement using the connection
            Statement stmt = con.createStatement();
            
            //step 3 - execute the SQL statement to retrieve a result set of records from the database
            ResultSet rs = stmt.executeQuery("SELECT * FROM products WHERE productLine = 'Classic Cars';");
            
            //step 4 - iterate through the resultset using a while loop to print each of the product name
            while(rs.next()) {
                System.out.println(rs.getString(1) + " ");
           } //end while loop
         
            //input scanner
           Scanner scanner = new Scanner(System.in);
            
          //ask user to choose a product line to view inventory
          System.out.println("Please select a product line to view our inventory!");
          System.out.println("Selection: Classic Cars [1], Ships [2], or Motorcycles [3]");
            
            String userInput = scanner.next();
            
           String sql = "";
          
             switch(userInput) {
                case "1": sql = "SELECT * FROM Products WHERE ProductLine = 'Classic Cars'";
                break;
                case "2": sql = "SELECT * FROM Products WHERE ProductLine = 'Ships'";
                break;
                case "3": sql = "SELECT * FROM Products WHERE ProductLine = 'Motorcycles'";
                break;
                default: System.out.println("You did not enter a valid choice for the product line.");
                    break;
            }
            
             rs = stmt.executeQuery(sql);
            
             while(rs.next()) {
                System.out.println(rs.getString("productName") + " " + rs.getString("productLine")); 
           } //end switch
            
 stmt.executeUpdate("INSERT INTO Products (productCode, productName, productLine, productScale, productVendor, productDescription, quantityInStock, buyPrice, MSRP)\n" +
                    "VALUES ('S72_3213', 'USS Monitor', 'Ships', '1:72', 'Second Gear Diecast', 'Ironclad warship with her steam engine and revolving turret', 780, 35.00, 55.00)");
            
            rs = stmt.executeQuery("SELECT * FROM products WHERE productName = 'USS Monitor'");

            while(rs.next()) {
                System.out.println(rs.getString(1) + " , " + rs.getString(2) + " , " + rs.getString(3) + " , " + rs.getString(4) + " , " + rs.getString(5) + " , " + rs.getString(6) + " , " + rs.getInt(7) + " , " + rs.getDouble(8) + " ," + rs.getDouble(9));
            }
           
            stmt.executeUpdate("UPDATE products SET productScale = '1:10pm' WHERE productName = 'USS Monitor'");
            
            rs = stmt.executeQuery("SELECT * FROM products WHERE productName = 'USS Monitor'");
            
            while (rs.next()) {
                System.out.println("Product scale updated and set to " + rs.getString(4) + " for product: " + rs.getString(2));
                }
            
            stmt.executeUpdate("DELETE FROM products WHERE productName = 'USS Monitor' ");
            
            rs = stmt.executeQuery("SELECT * FROM products WHERE productLine = 'Ships'");
            
            while(rs.next()) {
                System.out.println(rs.getString(1) + " , " + rs.getString(2) + " , " + rs.getString(3) );
            }
            
            //close scanner 
            scanner.close();
            
            //close connection 
            con.close();
            
            }catch (Exception e) {
                System.out.println(e);
            }//end try catch
    }//end main
    
}//end class
