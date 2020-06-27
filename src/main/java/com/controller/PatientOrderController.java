package com.controller;


import com.Entity.Doctor;
import com.Entity.Order;
import com.Entity.Patient;
import com.dao.OrderDao;
import com.service.impl.DoctorServiceImpl;
import com.service.impl.OrderServiceImpl;
import com.service.impl.PatientServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/book")
public class PatientOrderController {


    @Autowired
    OrderServiceImpl orderService;
    @Autowired
    DoctorServiceImpl doctorService;

    @Autowired
    PatientServiceImpl patientService;

    @RequestMapping("/isLogin.do")
    public String bookIsLogin(@RequestParam(name = "doctorid", required = true) Integer doctorid,
                              @RequestParam(name = "orderTime", required = true) String orderTime,
                              @RequestParam(name = "workTimeId", required = true) Integer workTimeId,
                              HttpServletRequest session){
        Patient patient = (Patient) session.getSession().getAttribute("patient");
        if (patient == null) {
            return "redirect:/patientLogin.jsp";
        } else {
            Doctor doctor = doctorService.findOfficeForDoctor(doctorid);
            session.getSession().setAttribute("workTimeId", workTimeId);
            session.getSession().setAttribute("doctor", doctor);
            session.getSession().setAttribute("orderTime", orderTime);
            return "redirect:/pages/orderDetails.jsp";
        }
    }
    @RequestMapping("/order.do")
    public ModelAndView bookOrder(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        Patient patient = (Patient) request.getSession().getAttribute("patient");
        Doctor doctor = (Doctor)request.getSession().getAttribute("doctor");
        String orderTime = (String) request.getSession().getAttribute("orderTime");
        Integer workTimeId = (Integer) request.getSession().getAttribute("workTimeId");
        /**
         * 患者id
         * 医生id
         * 订单时间
         * 订单id
         */
        orderService.addOrder(patient.getId(), doctor.getId(), orderTime, workTimeId);

        String msg = "挂号成功，请前往个人中心查看~~~~";
        request.getSession().setAttribute("msg", msg);
        mv.setViewName("patientIndex");
        return mv;
    }
    @RequestMapping("/showMyPatient.do")
    public ModelAndView showPatient(Integer patientId) {
        ModelAndView mv = new ModelAndView();
        //查询患者所有的订单信息
        List<Order> orders =  patientService.findOrderAllById(patientId);
        mv.addObject("orderDetails", orders);
        mv.setViewName("personDetails");
        return mv;
    }
    @RequestMapping("/cancelOrder")
    public String cancelOrder(Integer orderid, Integer patientId) {
        //取消订单状态3
        orderService.updataOrderStatus(orderid, 3);

        return "redirect:showMyPatient.do?patientId="+patientId;
    }

    @ResponseBody
    @RequestMapping(value = "/comment.do", method = RequestMethod.POST)
    public Integer comment(Integer orderId, Integer degree, String txtarea, Integer patientId){
        System.out.println("orderId" + orderId + "；degree" + degree + "; txtarea" + txtarea );
        orderService.addComment(orderId, degree, txtarea);
        return patientId;
    }
}
