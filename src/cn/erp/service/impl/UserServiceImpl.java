package cn.erp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.erp.dao.UserDao;
import cn.erp.pojo.User;
import cn.erp.service.UserService;
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Override
    public User loginValider(String userName, String password) {
        // TODO Auto-generated method stub
        return userDao.loginValider(userName, password);
    }
    @Override
    public List<User> getUserList() {
        // TODO Auto-generated method stub
        return userDao.getAll();
    }
	@Override
	public boolean addUser(User user) {
		int result=userDao.addUser(user);
		if(result>0) {
			return true;
		}else {
			return false;
		}
		
	}
	@Override
	public boolean updateUser(User user) {
		int result=userDao.updateUser(user);
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}
	@Override
	public boolean deleteUser(int uid) {
		int result=userDao.deleteUser(uid);
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}
	@Override
	public User findById(int uid) {
		// TODO Auto-generated method stub
		return userDao.findById(uid);
	}
	@Override
	public boolean updatePassword(User user) {
		int result=userDao.updatePassword(user);
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}
    
    

}
