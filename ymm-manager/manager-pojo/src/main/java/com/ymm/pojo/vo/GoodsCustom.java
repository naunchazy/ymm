package com.ymm.pojo.vo;

import com.ymm.pojo.po.Brand;
import com.ymm.pojo.po.Category;
import com.ymm.pojo.po.Goods;

import java.io.Serializable;

public class GoodsCustom extends Goods implements Serializable {
    private Category category;
    private Brand brand;

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }
}
