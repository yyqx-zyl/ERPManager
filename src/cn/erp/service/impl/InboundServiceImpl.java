package cn.erp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.erp.dao.InboundDao;
import cn.erp.pojo.Inbound;
import cn.erp.service.InboundService;
@Service
public class InboundServiceImpl implements InboundService {

	@Autowired
	private InboundDao inboundDao;

	@Override
	public List<Inbound> getInboundList() {

		return inboundDao.getInboundList();
	}

	@Override
	public boolean addInbound(Inbound inbound) {
		int result=inboundDao.addInbound(inbound);
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public boolean updateInbound(Inbound inbound) {
		int result=inboundDao.updateInbound(inbound);
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public boolean deleteInbound(int inId) {
		int result=inboundDao.deleteInbound(inId);
		if(result>0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public Inbound findById(int inId) {
		
		return inboundDao.findById(inId);
	}
	
}
