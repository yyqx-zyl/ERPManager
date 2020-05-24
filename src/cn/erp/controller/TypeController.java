package cn.erp.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.erp.pojo.Type;
import cn.erp.pojo.User;
import cn.erp.service.TypeService;

@Controller
@RequestMapping("/type")
public class TypeController {
    @Autowired
    private TypeService typeService;
    
    @RequestMapping(value="/addType",method=RequestMethod.POST)
    public String addType(@RequestParam("typeName") String typeName,
        @RequestParam("typeNotes") String typeNotes,
        HttpSession session) {
        // 获得当前登录的用户id
        int uid = ((User)session.getAttribute("loginUser")).getUid();
        // 创建类型对象
        Type type = new Type(typeName, typeNotes, uid, new Date());
        boolean isOk = typeService.addType(type);
        if (isOk) {
            // 去获得类型表中的所有数据
            return "redirect:getList";
        }
        return "/type";
    }
    
    // 创建一个获得所有分类信息的请求
    @RequestMapping(value="/getList",method=RequestMethod.GET)
    public String getList(
        @RequestParam(name="currpage",required=false,defaultValue="1") int currpage, 
        Model model) {
        // 调用PageHelp类的方法,startPage 就是去获得分页的数据
        PageHelper.startPage(currpage, 3);
        // 将查询的到的数据保存到model中
        List<Type> list = typeService.getTypeList();
        // 创建一个分页类的实例
        PageInfo pageInfo = new PageInfo(list, 3);
        model.addAttribute("pageInfo", pageInfo);
        return "/type";
    }
    
    // 删除数据的请求方法
    @RequestMapping(value="/delType",method=RequestMethod.POST)
    @ResponseBody
    public Object delType(@RequestParam("id") int id) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        boolean isOk = typeService.deleteType(id);
        if (isOk) {
            map.put("result", 1);
        }else {
            map.put("result", 0);
        }
        return JSON.toJSONString(map);
    }
    
    // 根据id查询分类信息的方法
    @RequestMapping(value="/findById",method=RequestMethod.GET)
    @ResponseBody 
    public Object findById(@RequestParam("id") int id) {
        Type type = typeService.findById(id);
        //model.addAttribute("type",type);
        return JSON.toJSONString(type);
    }
    // 更新分类信息的请求方法
    @RequestMapping(value="/updateType",method=RequestMethod.POST)
    // 因为页面上传递的是表单数据，而表单操作的是实体类型，所以我们这里就使用实体类来进行接收
    @ResponseBody
    public Object updateType(Type type,HttpSession session) {
        Map<String, Integer> map = new HashMap<String, Integer>();
        //System.out.println(type.getTypeName());
        // 获得当前登录用户的id
        int uid = ((User)session.getAttribute("loginUser")).getUid();
        // 为这个分类对象设置需要的值
        type.setModifyBy(uid);
        type.setModifyTime(new Date());
        boolean isOk = typeService.updateType(type);
        if (isOk) {
            map.put("result", 1);
        }else {
            map.put("result", 0);
        }
        return JSON.toJSONString(map);
    }
    
}
