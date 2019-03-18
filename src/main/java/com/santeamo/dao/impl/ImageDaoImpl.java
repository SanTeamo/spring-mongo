package com.santeamo.dao.impl;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.gridfs.GridFS;
import com.mongodb.gridfs.GridFSDBFile;
import com.mongodb.gridfs.GridFSInputFile;
import com.santeamo.dao.ImageDao;
import org.springframework.stereotype.Repository;

import java.io.File;
import java.io.IOException;

@Repository("imageDao")
public class ImageDaoImpl extends MongoDBBaseDao implements ImageDao {

    /***
     * mongodb存储图片
     * @param picFile
     * @param imageUrl
     * @param gridName 节点名，相当于表名
     */
    @Override
    public void savePic(File picFile, String imageUrl, String gridName){
        try {
            DB db = mongoTemplate.getDb();
            GridFS fs = new GridFS(db, gridName);
            GridFSInputFile inputFile = fs.createFile(picFile);
            inputFile.setFilename(imageUrl);
            inputFile.setContentType(imageUrl.substring(imageUrl.lastIndexOf(".")));
            inputFile.save();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 删除图片
     * @param imageUrl
     * @param gridName
     */
    @Override
    public void deletePic(String imageUrl,String gridName){
        DB db = mongoTemplate.getDb();
        GridFS fs = new GridFS(db, gridName);
        GridFSDBFile file = fs.findOne(imageUrl);
        fs.remove(file);
    }

    /***
     * mongodb查询图片
     * @param imageUrl
     * @param gridName 节点名，相当于表名
     */
    @Override
    public GridFSDBFile findPic(String imageUrl,String gridName){
        DB db = mongoTemplate.getDb();
        GridFS fs = new GridFS(db, gridName);
        GridFSDBFile file = fs.findOne(imageUrl);
        return file;
    }
}
