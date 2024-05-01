package utility;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static Connection connection = null;

    static {
        try {
            // Register JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        if (connection == null || connection.isClosed() || !connection.isValid(5)) {
            reconnect();
        }
        return connection;
    }

    private static void reconnect() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
            // Re-create the connection
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/natura_db", "root", "");
        } catch (SQLException e) {
            e.printStackTrace();  // Handle exception: log or throw as appropriate
        }
    }

    public static void deregisterDriver() {
        try {
            DriverManager.deregisterDriver(DriverManager.getDriver("jdbc:mysql://localhost:3306/natura_db"));
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

