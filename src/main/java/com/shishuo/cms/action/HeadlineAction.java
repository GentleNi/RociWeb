package com.shishuo.cms.action;

import com.shishuo.cms.action.BaseAction;
import com.shishuo.cms.entity.vo.HeadlineVo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by GentleNi
 * Date 2018-04-13 10:26
 **/

@RequestMapping("/headline")
public class HeadlineAction extends BaseAction {

    @RequestMapping(value = "/list", method = RequestMethod.POST)
    @ResponseBody
    public List<HeadlineVo> list() {
        return headlineService.getHeadlineList();
    }

}
