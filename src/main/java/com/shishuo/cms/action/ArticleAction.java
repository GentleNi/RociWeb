/*
 *	Copyright © 2013 Changsha Shishuo Network Technology Co., Ltd. All rights reserved.
 *	长沙市师说网络科技有限公司 版权所有
 *	http://www.shishuo.com
 */

package com.shishuo.cms.action;

import com.shishuo.cms.entity.Article;
import com.shishuo.cms.entity.Media;
import com.shishuo.cms.entity.Toolbar;
import com.shishuo.cms.entity.vo.HeadlineVo;
import com.shishuo.cms.util.ChangeLanguageUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import com.shishuo.cms.entity.Folder;
import com.shishuo.cms.entity.vo.ArticleVo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author Herbert
 * 
 */
@Controller
@RequestMapping("/article")
public class ArticleAction extends BaseAction {

	@RequestMapping(value = "/{articleId}.htm", method = RequestMethod.GET)
	public String article(@PathVariable long articleId,
			@RequestParam(value = "p", defaultValue = "1") long p,
			ModelMap modelMap) {
		try {
			ArticleVo article = fileService.getArticleById(articleId);
			Folder folder = folderService.getFolderById(article.getFolderId());
			modelMap.addAttribute("p", p);
			modelMap.addAttribute("folder", folder);
			modelMap.addAttribute("article", article);
			modelMap.addAttribute("g_folderId", folderService.firstFolderId(folder.getFolderId()));
			return themeService.getArticleTemplate(article.getFolderId(),
					articleId);
		} catch (Exception e) {
			modelMap.addAttribute("g_folderId", 0);
			return themeService.get404();
		}
	}

	@RequestMapping(value = "/change_lan/{headlineId}")
	public String changeLan (@PathVariable String headlineId, HttpSession session, HttpServletRequest request){
		ChangeLanguageUtils.handleLanguage(session,request);
		return "redirect:/article/"+headlineId;
	}

	@RequestMapping(value = "/change_lan/works")
	public String changeWorksLan ( HttpSession session, HttpServletRequest request){
		ChangeLanguageUtils.handleLanguage(session,request);
		return "redirect:/article/works";
	}

	@RequestMapping(value = "/change_lan/about")
	public String changeAboutLan (HttpSession session, HttpServletRequest request){
		ChangeLanguageUtils.handleLanguage(session,request);
		return "redirect:/article/about";
	}

	@RequestMapping(value = "/change_lan/news")
	public String changeNewsLan (HttpSession session, HttpServletRequest request){
		ChangeLanguageUtils.handleLanguage(session,request);
		return "redirect:/article/news";
	}
	/**
	 * 根据文章title获取文章
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("/{headlineId}")
	public String article(@PathVariable String headlineId,ModelMap modelMap,
						  HttpServletRequest request,HttpSession session) {
		try {
			ChangeLanguageUtils.initLanguage(request,session);
			Toolbar toolbar  = toolbarService.getToolBarByAdminId(1);
			modelMap.addAttribute("toolbar",toolbar);
			Article article = fileService.getArticleByHeadlineId(headlineId);
			if(article == null){
				return themeService.getTemplatePath("noproduct");
			}
			List<Media> mediaList = mediaService.getMediaListByArticleId(article.getArticleId());
			modelMap.addAttribute("article", article);
			modelMap.addAttribute("mediaList", mediaList);
			return themeService.getTemplatePath("workItem");
		}catch (Exception e) {
			return themeService.get404();
		}
	}

	@RequestMapping(value = "/about")
	public String about(ModelMap modelMap ,HttpServletRequest request, HttpSession session) {
		try {
			ChangeLanguageUtils.initLanguage(request,session);
			Toolbar toolbar  = toolbarService.getToolBarByAdminId(1);
			Folder folder = folderService.getFolderByEname("about");
			modelMap.addAttribute("toolbar",toolbar);
			modelMap.addAttribute("folder",folder);
			return themeService.getTemplatePath("about");
		}catch (Exception e) {
			return themeService.get404();
		}
	}

	@RequestMapping(value = "/works")
	public String works(ModelMap modelMap,HttpServletRequest request, HttpSession session) {
		try {
			ChangeLanguageUtils.initLanguage(request,session);
			Toolbar toolbar  = toolbarService.getToolBarByAdminId(1);
			List<HeadlineVo> headlineList = headlineService.getHeadlineList();
			modelMap.addAttribute("toolbar",toolbar);
			modelMap.addAttribute("headlineList", headlineList);
			return themeService.getTemplatePath("works");
		}catch (Exception e) {
			return themeService.get404();
		}
	}

	@RequestMapping(value = "/news")
	public String news(@RequestParam (value = "folderId",defaultValue = "3")long folderId,ModelMap modelMap,
					   HttpServletRequest request, HttpSession session) {
		try {
			ChangeLanguageUtils.initLanguage(request,session);
			Toolbar toolbar  = toolbarService.getToolBarByAdminId(1);
			List<Article> articleList = fileService.getArticleByFolderId(folderId);
			modelMap.addAttribute("toolbar",toolbar);
			modelMap.addAttribute("newsList", articleList);
			return themeService.getTemplatePath("news");
		}catch (Exception e) {
			e.printStackTrace();
			return themeService.get404();
		}
	}
}
