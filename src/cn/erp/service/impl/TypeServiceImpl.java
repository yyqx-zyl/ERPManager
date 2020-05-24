package cn.erp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.erp.dao.TypeDao;
import cn.erp.pojo.Type;
import cn.erp.service.TypeService;
@Service
public class TypeServiceImpl implements TypeService {
    @Autowired
    private TypeDao typeDao;
    @Override
    public List<Type> getTypeList() {
        // TODO Auto-generated method stub
        return typeDao.getTypeList();
    }

    @Override
    public boolean addType(Type type) {
        int result = typeDao.addType(type);
        if (result > 0) {
            return true;
        }else {
            return false;
        }
    }

    @Override
    public boolean updateType(Type type) {
        int result = typeDao.updateType(type);
        if (result > 0) {
            return true;
        }else {
            return false;
        }
    }

    @Override
    public Type findById(int id) {
        // TODO Auto-generated method stub
        return typeDao.findById(id);
    }

    @Override
    public boolean deleteType(int id) {
        int result = typeDao.deleteType(id);
        if (result > 0) {
            return true;
        }else {
            return false;
        }
    }

}
