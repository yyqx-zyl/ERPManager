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
    
    @Insert("insert into erp_outboud(sid,typeId,outNum,remark,createBy,createTime)"
        + " values(#{sid},#{typeId},#{outNum},#{remark},#{createBy},#{createTime})")
    int addOutBoud(OutBoud outBoud);
    
    @Update("update erp_outboud set sid=#{sid},typeId=#{typeId},outNum=#{outNum},remark=#{remark},"
        + "modifyBy=#{modifyBy},modifyTime=#{modifyTime} where oid=#{oid}")
    int updateOutBoud(OutBoud outBoud);
    
    @Delete("delete from erp_outboud where oid=#{oid}")
    int delOutBoud(@Param("oid") int oid);
    
    @Select("select * from erp_outboud where oid=#{oid}")
    OutBoud findById(@Param("oid") int oid);
}
