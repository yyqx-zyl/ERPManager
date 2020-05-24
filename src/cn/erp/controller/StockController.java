package cn.erp.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.erp.pojo.Stock;
import cn.erp.pojo.Type;
import cn.erp.pojo.User;
import cn.erp.service.StockService;
import cn.erp.service.TypeService;

@Controller
@RequestMapping("/stock")
public class StockController {
    @Autowired
    private StockService stockService;
    @Autowired
    private TypeService typeService;
    // 定义一个获得所有数据的方法
    @RequestMapping(value="/getStockList",method=RequestMethod.GET)
    @ResponseBody
    public Object getStockList(@RequestParam(name="currpage",required=false,defaultValue="1") int currpage) {
        PageHelper.startPage(currpage, 3);
        List<Stock> list = stockService.getStockList();
        PageInfo pageInfo = new PageInfo(list, 3);
        return JSON.toJSONString(pageInfo);
    }
    
    // 请求所有的库存信息
    @RequestMapping(value="/getStockList",method=RequestMethod.POST)
    @ResponseBody
    public Object getList() {
        List<Stock> list = stockService.getStockList();
        return JSON.toJSONString(list);
    }
    
    @RequestMapping(value="/getTypeList",method=RequestMethod.GET)
    @ResponseBody
    public Object getTypeList() {
        List<Type> list = typeService.getTypeList();
        return JSON.toJSONString(list);
    }
    
    // 增加库存信息的方法
    @RequestMapping(value="/addStock",method=RequestMethod.POST)
    @ResponseBody
    public Object addStock(Stock stock,HttpSession session) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        // 调用增加数据的方法
        int uid = ((User)session.getAttribute("loginUser")).getUid();
        stock.setCreateBy(uid);
        stock.setCreateTime(new Date());
        boolean isOk = stockService.addStock(stock);
        if (isOk) {
            map.put("result", 1);
        }else {
            map.put("result", 0);
        }
        return JSON.toJSONString(map);
    }
    
    // 删除库存信息的方法
    @RequestMapping(value="/deleteStock",method=RequestMethod.GET)
    @ResponseBody
    public Object deleteStock(@RequestParam("id") int sid) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        boolean isOk = stockService.deleteStock(sid);
        if (isOk) {
            map.put("result", 1);
        }else {
            map.put("result", 0);
        }
        return JSON.toJSONString(map);
    }
    
    // 根据id找实体的请求
    @RequestMapping(value="/findById",method=RequestMethod.GET)
    @ResponseBody
    public Object findById(@RequestParam("id") int id) {
        // 调用通过id查找实体的方法
        Stock stock = stockService.findById(id);
        return JSON.toJSONString(stock);
    }
    
    @RequestMapping(value="/updateStock",method=RequestMethod.POST)
    @ResponseBody
    public Object updateStock(Stock stock,HttpSession session) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        // 调用增加数据的方法
        int uid = ((User)session.getAttribute("loginUser")).getUid();
        stock.setModifyBy(uid);
        stock.setModifyTime(new Date());
        boolean isOk = stockService.updateStock(stock);
        if (isOk) {
            map.put("result", 1);
        }else {
            map.put("result", 0);
        }
        return JSON.toJSONString(map);
    }
    
}
