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

import cn.erp.pojo.Inbound;
import cn.erp.pojo.Type;
import cn.erp.pojo.User;
import cn.erp.service.InboundService;
import cn.erp.service.TypeService;
import cn.erp.service.UserService;


@Controller
@RequestMapping("/inbound") 
public class InboundController {

	@Autowired
	private InboundService inboundService;
	@Autowired
	private TypeService typeService;
	@Autowired
	private UserService userService;
	
	//定义一个获得所有数据方法
	@RequestMapping(value = "getInboundList",method = RequestMethod.GET)
	public String  getInboundList(Model model,
			@RequestParam(name = "currpage",required = false,defaultValue = "1") int currpage) {

		PageHelper.startPage(currpage, 4);
		List<Inbound> list=inboundService.getInboundList();	
		
		List<Type> list1=typeService.getTypeList();
		model.addAttribute("list1", list1);
		
		PageInfo pageInfo=new PageInfo(list,4);
		//将分页实体保存
		model.addAttribute(pageInfo);
		return "inbound";
	}
	

	
	  //请求所有的分类信息
	  
	  @RequestMapping(value = "/getTypeList",method = RequestMethod.GET)
	  @ResponseBody public Object getTypeList() 
	  { 
		  List<Type>list=typeService.getTypeList(); 
		  return JSON.toJSONString(list); 
		  
	  }
	 
	
	//增加
		@RequestMapping(value = "/addInbound",method = RequestMethod.POST)
		public String addType(Inbound inbound,
				HttpSession session) {
			Map<String, Integer> map=new HashMap<String, Integer>();
			//获得当前
			int uid=((User)session.getAttribute("loginUser")).getUid();
			inbound.setCreateBy(uid);
			inbound.setWareDate(new Date());
			boolean isOk=inboundService.addInbound(inbound);
			if(isOk) {
				return "redirect:getInboundList";
			}
			
			return "/inbound";
		}
	
	
	
	//删除库存信息
		@RequestMapping(value = "/deleteInbound",method = RequestMethod.GET)
		@ResponseBody
		public Object deleteInbound(@RequestParam("id") int inId) {
			Map<String, Integer> map=new HashMap<String, Integer>();
			boolean isOk=inboundService.deleteInbound(inId);
			if(isOk) {
				map.put("result", 1);
			}else {
				map.put("result", 0);
			}
			
			return JSON.toJSONString(map);
		}
	
			
	//根据id找实体的请求
		@RequestMapping(value = "/findById",method = RequestMethod.GET)
		@ResponseBody
		public Object findById(@RequestParam("id") int inId,Model model) {
			Inbound inbound=inboundService.findById(inId);
			model.addAttribute("inId", inbound);
			return JSON.toJSONString(inbound);
		}
	
		
	//修改
		@RequestMapping(value = "/updateInbound",method = RequestMethod.POST,
				produces="application/json;charset=UTF-8")
		@ResponseBody
		 public Object updateInbound(Inbound inbound,HttpSession session) {
			Map<String, Integer> map=new HashMap<String, Integer>();
			//获得当前登录用户id
			int uid=((User)session.getAttribute("loginUser")).getUid();
			inbound.setModifyBy(uid);
			inbound.setModifyTime(new Date());
			boolean isOk=inboundService.updateInbound(inbound);
			if(isOk) {
				map.put("result", 1);
			}else {
				map.put("result", 0);
			}
			return JSON.toJSONString(map);
		}
		
	
		
		
		
		
	
}
