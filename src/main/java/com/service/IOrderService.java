package com.service;

import com.Entity.Order;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;

public interface IOrderService {

    List<Order> findByDoctorId(Integer id);

    HashMap<String, Integer> findOfficeToOrderCount();

    @Transactional(rollbackFor = Exception.class)
    void addOrder(Integer Patientid, Integer doctorid, String orderTime, Integer orderId);

    void updataOrderStatus(Integer orderid, Integer status);

    void addComment(Integer orderId,Integer degree, String txtarea);
}
