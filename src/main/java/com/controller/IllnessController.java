package com.controller;


import com.Entity.Illness;
import com.dao.IllnessDao;
import com.github.pagehelper.PageInfo;
import com.service.IIllnessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/illness")
public class IllnessController {

    @Autowired
    IIllnessService iIllnessService;

    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page", required = true, defaultValue = "1") Integer page,
                                @RequestParam(name = "size", required = true, defaultValue = "4") Integer size){
        ModelAndView mv = new ModelAndView();
        List<Illness> illnesses = iIllnessService.findAll(page, size);
        PageInfo pageInfo = new PageInfo(illnesses);
        mv.addObject("illnesss", pageInfo);
        mv.setViewName("illness-list");
        return mv;
    }
    @RequestMapping("/addIllness.do")
    public String addIllness(String illnessname){
        iIllnessService.addIllness(illnessname);
        return "redirect:findAll.do";
    }

    @RequestMapping("/deleteById.do")
    public String deleteById(Integer id) {

        iIllnessService.deleteById(id);
        return "redirect:findAll.do";
    }
}
