package com.shishuo.cms.action.manage;

import com.shishuo.cms.action.BaseAction;
import com.shishuo.cms.entity.Toolbar;
import com.shishuo.cms.entity.vo.JsonVo;
import com.shishuo.cms.service.ToolbarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * Created by GentleNi
 * Date 2018-05-20 15:44
 **/
@Controller
@RequestMapping("/manage/toolbar")
public class ManageToolbarAction extends BaseAction {

    @Autowired
    ToolbarService toolbarService;

    @RequestMapping(value = "/update.htm", method = RequestMethod.GET)
    public String update(@RequestParam(value = "adminId",defaultValue = "1") long adminId,
                         ModelMap modelMap, HttpServletRequest request) {
        Toolbar toolbar = toolbarService.getToolBarByAdminId(adminId);
        if(toolbar == null){
            Toolbar bar = new Toolbar();
            bar.setAdminid((long) 1);
            toolbarService.insrt(bar);
        }
        modelMap.put("toolbar", toolbar);
        return "manage/toolbar/update";
    }

    @ResponseBody
    @RequestMapping(value = "/update.json", method = RequestMethod.POST)
    public JsonVo<String> update(
            @RequestParam(value = "topbar", required = false) MultipartFile topbar,
            @RequestParam(value = "footbar", required = false) MultipartFile footbar,
            @RequestParam(value = "t_height", required = false) int t_height,
            @RequestParam(value = "t_width", required = false) int t_width,
            @RequestParam(value = "f_height", required = false) int f_height,
            @RequestParam(value = "f_width", required = false) int f_width,
            HttpServletRequest request) {
        JsonVo<String> json = new JsonVo<String>();
        try {
            toolbarService.update(1,topbar,footbar,t_height,t_width,f_height,f_width);
        }  catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        json.setResult(true);
        return json;
    }
}
