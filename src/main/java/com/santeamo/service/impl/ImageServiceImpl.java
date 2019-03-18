package com.santeamo.service.impl;

import com.mongodb.gridfs.GridFSDBFile;
import com.santeamo.dao.ImageDao;
import com.santeamo.service.ImageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.File;

@Service
public class ImageServiceImpl implements ImageService {

    @Resource
    ImageDao imageDao;

    @Override
    public void savePic(File picFile, String imageUrl, String gridName) {
        imageDao.savePic(picFile,imageUrl,gridName);
    }

    @Override
    public GridFSDBFile findPic(String imageUrl, String gridName) {
        return imageDao.findPic(imageUrl,gridName);
    }

    @Override
    public void deletePic(String imageUrl, String gridName) {

    }
}
