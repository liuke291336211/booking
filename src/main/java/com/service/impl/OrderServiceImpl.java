package com.service.impl;

import com.Entity.Office;
import com.Entity.Order;
import com.dao.OfficeDao;
import com.dao.OrderDao;
import com.service.IOrderService;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Service
public class OrderServiceImpl implements IOrderService {

    @Autowired
    OrderDao orderDao;

    @Autowired
    OfficeDao officeDao;

    @Override
    public List<Order> findByDoctorId(Integer id) {
        return orderDao.findOrderById(id);
    }

    @Override
    public HashMap<String, Integer> findOfficeToOrderCount() {
        List<Office> allOffice = officeDao.findAllOffice();
        HashMap<String, Integer> officmap = new HashMap<>();
        for (Office office : allOffice) {
            int count = orderDao.countOrderByOffice(office.getId());
            officmap.put(office.getOfficename(), count);
        }
        return officmap;
    }

    @Override
    public void addOrder(Integer patientid, Integer doctorid, String orderTime, Integer workTimeId) {
        //需要获取创建订单时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date ordertime = new Date();

        System.out.println(ordertime);
        //订单就诊时间
        String year, month, day, week;
        String[] date = orderTime.split("_");
        year = date[0].substring(0, 4);
        month = date[0].substring(4, 6);
        day = date[0].substring(6);

        Date starTime = new Date();
        if (date[2].equals("morning")){
            try {
                starTime = sdf.parse(year + "-" + month  + "-" + day + " " + "09:00:00");
            } catch (ParseException e) {
                e.printStackTrace();
            }
        } else {
            try {
                starTime = sdf.parse(year + "-" + month  + "-" + day + " " + "14:00:00");
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }

        //调用doa层插入
        /**
         * status:订单状态
         */
        orderDao.insertOrder(patientid, doctorid,1, ordertime, starTime);

        //增加一个订单，相应的医生看诊人数加1
        //根据orderId更细
        Integer ordernum =  orderDao.countOrderNum(workTimeId);
        ordernum++;
        orderDao.updataNum( ordernum, workTimeId);

    }

    @Override
    public void updataOrderStatus(Integer orderid, Integer status) {
        orderDao.updataOrderStatus(orderid, status);
    }

    @Override
    public void addComment(Integer orderId, Integer degree, String txtarea) {
        //修改订单状态
        orderDao.addComment(orderId,degree, txtarea);

    }
}
