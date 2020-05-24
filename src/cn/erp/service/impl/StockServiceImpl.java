package cn.erp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.erp.dao.StockDao;
import cn.erp.pojo.Stock;
import cn.erp.service.StockService;
@Service
public class StockServiceImpl implements StockService{

    @Autowired
    private StockDao stockDao;
    @Override
    public List<Stock> getStockList() {
        // TODO Auto-generated method stub
        return stockDao.getStockList();
    }

    @Override
    public boolean addStock(Stock stock) {
        int result = stockDao.addStock(stock);
        if (result > 0) {
           return true; 
        }else {
            return false;
        }
    }

    @Override
    public boolean updateStock(Stock stock) {
        int result = stockDao.updateStock(stock);
        if (result > 0) {
           return true; 
        }else {
            return false;
        }
    }

    @Override
    public boolean deleteStock(int sid) {
        int result = stockDao.deleteStock(sid);
        if (result > 0) {
           return true; 
        }else {
            return false;
        }
    }

    @Override
    public Stock findById(int sid) {
        // TODO Auto-generated method stub
        return stockDao.findById(sid);
    }

}
