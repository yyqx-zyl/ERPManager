package cn.erp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.erp.dao.OutBoudDao;
import cn.erp.dao.WarningDao;
import cn.erp.pojo.OutBoud;
import cn.erp.pojo.Warning;
import cn.erp.service.OutBoudService;
@Service
public class OutBoudServiceImpl implements OutBoudService {
    @Autowired
    private OutBoudDao outBoudDao;

	@Override
	public List<OutBoud> getOutBoudList() {
		// TODO Auto-generated method stub
		return outBoudDao.getOutBoudList();
	}

	@Override
	public boolean addOutBoud(OutBoud outBoud) {
		   int result = outBoudDao.addOutBoud(outBoud);
	        if (result > 0) {
	            return true;
	        }else {
	            return false;
	        }
	}

	@Override
	public boolean updateOutBoud(OutBoud outBoud) {
		  int result = outBoudDao.updateOutBoud(outBoud);
	        if (result > 0) {
	            return true;
	        }else {
	            return false;
	        }
	}

	@Override
	public boolean delOutBoud(int oid) {
		  int result = outBoudDao.delOutBoud(oid);
	        if (result > 0) {
	            return true;
	        }else {
	            return false;
	        }
	}

	@Override
	public OutBoud findById(int oid) {
		// TODO Auto-generated method stub
		return outBoudDao.findById(oid);
	}
    

}
