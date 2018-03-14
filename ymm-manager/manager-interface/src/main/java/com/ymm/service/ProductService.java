package com.ymm.service;

import com.ymm.pojo.dto.Page;
import com.ymm.pojo.po.Category;
import com.ymm.pojo.po.Goods;

import java.util.List;

public interface ProductService {
    List<Category> listCategory(Page page);

    List<Goods> listGoods(Page page);

    int cateDelById(Integer id);

    int countCate();

    int cateAdd(Category category);

    Category getCateById(int id);
}
