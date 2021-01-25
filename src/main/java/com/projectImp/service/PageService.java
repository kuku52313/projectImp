package com.projectImp.service;

import com.projectImp.domain.PageCriteriaVO;
import com.projectImp.persistence.PagingDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PageService {

    private final PagingDAO pagingDAO;

    public PageService(PagingDAO pagingDAO) {
        this.pagingDAO = pagingDAO;
    }

    public int getPhotoListTotal() {
        return pagingDAO.getPhotoListTotal();
    }

    public int goMyGalleryListTotal(String memberId) {
        return pagingDAO.goMyGalleryListTotal(memberId);
    }
}
