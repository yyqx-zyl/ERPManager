package cn.erp.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.alibaba.fastjson.annotation.JSONField;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor//无参构造
@AllArgsConstructor//带所有参数构造
public class User {
	private int uid;
	private String uname;
	private String userName;
	private String userpassword;
	private int gender;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JSONField(format = "yyyy-MM-dd")//json格式日期的注解
	private Date birthday;
	private String phone;
	private String place;//籍贯
	private String email;
	private String Introg;//备注
	private int  userrole;//用户角色
	private int createBy;
	private Date createTime;
	private int modifyBy;
	private Date modifyTime;
	private int age;
	public int getAge() {
		age=new Date().getYear()-birthday.getYear();
		return age;
	}
}
