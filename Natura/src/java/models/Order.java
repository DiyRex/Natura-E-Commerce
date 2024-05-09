package models;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Devin
 */
public class Order {

    private int id;
    private int user_id;
    private String user_name;
    private String shipping_Address;
    private String payment;
    private int total_cost;
    private String order_status;
    private String order_date;
    private List<OrderItem> order_item;

    public Order(int id, int user_id, String shipping_Address, String payment, int total_cost, String order_status, String order_date) {
        this.id = id;
        this.user_id = user_id;
        this.shipping_Address = shipping_Address;
        this.payment = payment;
        this.total_cost =total_cost;
        this.order_status = order_status;
        this.order_date = order_date;
    }

    public Order(int user_id, String shipping_Address, String payment, int total_cost, String order_status) {
        this.user_id = user_id;
        this.shipping_Address = shipping_Address;
        this.payment = payment;
        this.total_cost =total_cost;
        this.order_status = order_status;
    }
    
    public Order(int id, int user_id, String shipping_Address, String payment, int total_cost, String order_status, String orderd_date, List<OrderItem> order_items) {
        this.id = id;
        this.user_id = user_id;
        this.shipping_Address = shipping_Address;
        this.payment = payment;
        this.total_cost =total_cost;
        this.order_status = order_status;
        this.order_date = orderd_date;
        this.order_item = order_items;
    }
    
    public Order(int id, String username, String shipping_Address, String payment, int total_cost, String order_status, String orderd_date, List<OrderItem> order_items) {
        this.id = id;
        this.user_name = username;
        this.shipping_Address = shipping_Address;
        this.payment = payment;
        this.total_cost =total_cost;
        this.order_status = order_status;
        this.order_date = orderd_date;
        this.order_item = order_items;
    }
    
    public Order(int id, int user_id, int total_cost, String order_status, String orderd_date) {
        this.id = id;
        this.user_id = user_id;
        this.total_cost =total_cost;
        this.order_status = order_status;
        this.order_date = orderd_date;
    }
    
    public void addOrderItem(OrderItem item) {
        this.order_item.add(item);
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
     * @return the order_status
     */
    public String getOrder_status() {
        return order_status;
    }

    /**
     * @param order_status the order_status to set
     */
    public void setOrder_status(String order_status) {
        this.order_status = order_status;
    }

    /**
     * @return the order_date
     */
    public String getOrderdate() {
        return order_date;
    }

    /**
     * @param Orderdate the order_date to set
     */
    public void setOrderdate(String Orderdate) {
        this.order_date = Orderdate;
    }

    /**
     * @return the payment
     */
    public String getPayment() {
        return payment;
    }

    /**
     * @param payment the payment to set
     */
    public void setPayment(String payment) {
        this.payment = payment;
    }

    /**
     * @return the total_cost
     */
    public int getTotal_cost() {
        return total_cost;
    }

    /**
     * @param total_cost the total_cost to set
     */
    public void setTotal_cost(int total_cost) {
        this.total_cost = total_cost;
    }

    /**
     * @return the shipping_Address
     */
    public String getShipping_Address() {
        return shipping_Address;
    }

    /**
     * @param shipping_Address the shipping_Address to set
     */
    public void setShipping_Address(String shipping_Address) {
        this.shipping_Address = shipping_Address;
    }

    /**
     * @return the order_item
     */
    public List<OrderItem> getOrder_item() {
        return order_item;
    }

    /**
     * @param order_item the order_item to set
     */
    public void setOrder_item(List<OrderItem> order_item) {
        this.order_item = order_item;
    }

    /**
     * @return the user_name
     */
    public String getUser_name() {
        return user_name;
    }

    /**
     * @param user_name the user_name to set
     */
    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

}
