package com.shishuo.cms.entity;

public class Toolbar {
    private Long adminid;

    private String topbar;

    private String footbar;

    private Integer tHeight;

    private Integer tWidth;

    private Integer fHeight;

    private Integer fWidth;

    private String tRatio;

    private String fRatio;

    public Toolbar(Long adminid, String topbar, String footbar, Integer tHeight, Integer tWidth, Integer fHeight, Integer fWidth, String tRatio, String fRatio) {
        this.adminid = adminid;
        this.topbar = topbar;
        this.footbar = footbar;
        this.tHeight = tHeight;
        this.tWidth = tWidth;
        this.fHeight = fHeight;
        this.fWidth = fWidth;
        this.tRatio = tRatio;
        this.fRatio = fRatio;
    }

    public Toolbar() {
        super();
    }

    public Long getAdminid() {
        return adminid;
    }

    public void setAdminid(Long adminid) {
        this.adminid = adminid;
    }

    public String getTopbar() {
        return topbar;
    }

    public void setTopbar(String topbar) {
        this.topbar = topbar == null ? null : topbar.trim();
    }

    public String getFootbar() {
        return footbar;
    }

    public void setFootbar(String footbar) {
        this.footbar = footbar == null ? null : footbar.trim();
    }

    public Integer gettHeight() {
        return tHeight;
    }

    public void settHeight(Integer tHeight) {
        this.tHeight = tHeight;
    }

    public Integer gettWidth() {
        return tWidth;
    }

    public void settWidth(Integer tWidth) {
        this.tWidth = tWidth;
    }

    public Integer getfHeight() {
        return fHeight;
    }

    public void setfHeight(Integer fHeight) {
        this.fHeight = fHeight;
    }

    public Integer getfWidth() {
        return fWidth;
    }

    public void setfWidth(Integer fWidth) {
        this.fWidth = fWidth;
    }

    public String gettRatio() {
        return tRatio;
    }

    public void settRatio(String tRatio) {
        this.tRatio = tRatio == null ? null : tRatio.trim();
    }

    public String getfRatio() {
        return fRatio;
    }

    public void setfRatio(String fRatio) {
        this.fRatio = fRatio == null ? null : fRatio.trim();
    }
}