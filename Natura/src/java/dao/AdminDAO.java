package dao;

import models.Admin;

/**
 *
 * @author Devin
 */
public interface AdminDAO {
    Admin loginAdmin(String email, String password) throws Exception;
}
