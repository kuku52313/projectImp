package com.projectImp.persistence;

import com.projectImp.domain.PhotoDTO;

public interface PhotoDAO {

    void savePhoto(PhotoDTO photoDTO);

    void removingPhoto(String photoNumber, String memberId);
}
