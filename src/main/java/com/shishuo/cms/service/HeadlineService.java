package com.shishuo.cms.service;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.coobird.thumbnailator.Thumbnails;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.shishuo.cms.dao.HeadlineDao;
import com.shishuo.cms.entity.Headline;
import com.shishuo.cms.entity.vo.HeadlineVo;
import com.shishuo.cms.exception.UploadException;
import com.shishuo.cms.util.MediaUtils;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.imageio.ImageIO;

@Service
public class HeadlineService {

	@Autowired
	private HeadlineDao headlineDao;

	@Autowired
	private ConfigService configService;

	public Headline addHeadline(MultipartFile file, String name,String ename,
								int height,int width, String url) throws UploadException, IOException {
		Headline headline = new Headline();
		//保存原图
		String ratio = null;
		String picture = null;
		if (file != null && !file.isEmpty()) {
			picture = MediaUtils.saveImage(file,0,0);
			//修改也保存原图
			try {
				ratio = MediaUtils.getRatio2(picture);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		headline.setName(name);
		headline.setEname(ename);
		headline.setHeight(height);
		headline.setWidth(width);
		headline.setRatio(String.valueOf(ratio));
		headline.setPicture(picture);
		headline.setUrl(url);
		headline.setSort((byte) 0);
		headline.setCreatetime(new Date());
		headlineDao.addHeadline(headline);
		return headline;
	}

	public List<HeadlineVo> getHeadlineList() {
		List<HeadlineVo> headlineList = headlineDao.getHeadlineList();
		return headlineList;
	}

	public int updateHeadlineById(long headlineId, String name,String ename,int height,int width,
			MultipartFile file, String url) throws UploadException, IOException {
		String picture = this.getHeadlineById(headlineId).getPicture();
		String ratio = null;
		if (file != null && !file.isEmpty()) {
			picture = MediaUtils.saveImage(file,0,0);
			//修改也保存原图
			try {
				ratio = MediaUtils.getRatio2(picture);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return headlineDao.updateHeadlineById(headlineId, name,ename,height,width, ratio,picture, url);
	}

	public HeadlineVo getHeadlineById(long headlineId) {
		return headlineDao.getHeadlineById(headlineId);
	}

	public void deleteHeadline(long headlineId, String pictureUrl) {
		MediaUtils.deleteFile(pictureUrl);
		headlineDao.deleteHeadline(headlineId);
	}

	public void updateSortById(long headlineId, int sort) {
		headlineDao.updateSortById(headlineId, sort);
	}




}
