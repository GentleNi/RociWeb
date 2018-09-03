package com.shishuo.cms.action.manage;

import com.shishuo.cms.action.BaseAction;
import com.shishuo.cms.entity.Media;
import com.shishuo.cms.entity.vo.HeadlineVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by GentleNi
 * Date 2018-04-13 10:52
 **/
@Controller
@RequestMapping("/media")
public class MediaAction extends BaseAction {

    @RequestMapping( method = RequestMethod.POST)
    @ResponseBody
    public List<Media> list(String name) {
        return mediaService.getMediaListByName(name);
    }
}
