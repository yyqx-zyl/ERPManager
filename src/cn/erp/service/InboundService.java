package cn.erp.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.erp.pojo.Inbound;
import cn.erp.pojo.Stock;

public interface InboundService {


	//显示所有
		List<Inbound> getInboundList();
		
		//增加
		boolean addInbound(Inbound inbound);
		
		//修改
		boolean updateInbound(Inbound inbound);
		
		//删除
		boolean deleteInbound(int inId);
		
		//根据id查询
		Inbound findById(int inId);
}
