package com.shishuo.cms.dao;

import com.shishuo.cms.entity.Toolbar;

public interface ToolbarDao {
    int deleteByPrimaryKey(Long adminid);

    int insert(Toolbar record);

    int insertSelective(Toolbar record);

    Toolbar selectByPrimaryKey(Long adminid);

    int updateByPrimaryKeySelective(Toolbar record);

    int updateByPrimaryKey(Toolbar record);
}