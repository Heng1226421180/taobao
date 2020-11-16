package com.unicom.bean;

import java.math.BigDecimal;

/**
 * @author heibai
 * @date 2020/11/13 19:36
 */
public class Product {
    private Integer id;
    private String title;
    private String itemhref;
    private BigDecimal price;
    private Integer deal;
    private String image;
    private String shop;
    private String shophref;
    private String location;
    private String icons;
    private String itemkeys;
    private String grade;

    public Product() {
    }

    public Product(Integer id, String title, String itemhref, BigDecimal price, Integer deal, String image, String shop, String shophref, String location, String icons, String itemkeys, String grade) {
        this.id = id;
        this.title = title;
        this.itemhref = itemhref;
        this.price = price;
        this.deal = deal;
        this.image = image;
        this.shop = shop;
        this.shophref = shophref;
        this.location = location;
        this.icons = icons;
        this.itemkeys = itemkeys;
        this.grade = grade;
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

    public String getItemhref() {
        return itemhref;
    }

    public void setItemhref(String itemhref) {
        this.itemhref = itemhref;
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

    public String getShophref() {
        return shophref;
    }

    public void setShophref(String shophref) {
        this.shophref = shophref;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getIcons() {
        return icons;
    }

    public void setIcons(String icons) {
        this.icons = icons;
    }

    public String getItemkeys() {
        return itemkeys;
    }

    public void setItemkeys(String itemkeys) {
        this.itemkeys = itemkeys;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", itemhref='" + itemhref + '\'' +
                ", price=" + price +
                ", deal=" + deal +
                ", image='" + image + '\'' +
                ", shop='" + shop + '\'' +
                ", shophref='" + shophref + '\'' +
                ", location='" + location + '\'' +
                ", icons='" + icons + '\'' +
                ", itemkeys='" + itemkeys + '\'' +
                ", grade='" + grade + '\'' +
                '}';
    }
}
