package cn.erp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import cn.erp.pojo.Inbound;
import cn.erp.pojo.Stock;

@Repository
public interface InboundDao {

	//显示所有
	List<Inbound> getInboundList();
	
	//增加
	@Insert("insert into erp_inbound(productName,typeId,wareNum,remarks,wareDate,createBy)"
			+"values(#{productName},#{typeId},#{wareNum},#{remarks},#{wareDate},#{createBy})")
	int addInbound(Inbound inbound);
	
	//修改
	@Update("update erp_inbound set productName=#{productName},typeId=#{typeId},wareNum=#{wareNum},"
	        + "remarks=#{remarks},modifyBy=#{modifyBy},modifyTime=#{modifyTime} where inId=#{inId}")
	int updateInbound(Inbound inbound);
	
	//删除
	@Delete("delete from erp_inbound where inId=#{inId}")
	int deleteInbound(@Param("inId") int inId);
	
	//根据id查询
	@Select("select * from erp_inbound where inId=#{inId}")
	Inbound findById(@Param("inId") int inId);
	

}
