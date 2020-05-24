package cn.erp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import cn.erp.pojo.Type;

@Repository
public interface TypeDao {
    // 查询所有的分类信息方法
    List<Type> getTypeList();
    // 增加分类信息的方法
    int addType(Type type);
    // 修改分类信息的方法
    @Update("update erp_type set typeName=#{typeName},typeDescribe=#{typeDescribe},"
        + "typeNotes=#{typeNotes},modifyBy=#{modifyBy},modifyTime=#{modifyTime}"
        + " where tid=#{tid}")
    int updateType(Type type);
    // 根据id查询分类信息的方法
    Type findById(@Param("tid") int id);
    // 删除分类信息的方法
    int deleteType(@Param("tid") int id);
}
