package com.dao;

import com.Entity.Order;
import org.apache.ibatis.annotations.Param;
import org.omg.CORBA.INTERNAL;

import java.util.Date;
import java.util.List;

public interface OrderDao {

    Integer findByDoctorIdToCount(Integer doctorId);

    List<Order> findOrderById(Integer id);

    int countOrderByOffice(Integer id);

    void insertOrder(@Param("patientid") Integer patientid, @Param("doctorid") Integer doctorid,
                     @Param("status")Integer status, @Param("orderTime") Date orderTime,
                      @Param("startTime") Date startTime);

    void updataNum(@Param("ordernum") Integer ordernum ,@Param("workTimeId") Integer workTimeId);

    Integer countOrderNum(Integer workTimeId);

    void updataOrderStatus(@Param("orderid") Integer orderid,@Param("status") Integer status);

    void addComment(@Param("orderId") Integer orderId,@Param("degree") Integer degree,@Param("txtarea") String txtarea);
}
