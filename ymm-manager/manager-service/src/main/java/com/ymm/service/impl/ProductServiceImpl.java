package com.ymm.service.impl;

import com.ymm.dao.ProductMapper;
import com.ymm.pojo.dto.Page;
import com.ymm.pojo.po.Category;
import com.ymm.pojo.po.Goods;
import com.ymm.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ProductServiceImpl implements ProductService{
    @Autowired
    private ProductMapper productDao;

    @Override
    public List<Category> listCategory(Page page) {
        return productDao.selectAllCategory(page);
    }

    @Override
    public List<Goods> listGoods(Page page) {
        return productDao.selectAllGoods(page);
    }

    @Override
    public int cateDelById(Integer id) {
        return productDao.updateCateStatusById(id);
    }

    @Override
    public int countCate() {
        return productDao.countCate();
    }

    @Override
    public int cateAdd(Category category) {
        return productDao.insertCate(category);
    }

    @Override
    public Category getCateById(int id) {
        return productDao.selectCateById(id);
    }
}
