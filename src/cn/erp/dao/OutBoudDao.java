package cn.erp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import cn.erp.pojo.OutBoud;
import cn.erp.pojo.Warning;

@Repository
public interface OutBoudDao {
    List<OutBoud> getOutBoudList();
    
    @Insert("insert into erp_outbound(sid,typeId,outNum,remarks,createBy,createTime)"
        + "values(#{sid},#{typeId},#{outNum},#{remarks},#{createBy},#{createTime})")
    int addOutBoud(OutBoud outBoud);
    
    @Update("update erp_outbound set sid=#{sid},typeId=#{typeId},outNum=#{outNum},remarks=#{remarks},"
        + "modifyBy=#{modifyBy},modifyTime=#{modifyTime} where oid=#{oid}")
    int updateOutBoud(OutBoud outBoud);
    
    @Delete("delete from erp_outbound where oid=#{oid}")
    int delOutBoud(@Param("oid") int oid);
    
    @Select("select * from erp_outbound where oid=#{oid}")
    OutBoud findById(@Param("oid") int oid);
}
