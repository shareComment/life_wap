/**
 * Copyright (C) 2016 Chaos
 *
 *
 * @className:com.life.wap.cfg.code.conntroller.WapConntroller
 * 
 * @version:v1.0.0 
 * @author:Chaos
 * 
 * Modification History:
 * Date         Author      Version     Description
 * -----------------------------------------------------------------
 * 2016年7月14日     Chaos       v1.0.0        create
 *
 *
 */
package com.life.wap.cfg.code.conntroller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import java.nio.channels.FileChannel.MapMode;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.life.wap.cfg.code.conntroller.bean.BrandCommentInfo;
import com.life.wap.cfg.code.conntroller.bean.RspBrandBean;
import com.life.wap.cfg.code.conntroller.bean.RspBrandComBean;
import com.life.wap.cfg.code.conntroller.bean.RspBrandListBean;
import com.life.wap.cfg.code.conntroller.bean.RspParamListBean;
import com.life.wap.cfg.code.conntroller.bean.RspSysInfoBean;
import com.life.wap.cfg.code.conntroller.bean.RspUserBean;
import com.life.wap.cfg.code.conntroller.bean.UserInfo;
import com.life.wap.cfg.code.util.Constants;
import com.life.wap.cfg.code.util.JsonUtil;
import com.life.wap.cfg.code.util.MD5Util;
import com.life.wap.cfg.code.util.StringTools;
import com.sun.org.apache.xpath.internal.operations.Mod;

/**
 * @className:com.life.wap.cfg.code.conntroller.WapConntroller
 * @version:v1.0.0 
 * @date:2016年7月14日 下午8:29:21
 * @author:Chaos
 */
@Controller
@RequestMapping(value = "/WapConntroller")
public class WapConntroller
{
	/**
	 * 错误日志
	 */
	private static final Logger logger = Logger.getLogger(WapConntroller.class);
	
	private Gson gson = new Gson();
	
	/**
	 * 首页
	 * @Description:
	 * @param request
	 * @param response
	 * @return
	 * @version:v1.0
	 * @author:Chaos
	 * @date:2016年7月14日 下午8:34:24
	 */
	@SuppressWarnings("static-access")
	@RequestMapping(value = "/showHome" , method = RequestMethod.GET)
	public ModelAndView showHome(HttpServletRequest request , HttpServletResponse response)
	{
		ModelAndView view = new ModelAndView("home");
		
		String error = "";
		String param = "";
		String result = "";
		
		//获取轮播
		result = this.sendGet(Constants.url + "syscontro/queryparamlist.do", param);
		if(JsonUtil.getValue(result, "result").equals("0"))
		{
			RspParamListBean rspParamListBean = gson.fromJson(result, RspParamListBean.class);
			request.getSession().setAttribute("homeLBList", rspParamListBean.getInfoList());
		}
		else
		{
		}
		
		//获取品牌list
		result = this.sendGet(Constants.url + "brandcontro/queryHomebrandlist/score/0.do", param);
		if(JsonUtil.getValue(result, "result").equals("0"))
		{
			RspBrandListBean rspBrandListBean = gson.fromJson(result, RspBrandListBean.class);
			request.getSession().setAttribute("homeBrandList", rspBrandListBean.getInfoList());
		}
		else
		{
		}
		
		return view;
	}
	
	
	/**
	 * 跳转登录
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/showLogin" , method = RequestMethod.GET)
	public ModelAndView showLogin(HttpServletRequest request , HttpServletResponse response)
	{
		ModelAndView view = new ModelAndView("login");
		return view;
	}
	
	
	/**
	 * 登录
	 * @param request
	 * @param response
	 * @return
	 */
	@SuppressWarnings("static-access")
	@RequestMapping(value = "/login" , method = RequestMethod.GET)
	public ModelAndView login(HttpServletRequest request , HttpServletResponse response)
	{
		ModelAndView view = new ModelAndView("login");
		String error = "";
		String param = "";
		String result = "";
		
		//验证用户密码
		String telephone = request.getParameter("telephone");
		String password = request.getParameter("password");
		
		if(StringTools.isNullOrEmpty(telephone) || StringTools.isNullOrEmpty(password)
			|| telephone.length() != 11 || password.length() < 6)
		{
			//用户名或密码不正确请重新输入
			error = "<div class='alert alert-danger'>用户名或密码不正确请重新输入。</div>";
			request.setAttribute("telephone", "");
			request.setAttribute("password", "");
			request.setAttribute("error", error);
		}
		else
		{
			password = MD5Util.getMD5String(password);
			param = "{'reqInfo': {'telephone':'"+telephone+"','password': '"+password+"'}}";
			//请求接口
			result = this.sendPost(Constants.url + "usercontro/login.do", param);
			
			if(StringTools.isNullOrEmpty(result))
			{
				error = "<div class='alert alert-danger'>服务器异常，请稍后在尝试！</div>";
				request.setAttribute("error", error);
			}
			else
			{
				if(JsonUtil.getValue(result, "result").equals("0"))
				{
					RspUserBean rspUserBean = gson.fromJson(result, RspUserBean.class);
					request.getSession().setAttribute("rspUserBean", rspUserBean.getRspInfo());
					view = new ModelAndView("home");
				}
				else
				{
					error = "<div class='alert alert-danger'>用户名或密码不正确请重新输入。</div>";
					request.setAttribute("telephone", "");
					request.setAttribute("password", "");
					request.setAttribute("error", error);
				}
			}
		}
		
		return view;
	}
	
	
	/**
	 * 显示注册
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/showRegister" , method = RequestMethod.GET)
	public ModelAndView showRegister(HttpServletRequest request , HttpServletResponse response)
	{
		ModelAndView view = new ModelAndView("register");
		return view;
	}
	
	
	/**
	 * 注册
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/register" , method = RequestMethod.POST)
	public ModelAndView register(HttpServletRequest request , HttpServletResponse response)
	{
		ModelAndView view = new ModelAndView("register");
		String error = "";
		String param = "";
		String result = "";
		
		//获取请求信息
		String telephone = request.getParameter("telephone");
		String password = request.getParameter("password");
		String password1 = request.getParameter("password1");
		String salt = request.getParameter("salt");
		
		if(StringTools.isNullOrEmpty(telephone) 
			|| StringTools.isNullOrEmpty(password)
			|| StringTools.isNullOrEmpty(password1)
			|| StringTools.isNullOrEmpty(salt)
			|| password.length() < 6
			|| password1.length() < 6
			|| !password.equals(password1))
		{
			error = "<div class='alert alert-danger'>注册信息不完全，请输入完全。</div>";
			request.setAttribute("error", error);
		}
		else
		{
			password = MD5Util.getMD5String(password);
			
			param = "{'reqInfo': {'telephone':'"+telephone+"','password': '"+password+"','salt':'"+salt+"'}}";
			//请求接口
			result = sendPost(Constants.url + "usercontro/register.do", param);
			
			if(StringTools.isNullOrEmpty(result))
			{
				error = "<div class='alert alert-danger'>服务器异常，请稍后在尝试！</div>";
				request.setAttribute("error", error);
			}
			else
			{
				if(JsonUtil.getValue(result, "result").equals("0"))
				{
					RspUserBean rspUserBean = gson.fromJson(result, RspUserBean.class);
					request.getSession().setAttribute("rspUserBean", rspUserBean.getRspInfo());
					view = new ModelAndView("home");
				}
				else
				{
					error = "<div class='alert alert-danger'>+"+JsonUtil.getValue(result, "errorInfo")+"+</div>";
					request.setAttribute("error", error);
				}
			}
		}
		
		return view;
	}
	
	
	/**
	 * 显示品牌
	 * @param request
	 * @param response
	 * @return
	 */
	@SuppressWarnings("static-access")
	@RequestMapping(value = "/showBrand/{brand_id}/{code}/{page}" , method = RequestMethod.GET)
	public ModelAndView showBrand(@PathVariable("brand_id") String brand_id,
			@PathVariable("page") String page,
			@PathVariable("code") String code,
			HttpServletRequest request , HttpServletResponse response)
	{
		ModelAndView view = new ModelAndView("brand");
		
		String error = "";
		String param = "";
		String result = "";
		
		result = this.sendGet(Constants.url + "brandcontro/querybrandinfo/"+brand_id+".do", param);
		
		if(StringTools.isNullOrEmpty(result))
		{
			error = "<div class='alert alert-danger'>服务器异常，请稍后在尝试！</div>";
			request.setAttribute("error", error);
		}
		else
		{
			if(JsonUtil.getValue(result, "result").equals("0"))
			{
				RspBrandBean rspBrandBean  = gson.fromJson(result, RspBrandBean.class);
				request.getSession().setAttribute("rspBrandBean", rspBrandBean.getRspInfo());
				request.getSession().setAttribute("rspBrandCommentListCom", rspBrandBean.getRspInfo().getCommentNum());
			}
			else
			{
				error = "<div class='alert alert-danger'>+"+JsonUtil.getValue(result, "errorInfo")+"+</div>";
				request.setAttribute("error", error);
			}
		}
		result = this.sendGet(Constants.url + "commentContro/querybrandcommetlist/"+brand_id+"/0/"+page+".do", param);
		
		if(StringTools.isNullOrEmpty(result))
		{
			error = "<div class='alert alert-danger'>服务器异常，请稍后在尝试！</div>";
			request.setAttribute("error", error);
		}
		else
		{
			if(JsonUtil.getValue(result, "result").equals("0"))
			{
				RspBrandComBean rspBrandBean  = gson.fromJson(result, RspBrandComBean.class);
				Integer p = Integer.valueOf(rspBrandBean.getCount());
				Integer end = p;
				request.getSession().setAttribute("rspBrandCommentList", rspBrandBean.getInfoList());
				if("0".equals(code))
				{
					request.getSession().setAttribute("rspBrandCommentListCom", rspBrandBean.getCount());
					request.setAttribute("rspBrandCommentListPre", (Integer.valueOf(page) > 1)?String.valueOf(Integer.valueOf(page)-1):"1");
					request.setAttribute("rspBrandCommentListNex", (Integer.valueOf(page) < end)?String.valueOf(Integer.valueOf(page)+1):String.valueOf(page));
				}
			}
			else
			{
				error = "<div class='alert alert-danger'>+"+JsonUtil.getValue(result, "errorInfo")+"+</div>";
				request.setAttribute("error", error);
			}
		}
		return view;
	}
	
	/**
	 * 显示品牌评论列表
	 * @param request
	 * @param response
	 * @return
	 */
	@SuppressWarnings("static-access")
	@RequestMapping(value = "/showBrandComList/{brand_id}/{code}/{page}" , method = RequestMethod.GET)
	public ModelAndView showBrand1(@PathVariable("brand_id") String brand_id,@PathVariable("page") String page,
			@PathVariable("code") String code,
			HttpServletRequest request , HttpServletResponse response)
	{
		ModelAndView view = new ModelAndView("brand");
		
		String error = "";
		String param = "";
		String result = "";
		
		result = this.sendGet(Constants.url + "commentContro/querybrandcommetlist/"+brand_id+"/"+code+"/"+page+".do", param);
		
		if(StringTools.isNullOrEmpty(result))
		{
			error = "<div class='alert alert-danger'>服务器异常，请稍后在尝试！</div>";
			request.setAttribute("error", error);
		}
		else
		{
			if(JsonUtil.getValue(result, "result").equals("0"))
			{
				RspBrandComBean rspBrandBean  = gson.fromJson(result, RspBrandComBean.class);
				Integer p = Integer.valueOf(rspBrandBean.getCount());
				Integer end = p;
				request.getSession().setAttribute("rspBrandCommentList", rspBrandBean.getInfoList());
				if("0".equals(code))
				{
					request.getSession().setAttribute("rspBrandCommentListPre", (Integer.valueOf(page) > 1)?String.valueOf(Integer.valueOf(page)-1):"1");
					request.getSession().setAttribute("rspBrandCommentListNex", (Integer.valueOf(page) < end)?String.valueOf(Integer.valueOf(page)+1):String.valueOf(page));
				}
			}
			else
			{
				error = "<div class='alert alert-danger'>+"+JsonUtil.getValue(result, "errorInfo")+"+</div>";
				request.setAttribute("error", error);
			}
		}
		
		return view;
	}
	
	
	/**
	 * 忘记密码
	 * @Description:
	 * @param request
	 * @param response
	 * @return
	 * @version:v1.0
	 * @author:Chaos
	 * @date:2016年7月18日 下午11:47:28
	 */
	@SuppressWarnings("static-access")
	@RequestMapping(value = "/forgetPwd" , method = RequestMethod.POST)
	public ModelAndView forgetPwd(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView view = new ModelAndView("forgetpwd");
		
		String error = "";
		String param = "";
		String result = "";
		
		//获取信息
		String telephone = request.getParameter("telephone");
		String password = request.getParameter("password");
		String password1 = request.getParameter("password1");
		String salt = request.getParameter("salt");
		
		if(StringTools.isNullOrEmpty(telephone) || StringTools.isNullOrEmpty(password)
				|| telephone.length() != 11 || password.length() < 6)
			{
				error = "<div class='alert alert-danger'>用户名或密码不正确请重新输入。</div>";
				if(salt.length() < 4)
				{
					error = "<div class='alert alert-danger'>用户名或密码不正确请重新输入。</div>";
				}
				//用户名或密码不正确请重新输入
				request.setAttribute("telephone", "");
				request.setAttribute("password", "");
				request.setAttribute("password1", "");
				request.setAttribute("error", error);
			}
			else
			{
				if(!password.equals(password1))
				{
					error = "<div class='alert alert-danger'>两次密码输入不一致。</div>";
					request.setAttribute("telephone", "");
					request.setAttribute("password", "");
					request.setAttribute("password1", "");
					request.setAttribute("error", error);
				}
				else
				{
					password = MD5Util.getMD5String(password);
					
					//请求接口
					param = "{'reqInfo': {'user_id':'"+telephone+"','oldPwd': '"+password+",'newPwd':'"+password1+"}}";
					result = this.sendPost(Constants.url + "usercontro/uptpwd/"+salt+".do", param);
					
					if(StringTools.isNullOrEmpty(result))
					{
						error = "<div class='alert alert-danger'>服务器异常，请稍后在尝试！</div>";
						request.setAttribute("error", error);
					}
					else
					{
						if(JsonUtil.getValue(result, "result").equals("0"))
						{
							RspUserBean rspUserBean = gson.fromJson(result, RspUserBean.class);
							request.getSession().setAttribute("rspUserBean", rspUserBean.getRspInfo());
						}
						else
						{
							error = "<div class='alert alert-danger'>"+JsonUtil.getValue(result,"errorInfo")+"</div>";
							request.setAttribute("telephone", "");
							request.setAttribute("password", "");
							request.setAttribute("password1", "");
							request.setAttribute("error", error);
						}
					}
					
				}
			}
		
		return view;
	}
	
	/**
	 * 显示添加评论
	 * 品牌ID
	 * 评论ID 0是一级评论，非0是子回复
	 * @Description:
	 * @param request
	 * @param response
	 * @return
	 * @version:v1.0
	 * @author:Chaos
	 * @date:2016年7月19日 下午3:29:34
	 */
	@RequestMapping(value = "/showAddComment/{brandId}/{comId}" , method = RequestMethod.GET)
	public ModelAndView showAddComment(@PathVariable("brandId") String brandId,
			@PathVariable("comId") String comId,
			HttpServletRequest request , HttpServletResponse response)
	{
		ModelAndView view = new ModelAndView("addComment");
		request.setAttribute("addComBrandId", brandId);
		request.setAttribute("addCommComId", comId);
		return view;
	}
	
	
	/**
	 * 添加评论
	 * @Description:
	 * @param request
	 * @param response
	 * @return
	 * @version:v1.0
	 * @author:Chaos
	 * @date:2016年7月20日 上午8:32:42
	 */
	@RequestMapping(value = "/addComment",method = RequestMethod.POST)
	public ModelAndView addComment(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView view = new ModelAndView();
		
		String error = "";
		String param = "";
		String result = "";
		
		String addComBrandId = request.getParameter("addComBrandId");
		String addCommComId = request.getParameter("addCommComId");
		String img = request.getParameter("img");
		if(StringTools.isNullOrEmpty(img))
		{
			img = "";
		}
		
		String com = request.getParameter("con");
		UserInfo UserInfo = (UserInfo) request.getSession().getAttribute("rspUserBean");
		if(StringTools.isNullOrEmpty(UserInfo))
		{
			view = new ModelAndView("login");
			return view;
		}
		
		if(!StringTools.isNullOrEmpty(com) && !StringTools.isNullOrEmpty(com.trim()))
		{
			param = "{'brand_id':'"+addComBrandId+"','user_id': '"+UserInfo.getUser_id()+"','comment_pid': '"+addCommComId+"','comment': '"+com.trim()+"','comment_img': '"+img+"'}";
			result = this.sendPost(Constants.url + "commentContro/addbrandcomment.do", param);
		}
		
		return view;
	}
	
	/**
	 * 显示评论详情（二级评论）
	 * @Description:
	 * @param request
	 * @param response
	 * @return
	 * @version:v1.0
	 * @author:Chaos
	 * @date:2016年7月19日 下午9:07:54
	 */
	@SuppressWarnings("static-access")
	@RequestMapping(value = "/showComInfo/{brandId}/{comId}/{page}" , method = RequestMethod.GET)
	public ModelAndView showComInfo(@PathVariable("brandId") String brandId,@PathVariable("comId") String comId,
			@PathVariable("page") String page,
			HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView view = new ModelAndView("commentInfo");
		
		String error = "";
		String param = "";
		String result = "";
		
		List<BrandCommentInfo> perList = (List<BrandCommentInfo>) request.getSession().getAttribute("rspBrandCommentList");
		for (int i = 0; i < perList.size(); i++)
		{
			if(perList.get(i).getComment_id().equals(comId))
			{
				request.setAttribute("commentPreInfo", perList.get(i));
			}
		}
		
		//请求接口
		result = this.sendGet(Constants.url + "commentContro/querybrandcommetlist/"+brandId+"/"+comId+"/"+page+".do", param);
		
		if(StringTools.isNullOrEmpty(result))
		{
			error = "<div class='alert alert-danger'>服务器异常，请稍后在尝试！</div>";
			request.setAttribute("error", error);
		}
		else
		{
			if(JsonUtil.getValue(result, "result").equals("0"))
			{
				RspBrandComBean rspBrandBean  = gson.fromJson(result, RspBrandComBean.class);
				Integer p = Integer.valueOf(rspBrandBean.getCount());
				Integer end = p;
				request.setAttribute("rspCommentList", rspBrandBean.getInfoList());
				request.setAttribute("rspCommentListCom", rspBrandBean.getCount());
				request.setAttribute("rspCommentListPre", (Integer.valueOf(page) > 1)?String.valueOf(Integer.valueOf(page)-1):"1");
				request.setAttribute("rspCommentListNex", (Integer.valueOf(page) < end)?String.valueOf(Integer.valueOf(page)+1):String.valueOf(page));
			}
			else
			{
				error = "<div class='alert alert-danger'>+"+JsonUtil.getValue(result, "errorInfo")+"+</div>";
				request.setAttribute("error", error);
			}
		}
		
		
		return view;
	}
	
	
	/**
	 * 显示个人中心首页
	 * @Description:
	 * @param request
	 * @param response
	 * @return
	 * @version:v1.0
	 * @author:Chaos
	 * @date:2016年7月20日 下午6:34:17
	 */
	@RequestMapping(value = "/showMy" , method = RequestMethod.GET)
	public ModelAndView showMy(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView view = new ModelAndView("my");
		String error = "";
		String param = "";
		String result = "";
		UserInfo UserInfo = (UserInfo) request.getSession().getAttribute("rspUserBean");
		if(StringTools.isNullOrEmpty(UserInfo))
		{
			view = new ModelAndView("login");
			return view;
		}
		
		if(UserInfo == null || StringTools.isNullOrEmpty(UserInfo.getUser_id()))
		{
			view = new ModelAndView("login");
			return view;
		}
		
		//根据UID查询
		result = this.sendGet(Constants.url + "usercontro/queryuserinfo/"+UserInfo.getUser_id()+".do", param);
		
		if(StringTools.isNullOrEmpty(result))
		{
			error = "<div class='alert alert-danger'>服务器异常，请稍后在尝试！</div>";
			request.setAttribute("error", error);
		}
		else
		{
			RspUserBean rspBean = gson.fromJson(result, RspUserBean.class);
			if(JsonUtil.getValue(result, "result").equals("0"))
			{
				request.getSession().setAttribute("myUser", rspBean.getRspInfo());
			}
			else
			{
				error = "<div class='alert alert-danger'>+"+JsonUtil.getValue(result, "errorInfo")+"+</div>";
				request.setAttribute("error", error);
			}
		}
		
		return view;
	}
	
	
	/**
	 * 显示个人信息
	 * @Description:
	 * @param request
	 * @param response
	 * @return
	 * @version:v1.0
	 * @author:Chaos
	 * @date:2016年7月20日 下午6:34:17
	 */
	@SuppressWarnings("static-access")
	@RequestMapping(value = "/showMyInfo" , method = RequestMethod.GET)
	public ModelAndView showMyInfo(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView view = new ModelAndView("myInfo");
		
		String error = "";
		String param = "";
		String result = "";
		
		UserInfo UserInfo = (UserInfo) request.getSession().getAttribute("rspUserBean");
		if(StringTools.isNullOrEmpty(UserInfo))
		{
			view = new ModelAndView("login");
			return view;
		}
		
		if(UserInfo == null || StringTools.isNullOrEmpty(UserInfo.getUser_id()))
		{
			view = new ModelAndView("login");
			return view;
		}
		
		//根据UID查询
		result = this.sendGet(Constants.url + "usercontro/queryuserinfo/"+UserInfo.getUser_id()+".do", param);
		
		if(StringTools.isNullOrEmpty(result))
		{
			error = "<div class='alert alert-danger'>服务器异常，请稍后在尝试！</div>";
			request.setAttribute("error", error);
		}
		else
		{
			RspUserBean rspBean = gson.fromJson(result, RspUserBean.class);
			if(JsonUtil.getValue(result, "result").equals("0"))
			{
				request.getSession().setAttribute("myUser", rspBean.getRspInfo());
			}
			else
			{
				error = "<div class='alert alert-danger'>+"+JsonUtil.getValue(result, "errorInfo")+"+</div>";
				request.setAttribute("error", error);
			}
		}
		
		return view;
	}
	
	
	/**
	 * 显示修改页面
	 * @Description:
	 * @param request
	 * @param response
	 * @return
	 * @version:v1.0
	 * @author:Chaos
	 * @date:2016年7月20日 下午8:18:31
	 */
	@RequestMapping(value = "/showUpdateMyInfo/{code}" , method = RequestMethod.GET)
	public ModelAndView showUpdateMyInfo(@PathVariable("code") String code,
			HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView view = new ModelAndView("upMyInfo");
		request.setAttribute("upCode", code);
		if(StringTools.isNullOrEmpty(code))
		{
			if("1".equals(code))
			{
				//头像
			}
			else if("2".equals(code))
			{
				//昵称
			}
			else if("3".equals(code))
			{
				//姓名
			}
			else if("4".equals(code))
			{
				//性别
			}
			else if("5".equals(code))
			{
				//年龄
			}
			else if("6".equals(code))
			{
				//学历
			}
			else if("7".equals(code))
			{
				//毕业院校
			}
			else if("8".equals(code))
			{
				//邮箱
			}
		}	
		return view;
	}
	
	/**
	 * 修改个人信息
	 * @Description:
	 * @param request
	 * @param response
	 * @return
	 * @version:v1.0
	 * @author:Chaos
	 * @date:2016年7月20日 下午7:57:05
	 */
	@RequestMapping(value = "/updateMyInfo/{code}" ,method = RequestMethod.POST)
	public ModelAndView updateMyInfo(@PathVariable("code") String code,
			HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView view = new ModelAndView("myInfo");
		
		String result = "";
		String r = "";
		String param = "";
		String error = "";
		UserInfo UserInfo = (UserInfo) request.getSession().getAttribute("rspUserBean");
		if(StringTools.isNullOrEmpty(UserInfo))
		{
			view = new ModelAndView("login");
			return view;
		}
		r = (String) request.getAttribute("up");
		if(StringTools.isNullOrEmpty(r))
		{
			if("1".equals(code))
			{
				//头像
				param = "{'reqInfo': {'user_id':'"+UserInfo.getUser_id()+"','avatar': '"+r+"'}}";
			}
			else if("2".equals(code))
			{
				//昵称
				param = "{'reqInfo': {'user_id':'"+UserInfo.getUser_id()+"','nickname': '"+r+"'}}";
			}
			else if("3".equals(code))
			{
				//姓名
				param = "{'reqInfo': {'user_id':'"+UserInfo.getUser_id()+"','username': '"+r+"'}}";
			}
			else if("4".equals(code))
			{
				if("男".equals(r))
				{
					r = "1";
				}
				else
				{
					r = "0";
				}
				//性别
				param = "{'reqInfo': {'user_id':'"+UserInfo.getUser_id()+"','gender': '"+r+"'}}";
			}
			else if("5".equals(code))
			{
				//年龄
				param = "{'reqInfo': {'user_id':'"+UserInfo.getUser_id()+"','age': '"+r+"'}}";
			}
			else if("6".equals(code))
			{
				//学历
				param = "{'reqInfo': {'user_id':'"+UserInfo.getUser_id()+"','education': '"+r+"'}}";
			}
			else if("7".equals(code))
			{
				//毕业院校
				param = "{'reqInfo': {'user_id':'"+UserInfo.getUser_id()+"','collage': '"+r+"'}}";
			}
			else if("8".equals(code))
			{
				//邮箱
				param = "{'reqInfo': {'user_id':'"+UserInfo.getUser_id()+"','email': '"+r+"'}}";
			}
			if(!StringTools.isNullOrEmpty(code))
			{
				result = sendPost(Constants.url + "usercontro/uptuser.do", param);
			}
		}	
		
		return view;
	}
	
	
	/**
	 * 搜索品牌
	 * @Description:
	 * @param request
	 * @param response
	 * @return
	 * @version:v1.0
	 * @author:Chaos
	 * @date:2016年7月20日 下午10:20:23
	 */
	@SuppressWarnings("static-access")
	@RequestMapping(value = "/searchBrandList/{page}" ,method = RequestMethod.POST)
	public ModelAndView searchBrandList(@PathVariable("page") String page,
			HttpServletRequest request ,HttpServletResponse response)
	{
		ModelAndView view  = new ModelAndView("brandlist");
		
		String error = "";
		String param = "";
		String result = "";
		
		String brandName = (String) request.getParameter("b");
		
		param = "{'brand_name':'"+brandName+"'}";
		//请求接口
		result = this.sendPost(Constants.url + "brandcontro/searchbrandinfo/"+page+".do", param);
		
		if(StringTools.isNullOrEmpty(result))
		{
			error = "<div class='alert alert-danger'>服务器异常，请稍后在尝试！</div>";
			request.setAttribute("error", error);
		}
		else
		{
			if(JsonUtil.getValue(result, "result").equals("0"))
			{
				RspBrandListBean rspBrandListBean = gson.fromJson(result, RspBrandListBean.class);
				Integer p = Integer.valueOf(rspBrandListBean.getCount());
				Integer end = p;
				request.getSession().setAttribute("rspSearchBrandList", rspBrandListBean.getInfoList());
				request.getSession().setAttribute("rspSearchBrandListCom", rspBrandListBean.getCount());
				request.getSession().setAttribute("rspSearchBrandListPre", (Integer.valueOf(page) > 1)?String.valueOf(Integer.valueOf(page)-1):"1");
				request.getSession().setAttribute("rspSearchBrandListNex", (Integer.valueOf(page) < end)?String.valueOf(Integer.valueOf(page)+1):String.valueOf(page));
			}
			else
			{
				error = "<div class='alert alert-danger'>+搜索不到，请换个关键词</div>";
				request.setAttribute("error", error);
			}
		}
		
		return view;
	}
	@RequestMapping(value = "/searchBrandLists/{page}/{name}" ,method = RequestMethod.POST)
	public ModelAndView searchBrandLists(@PathVariable("page") String page,
			@PathVariable("name") String name,
			HttpServletRequest request ,HttpServletResponse response)
	{
		ModelAndView view  = new ModelAndView("brandlist");
		
		String error = "";
		String param = "";
		String result = "";
		
		param = "{'brand_name':'"+name+"'}";
		//请求接口
		result = this.sendPost(Constants.url + "brandcontro/searchbrandinfo/"+page+".do", param);
		
		if(StringTools.isNullOrEmpty(result))
		{
			error = "<div class='alert alert-danger'>服务器异常，请稍后在尝试！</div>";
			request.setAttribute("error", error);
		}
		else
		{
			if(JsonUtil.getValue(result, "result").equals("0"))
			{
				RspBrandListBean rspBrandListBean = gson.fromJson(result, RspBrandListBean.class);
				Integer p = Integer.valueOf(rspBrandListBean.getCount());
				Integer end = p;
				request.getSession().setAttribute("rspSearchBrandList", rspBrandListBean.getInfoList());
				request.getSession().setAttribute("rspSearchBrandListCom", rspBrandListBean.getCount());
				request.getSession().setAttribute("rspSearchBrandListPre", (Integer.valueOf(page) > 1)?String.valueOf(Integer.valueOf(page)-1):"1");
				request.getSession().setAttribute("rspSearchBrandListNex", (Integer.valueOf(page) < end)?String.valueOf(Integer.valueOf(page)+1):String.valueOf(page));
			}
			else
			{
				error = "<div class='alert alert-danger'>+搜索不到，请换个关键词</div>";
				request.setAttribute("error", error);
			}
		}
		
		return view;
	}
	
	
	/**
	 * 查询我的评论
	 * @Description:
	 * @param request
	 * @param response
	 * @return
	 * @version:v1.0
	 * @author:Chaos
	 * @date:2016年7月20日 下午11:28:28
	 */
	@RequestMapping(value = "/showComment" , method = RequestMethod.GET)
	public ModelAndView showMyComment(HttpServletRequest request ,HttpServletResponse response)
	{
		ModelAndView view = new ModelAndView("myComment");
		
		String error = "";
		String param = "";
		String result = "";
		
		UserInfo UserInfo = (UserInfo) request.getSession().getAttribute("rspUserBean");
		if(StringTools.isNullOrEmpty(UserInfo))
		{
			view = new ModelAndView("login");
			return view;
		}
		result = this.sendGet(Constants.url + "commentContro/querymybracommentlist/"+UserInfo.getUser_id()+"1.do", param);
		
		if(StringTools.isNullOrEmpty(result))
		{
			error = "<div class='alert alert-danger'>服务器异常，请稍后在尝试！</div>";
			request.setAttribute("error", error);
		}
		else
		{
			if(JsonUtil.getValue(result, "result").equals("0"))
			{
				RspBrandComBean rspBrandBean  = gson.fromJson(result, RspBrandComBean.class);
				Integer p = Integer.valueOf(rspBrandBean.getCount());
				Integer end = (int) Math.ceil(p / 10.0);
				
				for (int i = 2; i <= end; i++)
				{
					RspBrandComBean rspBrandBeans = new RspBrandComBean();
					result = this.sendGet(Constants.url + "commentContro/querymybracommentlist/"+UserInfo.getUser_id()+""+i+".do", param);
					rspBrandBeans = gson.fromJson(result, RspBrandComBean.class);
					
					rspBrandBean.getInfoList().addAll(rspBrandBeans.getInfoList());
				}
				
				
				request.getSession().setAttribute("rspMyCommentList", rspBrandBean.getInfoList());
				request.getSession().setAttribute("rspMyCommentListCom", rspBrandBean.getCount());
			}
			else
			{
				error = "<div class='alert alert-danger'>没有评论过</div>";
				request.setAttribute("error", error);
			}
		}
		
		
		
		return view;
	}
	
	
	/**
	 * 查询我的系统消息列表
	 * @Description:
	 * @param request
	 * @param response
	 * @return
	 * @version:v1.0
	 * @author:Chaos
	 * @date:2016年7月21日 下午2:46:11
	 */
	@SuppressWarnings("static-access")
	@RequestMapping(value = "/showMySysInfo" , method = RequestMethod.GET)
	public ModelAndView showMySysInfo(HttpServletRequest request , HttpServletResponse response)
	{
		ModelAndView view = new ModelAndView("mySysInfoList");
		
		String error = "";
		String param = "";
		String result = "";
		
		UserInfo UserInfo = (UserInfo) request.getSession().getAttribute("rspUserBean");
		if(StringTools.isNullOrEmpty(UserInfo))
		{
			view = new ModelAndView("login");
			return view;
		}
		
		//接口
		result = this.sendGet(Constants.url + "syscontro/querysysinfo/"+UserInfo.getUser_id()+"1.do", param);
		
		if(StringTools.isNullOrEmpty(result))
		{
			error = "<div class='alert alert-danger'>服务器异常，请稍后在尝试！</div>";
			request.setAttribute("error", error);
		}
		else
		{
			if(JsonUtil.getValue(result, "result").equals("0"))
			{
				RspSysInfoBean rspSysInfoBean  = gson.fromJson(result, RspSysInfoBean.class);
				Integer p = Integer.valueOf(rspSysInfoBean.getCount());
				Integer end = p;
				
				for (int i = 2; i <= end; i++)
				{
					RspSysInfoBean rspSysInfoBeans = new RspSysInfoBean();
					result = this.sendGet(Constants.url + "commentContro/querymybracommentlist/"+UserInfo.getUser_id()+""+i+".do", param);
					rspSysInfoBeans = gson.fromJson(result, RspSysInfoBean.class);
					
					rspSysInfoBean.getInfoList().addAll(rspSysInfoBeans.getInfoList());
				}
				
				
				request.getSession().setAttribute("rspSysInfoBeanList", rspSysInfoBean.getInfoList());
				request.getSession().setAttribute("rspSysInfoBeanListCom", rspSysInfoBean.getCount());
			}
			else
			{
				error = "<div class='alert alert-danger'>没有系统消息</div>";
				request.setAttribute("error", error);
			}
		}
		
		
		return view;
	}
	
	
	/**
	 * 查询消息详情
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/showSysInfo" , method = RequestMethod.GET)
	public ModelAndView showSysInfo(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView view = new ModelAndView();
		
		return view;
	}
	
	
	/**
	 * 显示修改密码页面
	 * @Description:
	 * @param request
	 * @param response
	 * @return
	 * @version:v1.0
	 * @author:Chaos
	 * @date:2016年7月21日 下午7:11:45
	 */
	@RequestMapping(value = "/showUpPwd" , method = RequestMethod.GET)
	public ModelAndView showUpPwd(HttpServletRequest request , HttpServletResponse response)
	{
		ModelAndView view = new ModelAndView();
		
		
		UserInfo UserInfo = (UserInfo) request.getSession().getAttribute("rspUserBean");
		if(StringTools.isNullOrEmpty(UserInfo))
		{
			view = new ModelAndView("login");
			return view;
		}
		
		
		return view;
	}
	
	
	/**
	 * 修改密码
	 * @Description:
	 * @param request
	 * @param response
	 * @return
	 * @version:v1.0
	 * @author:Chaos
	 * @date:2016年7月21日 下午7:13:33
	 */
	@RequestMapping(value = "/upPwd" , method = RequestMethod.POST)
	public ModelAndView upPwd(HttpServletRequest request , HttpServletResponse response)
	{
		ModelAndView view = new ModelAndView("home");
		
		String error = "";
		String param = "";
		String result = "";
		
		UserInfo UserInfo = (UserInfo) request.getSession().getAttribute("rspUserBean");
		if(StringTools.isNullOrEmpty(UserInfo))
		{
			view = new ModelAndView("login");
			return view;
		}
		
		String password = request.getParameter("password");
		String password1 = request.getParameter("password1");
		
		if(StringTools.isNullOrEmpty(password) || password.length() < 6 || StringTools.isNullOrEmpty(password1) || password1.length() < 6)
		{
			error = "<div class='alert alert-danger'>密码不正确请重新输入。</div>";
			if(!password.equals(password1))
			{
				error = "<div class='alert alert-danger'>密码不正确请重新输入。</div>";
			}
			request.setAttribute("password", "");
			request.setAttribute("password1", "");
			request.setAttribute("error", error);
			view = new ModelAndView("upPwd");
		}
		
		
		param = "{'reqInfo': {'user_id':'"+UserInfo.getUser_id()+"','oldPwd': '"+password+",'newPwd':'"+password1+"}}";
		result = this.sendPost(Constants.url + "usercontro/uptpwd/0.do", param);
		
		if(StringTools.isNullOrEmpty(result))
		{
			error = "<div class='alert alert-danger'>服务器异常，请稍后在尝试！</div>";
			request.setAttribute("error", error);
		}
		else
		{
			if(JsonUtil.getValue(result, "result").equals("0"))
			{
			}
			else
			{
				error = "<div class='alert alert-danger'>+"+JsonUtil.getValue(result, "errorInfo")+"+</div>";
				request.setAttribute("error", error);
			}
		}
		
		return view;
	}
	
	
	/**
	 * 显示添加反馈
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/showAddAgreed" , method = RequestMethod.GET)
	public ModelAndView showAddAgreed(HttpServletRequest request , HttpServletResponse response)
	{
		ModelAndView view = new ModelAndView("addAgreed");
		return view;
	}
	
	
	/**
	 * 添加反馈
	 * @param request
	 * @param response
	 * @return
	 */
	@SuppressWarnings("static-access")
	@RequestMapping(value = "/addAgreed" , method = RequestMethod.POST)
	public ModelAndView addAgreed(HttpServletRequest request , HttpServletResponse response)
	{
		ModelAndView view = new ModelAndView("home");
		
		String error = "";
		String param = "";
		String result = "";
		
		String com = request.getParameter("con");
		UserInfo UserInfo = (UserInfo) request.getSession().getAttribute("rspUserBean");
		if(StringTools.isNullOrEmpty(UserInfo))
		{
			view = new ModelAndView("login");
			return view;
		}
		
		if(!StringTools.isNullOrEmpty(com) && !StringTools.isNullOrEmpty(com.trim()))
		{
			param = "{'user_id':'"+UserInfo.getUser_id()+"','feed_con': '"+com.trim()+"'}";
			result = this.sendPost(Constants.url + "syscontro/addfeedinfo.do", param);
		}
		
		return view;
	}
	
	
	/**
	 * 查询我的收益情况
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/showMyIncome" , method = RequestMethod.GET)
	ModelAndView ShowMyIncome(HttpServletRequest request , HttpServletResponse response)
	{
		ModelAndView view = new ModelAndView("myIncome");
		
		UserInfo UserInfo = (UserInfo) request.getSession().getAttribute("rspUserBean");
		if(StringTools.isNullOrEmpty(UserInfo))
		{
			view = new ModelAndView("login");
			return view;
		}
		
		return view;
	}
	
	
	/**
     * 向指定URL发送GET方法的请求
     * 
     * @param url
     *            发送请求的URL
     * @param param
     *            请求参数，请求参数应该是 name1=value1&name2=value2 的形式。
     * @return URL 所代表远程资源的响应结果
     */
    public static String sendGet(String url, String param) {
        String result = "";
        BufferedReader in = null;
        try {
            String urlNameString = url + "?" + param;
            URL realUrl = new URL(urlNameString);
            // 打开和URL之间的连接
            URLConnection connection = realUrl.openConnection();
            // 设置通用的请求属性
            connection.setRequestProperty("accept", "*/*");
            connection.setRequestProperty("connection", "Keep-Alive");
            connection.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            // 建立实际的连接
            connection.connect();
            // 获取所有响应头字段
            Map<String, List<String>> map = connection.getHeaderFields();
            // 遍历所有的响应头字段
            for (String key : map.keySet()) {
                System.out.println(key + "--->" + map.get(key));
            }
            // 定义 BufferedReader输入流来读取URL的响应
            in = new BufferedReader(new InputStreamReader(
                    connection.getInputStream(),"utf-8"));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            System.out.println("发送GET请求出现异常！" + e);
            e.printStackTrace();
        }
        // 使用finally块来关闭输入流
        finally {
            try {
                if (in != null) {
                    in.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return result;
    }

    /**
     * 向指定 URL 发送POST方法的请求
     * 
     * @param url
     *            发送请求的 URL
     * @param param
     *            请求参数，请求参数应该是 name1=value1&name2=value2 的形式。
     * @return 所代表远程资源的响应结果
     */
    public static String sendPost(String url, String param) {
        PrintWriter out = null;
        BufferedReader in = null;
        String result = "";
        try {
            URL realUrl = new URL(url);
            // 打开和URL之间的连接
            URLConnection conn = realUrl.openConnection();
            // 设置通用的请求属性
            conn.setRequestProperty("accept", "*/*");
            conn.setRequestProperty("connection", "Keep-Alive");
            conn.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            // 发送POST请求必须设置如下两行
            conn.setDoOutput(true);
            conn.setDoInput(true);
            // 获取URLConnection对象对应的输出流
            out = new PrintWriter(conn.getOutputStream());
            // 发送请求参数
            out.print(param);
            // flush输出流的缓冲
            out.flush();
            // 定义BufferedReader输入流来读取URL的响应
            in = new BufferedReader(
                    new InputStreamReader(conn.getInputStream(),"utf-8"));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            System.out.println("发送 POST 请求出现异常！"+e);
            e.printStackTrace();
        }
        //使用finally块来关闭输出流、输入流
        finally{
            try{
                if(out!=null){
                    out.close();
                }
                if(in!=null){
                    in.close();
                }
            }
            catch(IOException ex){
                ex.printStackTrace();
            }
        }
        return result;
    }    
}
