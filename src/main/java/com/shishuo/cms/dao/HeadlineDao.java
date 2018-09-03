package com.shishuo.cms.dao;

import com.shishuo.cms.entity.Headline;
import com.shishuo.cms.entity.vo.HeadlineVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface HeadlineDao {
    int deleteByPrimaryKey(Long headlineId);

    int insert(Headline record);

    int insertSelective(Headline record);

    Headline selectByPrimaryKey(Long headlineId);

    int updateByPrimaryKeySelective(Headline record);

    int updateByPrimaryKey(Headline record);

    int addHeadline(Headline headline);

    List<HeadlineVo> getHeadlineList();

    HeadlineVo getHeadlineById(@Param("headlineId") long headlineId);

    int deleteHeadline(@Param("headlineId") long headlineId);

    int updateHeadlineById(@Param("headlineId") long headlineId,
                                  @Param("name") String name,@Param("ename") String ename,
                                  @Param("height") int height,@Param("width") int width,@Param("ratio") String ratio,
                                  @Param("picture") String picture, @Param("url") String url);

    void updateSortById(@Param("headlineId") long headlineId,
                               @Param("sort") int sort);
}