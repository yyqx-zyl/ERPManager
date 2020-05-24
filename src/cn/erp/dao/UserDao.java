package cn.erp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import cn.erp.pojo.Inbound;
import cn.erp.pojo.User;

/**
 * 操作数据库表的接口
 * @author lindy
 * @创建时间 2020年5月12日上午10:37:01
 */
@Repository
public interface UserDao {
    // 登录验证 username,password
    // 参数值固定，我们就可以使用@Param注解来实现传参
    User loginValider(@Param("username") String userName,
        @Param("userpassword") String password);
    
    List<User> getAll();
    
  //修改密码
  		@Update("update erp_user set userpassword=#{userpassword}"
  				+ "where uid=#{uid}")
  		int updatePassword(User user);
    
  //显示所有
  	List<User> getUserList();
  	
  	
  	//增加
  	@Insert("INSERT INTO erp_user (uname,userName,userpassword,gender,birthday,phone,place,email,Introg,userrole,createBy,createTime)" +
  			"values(#{uname},#{userName},#{userpassword},#{gender},#{birthday},#{phone},"
  			+ "#{place},#{email},#{Introg},#{userrole},#{createBy},#{createTime})")
  	int addUser(User user);
  	
  	//修改
  	@Update("update erp_user set uname=#{uname},userName=#{userName},userpassword=#{userpassword},gender=#{gender},"
  			+ "birthday=#{birthday},phone=#{phone},place=#{place},email=#{email},Introg=#{Introg},"
  			+ "userrole=#{userrole},createBy=#{createBy},createTime=#{createTime}")
  	int updateUser(User user);
  	
  	//删除
  	@Delete("delete from erp_user where uid=#{uid}")
  	int deleteUser(@Param("uid") int uid);
  	
  	//根据id查询
  	@Select("select * from erp_user where uid=#{uid}")
  	User findById(@Param("uid") int uid);
  	
    
    
    
    
    
    
}
