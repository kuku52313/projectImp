package com.projectImp.persistence;

import com.projectImp.domain.PageCriteriaVO;

public interface PagingDAO {
    int getPhotoListTotal();

    int goMyGalleryListTotal(String memberId);
}
