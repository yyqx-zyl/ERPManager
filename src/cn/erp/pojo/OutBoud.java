package cn.erp.pojo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
/**
 * 出库
 * @author Zylyyqx
 * 2020年5月24日
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class OutBoud {
    private int oid;
    private int sid;
    private int typeId;
    private int outNum;
    private String remarks;//备注
    private int createBy;
    private Date createTime;
    private int modifyBy;
    private Date modifyTime;
    // 涉及到多表查询
    private Type type;
    private Stock stock;
}
