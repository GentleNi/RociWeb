package com.shishuo.cms.action.manage;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

import javax.imageio.ImageIO;
import javax.jws.WebParam;
import javax.servlet.http.HttpServletRequest;

import com.shishuo.cms.entity.Admin;
import com.shishuo.cms.entity.Article;
import com.shishuo.cms.entity.Media;
import com.shishuo.cms.service.MediaService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.shishuo.cms.entity.Headline;
import com.shishuo.cms.entity.vo.HeadlineVo;
import com.shishuo.cms.entity.vo.JsonVo;
import com.shishuo.cms.exception.UploadException;
import com.shishuo.cms.util.SSUtils;

@RequestMapping("/manage/headline")
@Controller
public class ManageHeadlineAction extends ManageBaseAction {

	@Autowired
	private MediaService mediaService;

	@RequestMapping(value = "/list.htm", method = RequestMethod.GET)
	public String list(ModelMap modelMap, HttpServletRequest request) {
		List<HeadlineVo> headlineList = headlineService.getHeadlineList();
		modelMap.put("headlineList", headlineList);
		return "manage/headline/list";
	}

	@RequestMapping("add_by_headline/{headlineId}")
	public String addArticleByHeadline(HttpServletRequest request,
									   ModelMap modelMap,
									   @PathVariable String headlineId,
									   @RequestParam(value = "folderId", defaultValue = "0") long folderId){
		Admin admin = this.getAdmin(request);
		//article的Path 是 headline 的Id
		Article article = articleService.getArticleByHeadlineId(headlineId);
		if(article == null){
			modelMap.put("folderAll", folderService.getAllFolderList(admin.getAdminId()));
			modelMap.put("folderId", folderId);
			modelMap.put("headlineId", headlineId);
			modelMap.put("JSESSIONID", request.getSession().getId());
			return "manage/article/add";
		}else{
			//
			long articleId = article.getArticleId();
			List<Media> mediaList = mediaService.getMediaListByArticleId(articleId);
			modelMap.put("mediaList",mediaList);
			modelMap.put("folderAll", folderService.getAllFolderList(admin.getAdminId()));
			modelMap.put("folderId", folderId);
			modelMap.put("JSESSIONID", request.getSession().getId());
			modelMap.put("headlineId", headlineId);
			modelMap.addAttribute("article",article);
			return "manage/article/update";
		}
	}

	@RequestMapping(value = "/add.htm", method = RequestMethod.GET)
	public String add(ModelMap modelMap, HttpServletRequest request) {
		int width = configService.getIntKey("shishuo_headline_image_width");
		int height = configService.getIntKey("shishuo_headline_image_height");
		modelMap.put("width", width);
		modelMap.put("height", height);
		return "manage/headline/add";
	}

	@RequestMapping(value = "/update.htm", method = RequestMethod.GET)
	public String update(@RequestParam(value = "headlineId") long headlineId,
			ModelMap modelMap, HttpServletRequest request) {
		Headline headline = headlineService.getHeadlineById(headlineId);
		modelMap.put("headline", headline);
		return "manage/headline/update";
	}

	@ResponseBody
	@RequestMapping(value = "/add.json", method = RequestMethod.POST)
	public JsonVo<String> upload(
			@RequestParam(value = "file") MultipartFile file,
			@RequestParam(value = "name") String name,
			@RequestParam(value = "ename") String ename,
			@RequestParam(value = "height",required = false) int height,
			@RequestParam(value = "width",required = false) int width,
			@RequestParam(value = "url") String url, HttpServletRequest request) {
		JsonVo<String> json = new JsonVo<String>();
		System.out.println("老子心态崩了");
		try {
			headlineService.addHeadline(file, SSUtils.toText(name),SSUtils.toText(ename),height,width, SSUtils.toText(url));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (UploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		json.setResult(true);
		return json;
	}

	@ResponseBody
	@RequestMapping(value = "/update.json", method = RequestMethod.POST)
	public JsonVo<String> update(
			@RequestParam(value = "headlineId") long headlineId,
			@RequestParam(value = "name") String name,
			@RequestParam(value = "ename") String ename,
			@RequestParam(value = "height",required = false) int height,
			@RequestParam(value = "width",required = false) int width,
			@RequestParam(value = "url") String url,
			@RequestParam(value = "file",required = false) MultipartFile file,
			HttpServletRequest request) {
		JsonVo<String> json = new JsonVo<String>();
		System.out.println("老子心态崩了啊啊啊啊");
		try {
			headlineService.updateHeadlineById(headlineId,
					SSUtils.toText(name),SSUtils.toText(ename),height,width,file, SSUtils.toText(url));
			articleService.getArticleByTitle(name);

		} catch (UploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		json.setResult(true);
		return json;
	}

	@ResponseBody
	@RequestMapping(value = "/delete.json", method = RequestMethod.POST)
	public JsonVo<String> deleteFile(
			@RequestParam(value = "headlineId") long headlineId) {
		JsonVo<String> json = new JsonVo<String>();
		HeadlineVo headline = headlineService.getHeadlineById(headlineId);
		headlineService.deleteHeadline(headlineId, headline.getPicture());
		Article article = articleService.getArticleByHeadlineId(String.valueOf(headlineId));
		if(article !=null){
			long articleId = article.getArticleId();
			// 删除文章
			articleService.deleteArticleById(articleId);
			//删除文章相关的Media
			List<Media> mediaList = attachmentService.getMediaListByArticleId(articleId);
			for(Media media : mediaList){
				attachmentService.deleteMedia(media.getMediaId(), media.getPath());
			}
		}
		json.setResult(true);
		return json;
	}

	/**
	 * @author 目录排序
	 * 
	 */
	@ResponseBody
	@RequestMapping(value = "/sort.json", method = RequestMethod.POST)
	public JsonVo<String> sort(@RequestParam(value = "sortJson") String sortJson) {
		JsonVo<String> json = new JsonVo<String>();
		JSONArray array = JSONArray.fromObject(sortJson);
		for (int i = 0; i < array.size(); i++) {
			JSONObject headline = array.getJSONObject(i);
			String headlineId = headline.get("headlineId").toString();
			String sort = headline.get("sort").toString();
			headlineService.updateSortById(Long.parseLong(headlineId),
					Integer.parseInt(sort));
		}
		json.setResult(true);
		return json;
	}
}
