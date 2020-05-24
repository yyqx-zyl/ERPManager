package cn.erp.service;

import java.util.List;
import cn.erp.pojo.Stock;

public interface StockService {
    List<Stock> getStockList();
    
    boolean addStock(Stock stock);
    
    boolean updateStock(Stock stock);
    
    boolean deleteStock(int sid);
    
    Stock findById(int sid);
}
