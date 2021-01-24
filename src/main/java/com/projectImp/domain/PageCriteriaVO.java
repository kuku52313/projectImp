package com.projectImp.domain;

import lombok.Data;

@Data
public class PageCriteriaVO {
    private int pageNum;
    private int amount;
    private int offset;

    public PageCriteriaVO() {
        this(1, 9);
    }

    public PageCriteriaVO(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
    }
}
