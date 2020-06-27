package com.controller;

import com.Entity.Admin;
import com.Entity.Patient;
import com.service.SecureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/secure")
public class SecureController {

    @Autowired
    SecureService secureService;
    @RequestMapping("/adminLogin.do")
    public ModelAndView adminLogin(Admin admin) {
        //调用服务层SecureService返回是否登录成功，true为成功，false为失败
        if (secureService.isLoginSuccess(admin)){
            ModelAndView mv = new ModelAndView();
            mv.addObject("admin", admin);
            mv.setViewName("main");
            return mv;
        } else {
            ModelAndView mv = new ModelAndView();
            mv.setViewName("failer");
            return mv;
        }
    }

    @RequestMapping("/changePasswrod.do")
    public ModelAndView changePasswrod(@RequestParam(name = "adminname", required = true) String adminname,
                                 @RequestParam(name = "oldPassword", required = true) String oldPassword,
                                 @RequestParam(name = "newPassword", required = true) String newPassword){
        Admin admin = new Admin();
        admin.setPhonenum(adminname);
        admin.setPassword(oldPassword);
        ModelAndView mv = new ModelAndView();
        boolean isChange = false;
        if (secureService.isLoginSuccess(admin)){
            secureService.updataPassword(newPassword, admin.getPhonenum());
            isChange = true;
           mv.addObject("isChange", isChange);
        } else {
            isChange = false;
           mv.addObject("isChange", isChange);
        }
        mv.setViewName("isChange");
        return mv;
    }
    @RequestMapping("/patientLogup.do")
    public String logup(Patient patient) {
        secureService.addPatient(patient);
        return "redirect:/";
    }
}
