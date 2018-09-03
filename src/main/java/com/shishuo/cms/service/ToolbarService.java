package com.shishuo.cms.service;

import com.shishuo.cms.dao.ToolbarDao;
import com.shishuo.cms.entity.Toolbar;
import com.shishuo.cms.util.MediaUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

/**
 * Created by GentleNi
 * Date 2018-05-20 15:47
 **/
@Service
public class ToolbarService {
    @Autowired
    ToolbarDao toolbarDao;

    public Toolbar getToolBarByAdminId(long adminId){
        Toolbar toolbar = toolbarDao.selectByPrimaryKey(adminId);
        return toolbar;
    }

    public int insrt(Toolbar toolbar){
        return toolbarDao.insert(toolbar);
    }

    public int update(long adminId, MultipartFile topbarFile, MultipartFile footbarFile,
                      int t_height,int t_width,int f_height,int f_width) throws IOException {
        String topbarImg = toolbarDao.selectByPrimaryKey(adminId).getTopbar();
        String footbarImg = toolbarDao.selectByPrimaryKey(adminId).getFootbar();
        Toolbar toolbar = new Toolbar();
        toolbar.setAdminid(adminId);
        toolbar.settHeight(t_height);
        toolbar.settWidth(t_width);
        toolbar.setfHeight(f_height);
        toolbar.setfWidth(f_width);
        if (topbarFile != null && !topbarFile.isEmpty()) {
            //修改也保存原图
            try {
                topbarImg = MediaUtils.saveImage(topbarFile,0,0);
                toolbar.setTopbar(topbarImg);
                String ratio = MediaUtils.getRatio2(topbarImg);
                //保存
                toolbar.settRatio(ratio);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (footbarFile != null && !footbarFile.isEmpty()) {

            try {
                //保存
                footbarImg = MediaUtils.saveImage(footbarFile,0,0);
                toolbar.setFootbar(footbarImg);
                String ratio = MediaUtils.getRatio2(footbarImg);
                toolbar.setfRatio(ratio);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return toolbarDao.updateByPrimaryKeySelective(toolbar);
    }

}
