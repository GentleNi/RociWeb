/*
 *	Copyright © 2013 Changsha Shishuo Network Technology Co., Ltd. All rights reserved.
 *	长沙市师说网络科技有限公司 版权所有
 *	http://www.shishuo.com
 */

package com.shishuo.cms.service;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.shishuo.cms.dao.MediaDao;
import com.shishuo.cms.entity.Media;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.shishuo.cms.constant.ArticleConstant;
import com.shishuo.cms.constant.FolderConstant;
import com.shishuo.cms.dao.ArticleDao;
import com.shishuo.cms.entity.Article;
import com.shishuo.cms.entity.Folder;
import com.shishuo.cms.entity.vo.ArticleVo;
import com.shishuo.cms.entity.vo.FolderVo;
import com.shishuo.cms.entity.vo.PageVo;
import com.shishuo.cms.exception.ArticleNotFoundException;
import com.shishuo.cms.exception.FolderNotFoundException;
import com.shishuo.cms.exception.UploadException;
import com.shishuo.cms.util.MediaUtils;

/**
 * 
 * 文章服务
 * 
 * @author Zhangjiale
 * 
 */
@Service
public class ArticleService {

	@Autowired
	private ArticleDao articleDao;

	@Autowired
	private MediaDao mediaDao;
	@Autowired
	private AdminService adminService;

	@Autowired
	private FolderService folderService;

	@Autowired
	private MediaService attachmentService;

	// ///////////////////////////////
	// ///// 增加 ////////
	// ///////////////////////////////

	/**
	 * @param folderId
	 * @param adminId
	 * @param etitle
	 * @param status
	 * @param content
	 * @param createTime
	 * @return
	 * @throws FolderNotFoundException
	 * @throws UploadException
	 * @throws IOException
	 */
	@CacheEvict(value = "article", allEntries = true)
	public Article addArticle(long folderId,long adminId, String headlineId,String title,String etitle,
                              String summary, ArticleConstant.Status status,
			ArticleConstant.Login login, String content,String econtent,
			MultipartFile[] file, String createTime)
			throws FolderNotFoundException, UploadException,
			IOException {
		FolderVo folder = folderService.getFolderById(folderId);
		Article article = new Article();
		Date now = new Date();
		String picture = "";
/*			if (file[1] != null && !file[1].isEmpty()) {
			picture = MediaUtils.saveImage(file[1], folder.getWidth(),
					folder.getHeight());
		}*/
		if (folder.getCheck().equals(FolderConstant.check.yes)) {
			article.setCheck(ArticleConstant.check.init);
		} else {
			article.setCheck(ArticleConstant.check.yes);
		}
		article.setFolderId(folder.getFolderId());
		//头图和文章对应
		article.setPath(headlineId);
		article.setAdminId(adminId);
		article.setTitle(title);
		article.setEtitle(etitle);
		article.setSummary(summary);
		article.setContent(content);
		article.setEcontent(econtent);
		article.setViewCount(0);
		article.setCommentCount(0);
		article.setPicture(picture);
		article.setStatus(status);
		article.setLogin(login);
		if (StringUtils.isBlank(createTime)) {
			article.setCreateTime(now);
		} else {
			SimpleDateFormat sdf = new SimpleDateFormat(
					"yyyy-MM-dd");
			Date date;
			try {
				date = sdf.parse(createTime);
			} catch (ParseException e) {
				date = now;
			}
			article.setCreateTime(date);
		}
		article.setUpdateTime(now);
		articleDao.addArticle(article);
		return articleDao.getArticleById(article.getArticleId());
	}

	// ///////////////////////////////
	// ///// 刪除 ////////
	// ///////////////////////////////

	/**
	 * 删除文件
	 * 

	 * @return boolean
	 */
	@CacheEvict(value = "article", allEntries = true)
	public boolean deleteArticleById(long articleId) {
		return articleDao.deleteArticleById(articleId);
	}

	// ///////////////////////////////
	// ///// 修改 ////////
	// ///////////////////////////////

	/**
	 * 修改文件
	 * 

	 * @return
	 * @throws UploadException
	 * @throws ParseException
	 * @throws IOException
	 * @throws FolderNotFoundException 
	 */
	@CacheEvict(value = "article", allEntries = true)
	public Article updateArticle(long articleId, long folderId,
			long adminId, String headlineId, String title,String etitle,String summary,
			String content,String econtent, ArticleConstant.Status status,
			ArticleConstant.Login login, MultipartFile[] file,
			String time) throws UploadException, IOException, FolderNotFoundException {
		Date now = new Date();
		Article article = articleDao.getArticleById(articleId);
		FolderVo folder = folderService.getFolderById(folderId);
		String picture = article.getPicture();

/*		if (file != null && !file.isEmpty()) {
			picture = MediaUtils.saveImage(file, folder.getWidth(),
					folder.getHeight());
		}*/
		article.setFolderId(folder.getFolderId());
		article.setPath(headlineId);
		article.setAdminId(adminId);
		article.setTitle(title);
		article.setEtitle(etitle);
		article.setSummary(summary);
		article.setContent(content);
		article.setEcontent(econtent);
		article.setViewCount(0);
		article.setCommentCount(0);
		article.setPicture(picture);
		article.setStatus(status);
		article.setLogin(login);
		if (article.getCheck().equals(ArticleConstant.check.no)) {
			article.setCheck(ArticleConstant.check.init);
		}
		if (StringUtils.isBlank(time)) {
			article.setUpdateTime(now);
		} else {
			SimpleDateFormat sdf = new SimpleDateFormat(
					"yyyy-MM-dd");
			Date date;
			try {
				date = sdf.parse(time);
			} catch (ParseException e) {
				date = now;
			}
			article.setUpdateTime(date);
		}
		articleDao.updateArticle(article);
		return article;
	}

	/**
	 * 更新浏览人数
	 *
	 * 
	 */
	public void updateViewCount(long articleId, int nowViewCount) {
		articleDao.updateViewCount(articleId, nowViewCount + 1);
	}

	// ///////////////////////////////
	// ///// 查詢 ////////
	// ///////////////////////////////

	/**
	 * 得到文件
	 *
	 * @return File
	 * @throws ArticleNotFoundException
	 */
	@Cacheable(value = "article", key = "'getArticleById_'+#articleId")
	public ArticleVo getArticleById(long articleId)
			throws ArticleNotFoundException {
		ArticleVo articleVo = articleDao.getArticleById(articleId);
		if (articleVo == null) {
			throw new ArticleNotFoundException(articleId
					+ " 文件，不存在");
		} else {
			return articleVo;
		}
	}

	/**
	 * 得到目录的显示的文件分页
	 * 
	 * @param folderId
	 * @return pageVo
	 * @throws FolderNotFoundException
	 */
	@Cacheable(value = "article")
	public PageVo<ArticleVo> getArticlePageByFolderId(long folderId,
			int pageNum, int rows) throws FolderNotFoundException {
		PageVo<ArticleVo> pageVo = new PageVo<ArticleVo>(pageNum);
		FolderVo folder = folderService.getFolderById(folderId);
		pageVo.setRows(rows);
		pageVo.setCount(articleDao
				.getArticleCountOfDisplayByPath(folder
						.getPath()));
		List<ArticleVo> articlelist = articleDao
				.getArticleListOfDisplayByPath(
						folder.getPath(),
						pageVo.getOffset(),
						pageVo.getRows());
		for (ArticleVo artcle : articlelist) {
			FolderVo artcleFolder = folderService
					.getFolderById(artcle.getFolderId());
			artcle.setFolder(artcleFolder);
		}
		pageVo.setList(articlelist);
		return pageVo;
	}

	/**
	 * 获取某种文件的分页
	 *
	 * @param pageNum
	 * @return PageVo<File>
	 * @throws FolderNotFoundException
	 * 
	 */
	public PageVo<ArticleVo> getArticlePageByFolderId(long adminId,
			long folderId, ArticleConstant.check check, int pageNum)
			throws FolderNotFoundException {
		PageVo<ArticleVo> pageVo = new PageVo<ArticleVo>(pageNum);
		pageVo.setRows(20);
		List<ArticleVo> list;
		int count = 0;
		if (folderId == 0) {
			count = this.getArticleCountByAdminIdAndFolderId(
					adminId, 0, check);
			list = this.getArticleListByAdminIdAndFolderId(adminId,
					0, check, pageVo.getOffset(),
					pageVo.getRows());
		} else {
			list = this.getArticleListByAdminIdAndFolderId(adminId,
					folderId, check, pageVo.getOffset(),
					pageVo.getRows());
			count = this.getArticleCountByAdminIdAndFolderId(
					adminId, folderId, check);
		}
		for (ArticleVo article : list) {
			try {
				article.setFolder(folderService
						.getFolderById(article
								.getFolderId()));
				article.setFolderPathList(folderService
						.getFolderPathListByFolderId(article
								.getFolderId()));
			} catch (FolderNotFoundException e) {
				article.setFolder(new Folder());
			}
		}
		pageVo.setList(list);
		pageVo.setCount(count);
		return pageVo;
	}

	/**
	 * @param adminId
	 * @param folderId
	 * @param offset
	 * @param rows
	 * @return
	 * @throws FolderNotFoundException
	 */
	public List<ArticleVo> getArticleListByAdminIdAndFolderId(long adminId,
			long folderId, ArticleConstant.check check,
			long offset, long rows) throws FolderNotFoundException {
		String path = "";
/*
		if (folderId != 0) {
			Folder folder = folderService.getFolderById(folderId);
			path = folder.getPath();
		}
		List<ArticleVo> articleList = articleDao.getArticleListByAdminIdAndPath(adminId, path,check, offset, rows);*/
        //不使用Path搜索
		List<ArticleVo> articleList = articleDao.getArticleListByAdminIdAndFolderId(adminId, folderId,check, offset, rows);
		return articleList;
	}

	/**
	 * @param adminId
	 * @param folderId
	 * @return
	 * @throws FolderNotFoundException
	 */
	public int getArticleCountByAdminIdAndFolderId(long adminId,
			long folderId, ArticleConstant.check check)
			throws FolderNotFoundException {
		String path = "";
		if (folderId != 0) {
			Folder folder = folderService.getFolderById(folderId);
			path = folder.getPath();
		}
		return articleDao.getArticleCountByAdminIdAndPath(adminId,
				path, check);
	}

	/**
	 * @param folderId
	 * @return
	 * @throws FolderNotFoundException
	 */
	public int getArticleCountByFolderId(long folderId)
			throws FolderNotFoundException {
		return articleDao.getArticleCountByFolderId(folderId);
	}

	@CacheEvict(value = "article", allEntries = true)
	public void updateCheck(long articleId,
			com.shishuo.cms.constant.ArticleConstant.check check) {
		articleDao.updateCheck(articleId, check);
	}

	/**
	 * @param path
	 * @param offset
	 * @param rows
	 * @return
	 */
	public List<ArticleVo> getArticleListOfDisplayByPath(String path,
			int offset, int rows) {
		List<ArticleVo> articlelist = articleDao
				.getArticleListOfDisplayByPath(path, offset,
						rows);
		return articlelist;
	}

	/**
	 * 根据标题查找文章
	 * @param title
	 * @return
	 */
	public Article getArticleByTitle(String title){
		return articleDao.getArticleByTitle(title);
	}

	/**
	 * 根据headlineId查找文章
	 * @return
	 */
	public Article getArticleByHeadlineId(String headlineId){
		return articleDao.getArticleByHeadlineId(headlineId);
	}

	public List<Article> getArticleByFolderId(long folderId){
	    return articleDao.getArticleListByFolderId(folderId);
	}

}
