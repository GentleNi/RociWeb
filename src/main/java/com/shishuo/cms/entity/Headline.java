package com.shishuo.cms.entity;

import java.util.Date;

public class Headline {
    private Long headlineId;

    private String name;

    private String ename;

    private String picture;

    private Integer height;

    private Integer width;

    private String ratio;

    private String url;

    private Byte sort;

    private Date createtime;

    public Headline(Long headlineId, String name, String ename, String picture, Integer height, Integer width, String ratio,
                    String url, Byte sort, Date createtime) {
        this.headlineId = headlineId;
        this.name = name;
        this.ename = ename;
        this.picture = picture;
        this.height = height;
        this.width = width;
        this.ratio = ratio;
        this.url = url;
        this.sort = sort;
        this.createtime = createtime;
    }

    public Headline() {
        super();
    }

    public Long getHeadlineId() {
        return headlineId;
    }

    public void setHeadlineId(Long headlineId) {
        this.headlineId = headlineId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename == null ? null : ename.trim();
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture == null ? null : picture.trim();
    }

    public Integer getHeight() {
        return height;
    }

    public void setHeight(Integer height) {
        this.height = height;
    }

    public Integer getWidth() {
        return width;
    }

    public void setWidth(Integer width) {
        this.width = width;
    }

    public String getRatio() {
        return ratio;
    }

    public void setRatio(String ratio) {
        this.ratio = ratio;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public Byte getSort() {
        return sort;
    }

    public void setSort(Byte sort) {
        this.sort = sort;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    @Override
    public String toString() {
        return "Headline{" +
                "headlineId=" + headlineId +
                ", name='" + name + '\'' +
                ", ename='" + ename + '\'' +
                ", picture='" + picture + '\'' +
                ", height=" + height +
                ", width=" + width +
                ", url='" + url + '\'' +
                ", sort=" + sort +
                ", createtime=" + createtime +
                '}';
    }
}