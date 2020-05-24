package cn.erp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.erp.dao.WarningDao;
import cn.erp.pojo.Warning;
import cn.erp.service.WarningServices;
@Service
public class WarningServiceImpl implements WarningServices {
    @Autowired
    private WarningDao warningDao;
    @Override
    public List<Warning> getWarnList() {
        // TODO Auto-generated method stub
        return warningDao.getWarnList();
    }

    @Override
    public boolean addWarn(Warning warn) {
        int result = warningDao.addWarn(warn);
        if (result > 0) {
            return true;
        }else {
            return false;
        }
    }

    @Override
    public boolean updateWarn(Warning warn) {
        int result = warningDao.updateWarn(warn);
        if (result > 0) {
            return true;
        }else {
            return false;
        }
    }

    @Override
    public boolean delWarn(int wid) {
        int result = warningDao.delWarn(wid);
        if (result > 0) {
            return true;
        }else {
            return false;
        }
    }

    @Override
    public Warning findById(int wid) {
        // TODO Auto-generated method stub
        return warningDao.findById(wid);
    }

}
