package cn.erp.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.erp.pojo.Inbound;
import cn.erp.pojo.Stock;

public interface InboundService {


		List<Inbound> getInboundList();
		
		boolean addInbound(Inbound inbound);
		
		boolean updateInbound(Inbound inbound);
		
		boolean deleteInbound(int inId);
		
		Inbound findById(int inId);
}
