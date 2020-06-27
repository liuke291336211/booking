package com.controller;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/main")
public class RedrectController {

    @RequestMapping("/index.do")
    public ModelAndView forword(){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("main");
        return mv;
    }

    @RequestMapping("logout.do")
    public String logout(){
        return "redirect:/adminLogin.jsp";
    }
}
