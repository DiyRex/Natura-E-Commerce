package adminController.dao;
import adminController.models.User;
import java.util.List;

/**
 *
 * @author Devin
 */
public interface UserDAO {
    void addUser(User user) throws Exception;
    User getUser(int id) throws Exception;
    List<User> getAllUsers() throws Exception;
    void updateUser(User user) throws Exception;
    void deleteUser(int id) throws Exception;
}
