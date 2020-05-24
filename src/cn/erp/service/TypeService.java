package cn.erp.service;

import java.util.List;

import cn.erp.pojo.Type;

public interface TypeService {
    // 查询所有的分类信息方法
    List<Type> getTypeList();
    // 增加分类信息的方法
    boolean addType(Type type);
    // 修改分类信息的方法
    boolean updateType(Type type);
    // 根据id查询分类信息的方法
    Type findById(int id);
    // 删除分类信息的方法
    boolean deleteType(int id);
}
