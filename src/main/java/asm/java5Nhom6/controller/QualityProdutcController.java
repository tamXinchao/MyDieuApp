package asm.java5Nhom6.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import asm.java5Nhom6.dao.ColorDAO;
import asm.java5Nhom6.dao.ProductDAO;
import asm.java5Nhom6.dao.Product_Size_ColorDAO;
import asm.java5Nhom6.dao.SizeDAO;
import asm.java5Nhom6.entity.Color;
import asm.java5Nhom6.entity.Product;
import asm.java5Nhom6.entity.Product_Size_Color;
import asm.java5Nhom6.entity.Size;

@Controller
public class QualityProdutcController {
    @Autowired
    Product_Size_ColorDAO pscDao;
    @Autowired
    ProductDAO productDao;
    @Autowired
    SizeDAO sizeDao;
    @Autowired
    ColorDAO colorDao;

    @RequestMapping("/admin/product-quality/{productId}")
    public String quality(Model model, @PathVariable("productId") Integer productId) {
        Optional<Product> productOptional = productDao.findById(productId);



        Product product = productOptional.get();
        model.addAttribute("product", product);
        List<Product_Size_Color> pscList = pscDao.findByProductId(productId);
        model.addAttribute("pscList", pscList);

        List<Color> colors = colorDao.findAll();
        model.addAttribute("colors", colors);
        List<Size> sizes = sizeDao.findAll();
        model.addAttribute("sizes", sizes);

        model.addAttribute("view", "quality-product.jsp");
        return "admin/layout";
    }

    @PostMapping("/admin/product-quality/{productId}")
    public String updateQuality(Model model, @RequestParam("quantity") List<Integer> quantities,
                                @RequestParam("price") List<Double> prices, @RequestParam("colorIds") List<Integer> colorIds,
                                @RequestParam("sizeIds") List<Integer> sizeIds, @PathVariable("productId") Integer productId) {

        Optional<Product> productOptional = productDao.findById(productId);
        if (!productOptional.isPresent()) {
            return "redirect:/admin/products"; // or redirect to an error page
        }

        Product product = productOptional.get();

        for (int i = 0; i < colorIds.size(); i++) {
            Integer colorId = colorIds.get(i);
            Integer sizeId = sizeIds.get(i);
            int quantity = quantities.get(i);
            double price = prices.get(i);

            Optional<Product_Size_Color> pscOptional = pscDao.findByProduct_ProductIdAndColor_ColorIdAndSize_SizeId(productId, colorId, sizeId);
            Product_Size_Color psc = pscOptional.orElse(new Product_Size_Color());

            psc.setProduct(product);
            psc.setColor(colorDao.findById(colorId).orElseThrow(() -> new RuntimeException("Color not found")));
            psc.setSize(sizeDao.findById(sizeId).orElseThrow(() -> new RuntimeException("Size not found")));
            psc.setQuality(quantity);
            psc.setPrice(price);
            psc.setStatus(true);
            pscDao.save(psc);
        }

        return "redirect:/admin/tableEditProduct";
    }
}
