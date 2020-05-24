package cn.erp.pojo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Stock {
    private Integer sid;   
    private String productName;   
    private Integer typeId;   
    private Integer productNum;   
    private String remarks;   
    private Integer createBy;   
    private Date createTime;   
    private Integer modifyBy;   
    private Date modifyTime;
    //private String typeName;// 分类的名称
    private Type type; // 分类实体
}
