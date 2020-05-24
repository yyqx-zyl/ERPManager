package cn.erp.service;

import java.util.List;

import cn.erp.pojo.Warning;

public interface WarningServices {
    List<Warning> getWarnList();
    
    boolean addWarn(Warning warn);
    
    boolean updateWarn(Warning warn);
    
    boolean delWarn(int wid);
    
    Warning findById(int wid);
}
