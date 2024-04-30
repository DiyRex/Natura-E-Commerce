package utility;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static Connection connection = null;

    private DBConnection() {} // Prevent instantiation

    public static Connection getConnection() throws SQLException {
        if (connection == null || connection.isClosed() || !connection.isValid(5)) {
            // Check if the connection is invalid or closed, then reconnect
            reconnect();
        }
        return connection;
    }

    private static void reconnect() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close(); // Safely close the previous connection if open
            }
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Re-create the connection
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/natura_db", "root", "");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(); // Handle exception: log or throw as appropriate
        }
    }
}

