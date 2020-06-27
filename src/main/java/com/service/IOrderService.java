package com.service;

import com.Entity.Order;

import java.util.HashMap;
import java.util.List;

public interface IOrderService {

    List<Order> findByDoctorId(Integer id);

    HashMap<String, Integer> findOfficeToOrderCount();

    void addOrder(Integer Patientid, Integer doctorid, String orderTime, Integer orderId);

    void updataOrderStatus(Integer orderid, Integer status);

    void addComment(Integer orderId,Integer degree, String txtarea);
}
