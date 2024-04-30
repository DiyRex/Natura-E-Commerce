package adminController.models;

/**
 *
 * @author Devin
 */
public class User {
    private int id;
    private String name;
    private String apt_no;
    private String street;
    private String city;
    private String zip_code;
    private String email;
    
    public User(int id, String name, String apt_no, String street, String city, String zip_code, String email)
    {
       this.id = id;
       this.name = name;
       this.apt_no = apt_no;
       this.street = street;
       this.city = city;
       this.zip_code = zip_code;
       this.email = email;
    }
    
    public User(String name, String apt_no, String street, String city, String zip_code, String email)
    {
       this.name = name;
       this.apt_no = apt_no;
       this.street = street;
       this.city = city;
       this.zip_code = zip_code;
       this.email = email;
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the apt_no
     */
    public String getApt_no() {
        return apt_no;
    }

    /**
     * @param apt_no the apt_no to set
     */
    public void setApt_no(String apt_no) {
        this.apt_no = apt_no;
    }

    /**
     * @return the street
     */
    public String getStreet() {
        return street;
    }

    /**
     * @param street the street to set
     */
    public void setStreet(String street) {
        this.street = street;
    }

    /**
     * @return the city
     */
    public String getCity() {
        return city;
    }

    /**
     * @param city the city to set
     */
    public void setCity(String city) {
        this.city = city;
    }

    /**
     * @return the zip_code
     */
    public String getZip_code() {
        return zip_code;
    }

    /**
     * @param zip_code the zip_code to set
     */
    public void setZip_code(String zip_code) {
        this.zip_code = zip_code;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }
    
}
