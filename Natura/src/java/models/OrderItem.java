package models;

/**
 *
 * @author Devin
 */
public class OrderItem {

    private int id;
    private int order_id;
    private int product_id;
    private String product_name;
    private int qty;
    private int price;
    
    public OrderItem(int id, int order_id, int product_id, int qty, int price){
        this.id = id;
        this.order_id = order_id;
        this.product_id = product_id;
        this.qty = qty;
        this.price = price;
    }
    
    public OrderItem(int order_id, int product_id, int qty, int price){
        this.order_id = order_id;
        this.product_id = product_id;
        this.qty = qty;
        this.price = price;
    }
    
    public OrderItem(int order_id, String product_name, int qty, int price){
        this.order_id = order_id;
        this.product_name = product_name;
        this.qty = qty;
        this.price = price;
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
     * @return the order_id
     */
    public int getOrder_id() {
        return order_id;
    }

    /**
     * @param order_id the order_id to set
     */
    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    /**
     * @return the product_id
     */
    public int getProduct_id() {
        return product_id;
    }

    /**
     * @param product_id the product_id to set
     */
    public void setProduct_id(int product_id) {
        this.product_id = product_id;
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

    /**
     * @return the price
     */
    public int getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(int price) {
        this.price = price;
    }

    /**
     * @return the product_name
     */
    public String getProduct_name() {
        return product_name;
    }

    /**
     * @param product_name the product_name to set
     */
    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }
}
