package com.ymm.web;

import com.ymm.pojo.dto.MessageResult;
import com.ymm.pojo.dto.Page;
import com.ymm.pojo.po.Category;
import com.ymm.pojo.po.Goods;
import com.ymm.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/product")
public class ManagerProductAction {
    @Autowired
    private ProductService productService;

    /**
     * 商品类别查询
     *
     * @param page
     * @return
     */
    @RequestMapping("/categorylist")
    @ResponseBody
    public MessageResult<Category> listCategoryToJson(Page page) {
        MessageResult<Category> messageResult = new MessageResult<>();
        try {
            int count = productService.countCate();
            List<Category> categoryList = productService.listCategory(page);
            messageResult.setCode(0);
            messageResult.setCount(count);
            messageResult.setMsg("success");
            messageResult.setData(categoryList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return messageResult;
    }

    /**
     * 添加分类
     *
     * @return
     */
    @RequestMapping(value = "/category_add", method = RequestMethod.POST)
    @ResponseBody
    public int categoryAdd(Category category) {
        int i = 0;
        try {
            i = productService.cateAdd(category);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    /**
     * 分类修改
     *
     * @return
     */
    @RequestMapping("/category_edit")
    public String category_edit(int id, Model model) {
        Category category = null;
        try {
            category = productService.getCateById(id);
            model.addAttribute("category", category);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "forward:/pages/product/category_edit";
    }

    /**
     * 分类数据update
     */
    @RequestMapping("/category_editTo")
    @ResponseBody
    public int category_editTo(Category category) {
        int i = 0;
        try {
            i = productService.updateCate(category);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    /**
     * 根据id删除分类
     *
     * @param id
     * @return
     */
    @RequestMapping("/category_del")
    @ResponseBody
    public int categoryDelById(@RequestParam(value = "id") Integer id) {
        int i = 0;
        try {
            i = productService.cateDelById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return i;
    }

    /*商品查询*/
    @RequestMapping("/goodslist")
    @ResponseBody
    public MessageResult<Goods> goodslist(Page page) {
        MessageResult<Goods> messageResult = new MessageResult<>();
        try {

            List<Goods> goodsList = productService.listGoods(page);
            messageResult.setCode(0);
            messageResult.setCount(goodsList.size());
            messageResult.setMsg("success");
            messageResult.setData(goodsList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return messageResult;
    }

    /*商品添加*/
    @RequestMapping("goods_add")
    @ResponseBody
    public String goods_add() {
        return "true";
    }

    /*商品修改*/
    @RequestMapping("goods_edit")
    @ResponseBody
    public String goods_edit() {
        return "true";
    }

    /*商品删除(byId)*/
    @RequestMapping("goods_del")
    @ResponseBody
    public String goods_del() {
        return "true";
    }
}
