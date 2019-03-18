package com.santeamo.service;

import com.mongodb.gridfs.GridFSDBFile;

import java.io.File;

public interface ImageService {
    void savePic(File picFile, String imageUrl, String gridName);

    GridFSDBFile findPic(String imageUrl, String gridName);

    void deletePic(String imageUrl,String gridName);
}
