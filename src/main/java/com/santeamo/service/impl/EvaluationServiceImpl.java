package com.santeamo.service.impl;

import com.santeamo.dao.EvaluationDao;
import com.santeamo.dao.OrderDao;
import com.santeamo.dao.ProductDao;
import com.santeamo.model.*;
import com.santeamo.myenum.OrderStatus;
import com.santeamo.service.EvaluationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class EvaluationServiceImpl implements EvaluationService {
    @Resource
    private EvaluationDao evaluationDao;

    @Resource
    private ProductDao productDao;

    @Resource
    private OrderDao orderDao;

    @Override
    public Evaluation getEvaluationById(String id) {
        return evaluationDao.getEvaluationById(id);
    }

    @Override
    public Product getProductByPid(String pid) {
        return productDao.getProductByPid(pid);
    }

    @Override
    public void addComment(Evaluation evaluation, String oid) {
        Comment comment = evaluation.getComments().get(0);
        comment.setCommentTime(new Date());
        evaluationDao.addComment(comment,evaluation.getPid());
        String pid = evaluation.getPid();
        orderDao.changeCommentStatus(oid,pid);
        Order order = orderDao.findById(Order.class,oid);
        int orderStatus = order.getStatus();
        List<ProductWrapper> productWrappers = order.getProductWrappers();
        for (ProductWrapper productWrapper : productWrappers){
            if (productWrapper.getCommented()==false){
                orderStatus = OrderStatus.SIGNED.getStatus();
                break;
            }else {
                orderStatus = OrderStatus.COMMENTED.getStatus();
            }
        }
        if (orderStatus==OrderStatus.COMMENTED.getStatus()){
            orderDao.changeStatus(oid,OrderStatus.COMMENTED);
        }
    }
}
