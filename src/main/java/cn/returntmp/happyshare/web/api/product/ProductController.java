package cn.returntmp.happyshare.web.api.product;

import cn.returntmp.happyshare.core.result.GlobalResult;
import cn.returntmp.happyshare.core.result.GlobalResultGenerator;
import cn.returntmp.happyshare.core.service.security.annotation.AuthorshipInterceptor;
import cn.returntmp.happyshare.core.service.security.annotation.SecurityInterceptor;
import cn.returntmp.happyshare.dto.ProductDTO;
import cn.returntmp.happyshare.entity.Product;
import cn.returntmp.happyshare.entity.Product;
import cn.returntmp.happyshare.entity.User;
import cn.returntmp.happyshare.enumerate.Module;
import cn.returntmp.happyshare.service.ProductService;
import cn.returntmp.happyshare.util.UserUtils;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * Created on 2022/6/21 9:30.
 *
 * @author ronger
 * @email ronger-x@outlook.com
 * @packageName cn.returntmp.happyshare.web.api.product
 */
@RestController
@RequestMapping("/api/v1/product")
public class ProductController {

    @Resource
    private ProductService productService;

    @GetMapping("/detail/{idProduct}")
    public GlobalResult<ProductDTO> detail(@PathVariable Long idProduct, @RequestParam(defaultValue = "2") Integer type) {
        ProductDTO dto = productService.findProductDTOById(idProduct, type);
        return GlobalResultGenerator.genSuccessResult(dto);
    }

    @PostMapping("/post")
    @RequiresRoles(value = {"blog_admin", "admin"}, logical = Logical.OR)
    public GlobalResult<Product> add(@RequestBody ProductDTO product) {
        Product newProduct = productService.postProduct(product);
        return GlobalResultGenerator.genSuccessResult(newProduct);
    }

    @PutMapping("/post")
    @RequiresRoles(value = {"blog_admin", "admin"}, logical = Logical.OR)
    public GlobalResult<Product> update(@RequestBody ProductDTO product) {
        if (product.getIdProduct() == null || product.getIdProduct() == 0) {
            throw new IllegalArgumentException("产品主键参数异常!");
        }
        Product oldProduct = productService.postProduct(product);
        return GlobalResultGenerator.genSuccessResult(oldProduct);
    }


    @PatchMapping("/update-status")
    @RequiresRoles(value = {"blog_admin", "admin"}, logical = Logical.OR)
    public GlobalResult<Boolean> updateStatus(@RequestBody Product product) {
        boolean flag = productService.updateStatus(product.getIdProduct(), product.getStatus());
        return GlobalResultGenerator.genSuccessResult(flag);
    }

}
