package cn.erp.pojo;

import java.util.Date;

import lombok.Data;
/**
 * 出库
 * @author Zylyyqx
 * 2020年5月24日
 */
@Data
public class OutBoud {
    private int oid;
    private int sid;
    private int typeId;
    private int outNum;
    private String remark;//备注
    private int createBy;
    private Date createTime;
    private int modifyBy;
    private Date modifyTime;
    // 涉及到多表查询
    private Type type;
    private Stock stock;
}
