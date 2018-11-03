package com.company.Model;

public class Reorder {

    private String orderNumber;
    private Product product;
    private String orderDate;
    private Store store;

    public Reorder(String orderNumber, Product product, String orderDate, Store store) {
        this.orderNumber = orderNumber;
        this.product = product;
        this.orderDate = orderDate;
        this.store = store;
    }

    public void fulfillReorder(Store store, Product item, int number) {

    }

    public boolean isReorderFulfilled() {
        return false;
    }

    public String getOrderNumber() {
        return null;
    }

    public Product getProduct() {
        return product;
    }

    public Store getStore() {
        return store;
    }

    public String getOrderDate() {
        return orderDate;
    }
}
