package cn.erp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import cn.erp.pojo.Warning;

@Repository
public interface WarningDao {
    List<Warning> getWarnList();
    @Insert("insert into erp_warning(sid,typeId,remark,warnNum,createBy,createTime)"
        + " values(#{sid},#{typeId},#{remark},#{warnNum},#{createBy},#{createTime})")
    int addWarn(Warning warn);
    @Update("update erp_warning set sid=#{sid},typeId=#{typeId},warnNum=#{warnNum},remark=#{remark},"
        + "modifyBy=#{modifyBy},modifyTime=#{modifyTime} where wid=#{wid}")
    int updateWarn(Warning warn);
    @Delete("delete from erp_warning where wid=#{wid}")
    int delWarn(@Param("wid") int wid);
    @Select("select * from erp_warning where wid=#{wid}")
    Warning findById(@Param("wid") int wid);
}
