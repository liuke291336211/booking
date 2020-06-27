package com.controller;

import com.Entity.Doctor;
import com.Entity.Order;
import com.dao.DoctorDao;
import com.service.IOrderService;
import com.service.impl.DoctorServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/countDoctor")
public class CountDoctorController {
    @Autowired
    DoctorServiceImpl doctorService;

    @Autowired
    IOrderService iOrderService;
    @RequestMapping("/showDoctor.do")
    public ModelAndView showDoctor(){
        HashMap<Doctor, Integer> commnetCount = doctorService.CommnetCount();
        ModelAndView mv = new ModelAndView();
        mv.addObject("doctorDetails", commnetCount);
        mv.setViewName("countDoctor");
        return mv;
    }
    @RequestMapping("/showDetail.do")
    public ModelAndView showDetail(Integer id){
        ModelAndView mv = new ModelAndView();
        List<Order> orderList = iOrderService.findByDoctorId(id);
        mv.addObject("orderList", orderList);
        mv.setViewName("commentDetail");
        return mv;
    }
    @RequestMapping("/countOffice.do")
    public ModelAndView countOffice() {
        ModelAndView mv = new ModelAndView();
        HashMap<String, Integer> orderCount = iOrderService.findOfficeToOrderCount();
        mv.addObject("ordersMap", orderCount);
        mv.setViewName("countOffice");
        return mv;
    }
}
