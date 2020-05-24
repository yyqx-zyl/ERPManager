package cn.erp.service;
/**
 * 用户操作业务接口
 * @author lindy
 * @创建时间 2020年5月12日上午10:43:25
 */

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import cn.erp.pojo.User;

public interface UserService {
    User loginValider(String userName,String password);
    
    List<User> getUserList();
    
    boolean updatePassword(User user);
  //增加
    boolean addUser(User user);
  	
  	//修改
  	boolean updateUser(User user);
  	
  	boolean deleteUser(int uid);
  	
  	//根据id查询
  	User findById(int uid);
  	
    
    
}
