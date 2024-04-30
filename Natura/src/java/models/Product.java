package models;

/**
 *
 * @author Devin
 */
public class Product {
   private int id;
    private String title;
    private String description;
    private double price;
    private int qty; 
    
    public Product(String title, String description, double price, int quantity) {
        this.title = title;
        this.description = description;
        this.price = price;
        this.qty = quantity;
    }

    public Product(int id, String title, String description, double price, int quantity) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.price = price;
        this.qty = quantity;
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
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * @return the price
     */
    public double getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(double price) {
        this.price = price;
    }

    /**
     * @return the qty
     */
    public int getQty() {
        return qty;
    }

    /**
     * @param qty the qty to set
     */
    public void setQty(int qty) {
        this.qty = qty;
    }
}
