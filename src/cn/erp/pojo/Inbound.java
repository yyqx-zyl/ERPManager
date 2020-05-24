package cn.erp.pojo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor//无参构造
@AllArgsConstructor//带所有参数构造
public class Inbound {
	private int inId;
	private String productName;//商品名称
	private int typeId;//商品分类
	private String wareNum;//入库数量
	private String remarks;
	private Date wareDate;//入库时间
	private int createBy;//创建者
	private int modifyBy;//修改者
	private Date modifyTime;//修改时间

	private Type type;
}
