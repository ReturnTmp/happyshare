package cn.returntmp.happyshare.service;

import cn.returntmp.happyshare.core.service.Service;
import cn.returntmp.happyshare.dto.ProductDTO;
import cn.returntmp.happyshare.entity.Product;

import java.util.List;

/**
 * Created on 2022/6/21 9:25.
 *
 * @author ronger
 * @email ronger-x@outlook.com
 * @packageName cn.returntmp.happyshare.service
 */
public interface ProductService extends Service<Product> {
    /**
     * 查询产品列表
     * @return 产品列表
     */
    List<ProductDTO> findProducts();

    /**
     * 获取产品详情
     *
     * @param idProduct 产品主键
     * @param type 数据类型
     * @return 产品详情
     */
    ProductDTO findProductDTOById(Long idProduct, Integer type);

    /**
     * 获取在线商品
     * @return 产品列表
     */
    List<ProductDTO> findOnlineProducts();

    /**
     * @param product 产品信息
     * @return 产品信息
     */
    Product postProduct(ProductDTO product);

    /**
     * @param idProduct 产品主键
     * @param status 状态
     * @return 更新成功状态
     */
    boolean updateStatus(Long idProduct, Integer status);
}
