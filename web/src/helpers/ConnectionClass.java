package helpers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionClass {

    static Connection connection;

    static  {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            throw new IllegalArgumentException(e);
        }
        try {
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/my_database",
                    "postgres", "nazevo0098");
        } catch (SQLException e) {
            throw new IllegalArgumentException();
        }
    }

    public static Connection getConnection() {
        return connection;
    }
}
