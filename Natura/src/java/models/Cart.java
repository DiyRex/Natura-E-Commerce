package models;

/**
 *
 * @author Devin
 */
public class Cart {
    
    private int id;
    private int user_id;
    private int cart_id;
    private int product_id;
    private String product;
    private int price;
    private int qty;
    
    public Cart( int user_id, int cart_id, int product_id, String product, int price, int qty){
        this.user_id = user_id;
        this.cart_id = cart_id;
        this.product_id = product_id;
        this. product = product;
        this.price = price;
        this.qty = qty;
    }
    
    public Cart(int id, int user_id, int cart_id, int product_id, String product, int price, int qty){
        this.id = id;
        this.user_id = user_id;
        this.cart_id = cart_id;
        this.product_id = product_id;
        this. product = product;
        this.price = price;
        this.qty = qty;
    }
    
    /**
     * @return the user_id
     */
    public int getId() {
        return id;
    }

    /**
     * @param user_id the user_id to set
     */
    public void setId(int id) {
        this.id = id;
    }
    
    /**
     * @return the user_id
     */
    public int getUser_id() {
        return user_id;
    }

    /**
     * @param user_id the user_id to set
     */
    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    /**
     * @return the cart_id
     */
    public int getCart_id() {
        return cart_id;
    }

    /**
     * @param cart_id the cart_id to set
     */
    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
    }

    /**
     * @return the product
     */
    public String getProduct() {
        return product;
    }

    /**
     * @param product the product to set
     */
    public void setProduct(String product) {
        this.product = product;
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
}
