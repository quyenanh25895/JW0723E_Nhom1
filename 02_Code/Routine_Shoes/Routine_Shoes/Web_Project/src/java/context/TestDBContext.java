package context;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class TestDBContext {

    public static void main(String[] args) {
        DBContext dbContext = new DBContext();
        Connection connection = dbContext.getConnection();

        if (connection != null) {
            try {
                Statement statement = connection.createStatement();
                String query = "SELECT * FROM employees";
                ResultSet resultSet = statement.executeQuery(query);

                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name");
                    double salary = resultSet.getDouble("salary");

                    System.out.println("ID: " + id + ", Name: " + name + ", Salary: " + salary);
                }

         

            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("Không thể kết nối đến cơ sở dữ liệu.");
        }
    }
}