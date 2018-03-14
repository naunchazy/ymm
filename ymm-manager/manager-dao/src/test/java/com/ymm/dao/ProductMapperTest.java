package com.ymm.dao;

import com.ymm.pojo.dto.Page;
import com.ymm.pojo.po.Category;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration({"classpath:spring/spring-dao.xml"})
//public class ProductMapperTest {
//
//    @Autowired
//    private ProductMapper productDao;
//    //@org.junit.Test
//    //public void selectAllCategory() throws Exception {
//    //    List<Category> categoryList = productDao.selectAllCategory();
//    //    System.out.println(categoryList.size());
//    //}
//    @Test
//    public void selectAllGoods() throws Exception {
//        Page page = new Page();
//        page.setLimit(5);
//        page.setPage(1);
//        List<Goods> goodsList = productDao.selectAllGoods(page);
//
//        for (Goods goods: goodsList) {
//            System.out.println(goods.getCategory().getCat_name());
//        }
//    }
//
//}