package com.unicom.bean;

import java.math.BigDecimal;

/**
 * @author heibai
 * @date 2020/11/13 19:36
 */
public class Product {
    private Integer id;
    private String title;
    private String productlink;
    private BigDecimal price;
    private Integer deal;
    private String image;
    private String shop;
    private String location;

    public Product() {
    }

    public Product(Integer id, String title, String productlink, BigDecimal price, Integer deal, String image, String shop, String location) {
        this.id = id;
        this.title = title;
        this.productlink = productlink;
        this.price = price;
        this.deal = deal;
        this.image = image;
        this.shop = shop;
        this.location = location;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }


    public String getProductlink() {
        return productlink;
    }

    public void setProductlink(String productlink) {
        this.productlink = productlink;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getDeal() {
        return deal;
    }

    public void setDeal(Integer deal) {
        this.deal = deal;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getShop() {
        return shop;
    }

    public void setShop(String shop) {
        this.shop = shop;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", productlink='" + productlink + '\'' +
                ", price=" + price +
                ", deal=" + deal +
                ", image='" + image + '\'' +
                ", shop='" + shop + '\'' +
                ", location='" + location + '\'' +
                '}';
    }
}
