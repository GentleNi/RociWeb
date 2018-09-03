/*
 *	Copyright © 2013 Changsha Shishuo Network Technology Co., Ltd. All rights reserved.
 *	长沙市师说网络科技有限公司 版权所有
 *	http://www.shishuo.com
 */

package com.shishuo.cms.action;

import com.shishuo.cms.entity.Toolbar;
import com.shishuo.cms.entity.vo.HeadlineVo;
import com.shishuo.cms.entity.vo.JsonVo;
import com.shishuo.cms.service.TemplateService;
import com.shishuo.cms.util.ChangeLanguageUtils;
import com.shishuo.cms.util.MediaUtils;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import com.shishuo.cms.exception.TemplateNotFoundException;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

/**
 * 首页
 * 
 * @author Herbert
 */
@Controller
public class IndexAction extends BaseAction {

	//private
	/**
	 * 首页
	 * 
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String defalut(@RequestParam(value = "p", defaultValue = "1") long p,
						  ModelMap modelMap,
						  HttpServletRequest request,
						  HttpSession session) {
		ChangeLanguageUtils.initLanguage(request,session);
		return home(p, modelMap,request);
	}


	@RequestMapping(value = "/change_lan")
	public String changeLan (HttpServletRequest request,HttpSession session){
		ChangeLanguageUtils.handleLanguage(session,request);
		return "redirect:/";
	}

	/**
	 * 首页
	 * 
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "/index.htm", method = RequestMethod.GET)
	public String home(@RequestParam(value = "p", defaultValue = "1") long p,
			ModelMap modelMap,HttpServletRequest request) {
		try {
			List<HeadlineVo> headlineList = headlineService.getHeadlineList();
			Toolbar toolbar  = toolbarService.getToolBarByAdminId(1);
			modelMap.addAttribute("toolbar",toolbar);
			modelMap.addAttribute("headlineList",headlineList);
			modelMap.addAttribute("p", p);
			modelMap.addAttribute("g_folderId", 0);
			return themeService.getDefaultTemplate();
		} catch (TemplateNotFoundException e) {
			modelMap.addAttribute("g_folderId", 0);
			logger.fatal(e.getMessage());
			return themeService.get404();
		}
	}


	/**
	 * 404
	 * 
	 * @return
	 */
	@RequestMapping(value = "/404.htm", method = RequestMethod.GET)
	public String pageNotFound(ModelMap modelMap) {
		modelMap.addAttribute("g_folderId", 0);
		return themeService.get404();
	}

	/**
	 * 500
	 * 
	 * @return
	 */
	@RequestMapping(value = "/500.htm", method = RequestMethod.GET)
	public String error(ModelMap modelMap) {
		modelMap.addAttribute("g_folderId", 0);
		return themeService.get500();
	}
}
