package cn.returntmp.happyshare.dto;

import cn.returntmp.happyshare.entity.Product;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Created on 2022/6/21 9:38.
 *
 * @author ronger
 * @email ronger-x@outlook.com
 * @packageName cn.returntmp.happyshare.dto
 */
@Data
@EqualsAndHashCode(callSuper=false)
public class ProductDTO extends Product {
    /**
     * 文章内容
     */
    private String productContent;
    /**
     * 文章内容html
     */
    private String productContentHtml;
}
