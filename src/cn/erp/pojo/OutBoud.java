package cn.erp.pojo;

import java.util.Date;

import lombok.Data;
/**
 * 预警实体类
 * @author lindy
 * @创建时间 2020年5月22日上午9:12:13
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
