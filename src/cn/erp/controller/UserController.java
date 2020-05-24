package cn.erp.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import cn.erp.pojo.User;
import cn.erp.service.UserService;

/**
 * 控制用户操作的控制器
 * @author lindy
 * @创建时间 2020年5月12日上午11:36:16
 */
@Controller
public class UserController {
    @Autowired
    private UserService userService;
    
    // 请求的方法
    @RequestMapping(value="/dologin",method=RequestMethod.POST)
    public String doLogin(@RequestParam("username") String userName,
        @RequestParam("userpassword") String userPassword,
        @RequestParam("code") String code,
        HttpSession session) {
        // 判断验证码的值是否与保存在session中的值相同
        if(!((String)session.getAttribute("yzm")).equals(code)) {
            return "login";
        }
        User user = userService.loginValider(userName, userPassword);
        if(user != null) {
            session.setAttribute("loginUser", user);
            return "redirect:index";
        }
        return "login";
    }
    
    @RequestMapping("/index")
    public String index(Model model) {
        //List<User> list = userService.getUserList();
        //model.addAttribute("list", list);
        return "index";
    }
    
    // 退出的请求
    @RequestMapping(value="/loginOut",method=RequestMethod.GET)
    public String loginout(HttpSession session) {
        session.invalidate();
        return "login";
    }
    
    // 定义一个获得验证码的请求
    @RequestMapping(value="/CodeImg",method=RequestMethod.GET)
    public void getCode(HttpServletRequest req,HttpServletResponse resp) throws Exception {
     // 设置响应的格式类型
        resp.setHeader("Content-Type", "image/jpeg");
        // 定义图片的宽和高
        int w = 80;
        int h = 30;
        // 声明一个RGB格式的内存中的图片
        BufferedImage img = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
        // 创建一个绘制图像的对象
        Graphics g = img.getGraphics();
        // 把背景变白色
        g.setColor(Color.white);
        g.fillRect(0, 0, w, h);
        // 设置字体
        g.setFont(new Font("aa", Font.BOLD, 18));
        // 产生并draw出4个随机数字
        Random r = new Random();
        // 创建一个保存生成四个数的字符串
        String yzm = "";
        for (int i = 0; i < 4; i++) {
            int a = r.nextInt(10);// 生成0~9之间的随机整数
            int y = 15 + r.nextInt(10);// 产生随机的垂直位置
            // 产生随机颜色
            Color c = new Color(r.nextInt(256), r.nextInt(256), r.nextInt(256));
            g.setColor(c);
            g.drawString("" + a, i * 15, y);
            // 把验证码转换为字符串追加到yzm中
            yzm += a;
        }
        // 把yzm放入session
        req.getSession().setAttribute("yzm", yzm);
        // 画几条干扰线
        for (int i = 0; i < 10; i++) {
            // 产生随机颜色
            Color c = new Color(r.nextInt(256), r.nextInt(256), r.nextInt(256));
            g.setColor(c);
            g.drawLine(r.nextInt(60), r.nextInt(30), r.nextInt(60), r.nextInt(30));
        }
        g.dispose();// 类似于IO中的flush(),把图形数据刷到img中
        // 把内存图片 img 对象保存到一个 jpg 文件
        ImageIO.write(img, "JPEG", resp.getOutputStream());
    }
    
    
    
    @RequestMapping(value = "/userList", method = RequestMethod.GET,produces="text/html;charset=UTF-8")
    @ResponseBody
    public String userList(HttpServletResponse response) throws Exception {
        //List<User> list = userService.getUserList();
        //return JSON.toJSONString(list);
        /*PrintWriter out = response.getWriter();
        out.write("<script>window.parent.location.href='';</script>");
        out.flush();*/
        return "/user";
    }
    
    //修改密码
    @RequestMapping(value = "/updatePassword",method = RequestMethod.POST)
	@ResponseBody
	 public Object updatePassword(User user,HttpSession session) {
		Map<String, Integer> map=new HashMap<String, Integer>();
		//获得当前登录用户id
		int uid=((User)session.getAttribute("loginUser")).getUid();
		user.setModifyBy(uid);
		user.setModifyTime(new Date());
		boolean isOk=userService.updatePassword(user);
		if(isOk) {
			map.put("result", 1);
		}else {
			map.put("result", 0);
		}
		return JSON.toJSONString(map);
	}
    
    
    //显示
    @RequestMapping(value = "/getUserList",method = RequestMethod.GET)
    public String getUserList(Model model) {
    	
    	List<User> list=userService.getUserList();
    	model.addAttribute("userlist", list);
    	
		return "user";
    	
    }
    
    
    
    
    
    
    
    
    
}
