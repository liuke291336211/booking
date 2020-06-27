package com.controller;


import com.Entity.Illness;
import com.Entity.Office;
import com.github.pagehelper.PageInfo;
import com.service.IIllnessService;
import com.service.IOfficeRelationService;
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

    @Autowired
    IOfficeRelationService iOfficeRelationService;

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

    //查询所有疾病
    @RequestMapping("/showIllness.do")
    public ModelAndView showIllness(){
        ModelAndView mv = new ModelAndView();
        List<Illness> illnessList = iIllnessService.findAll();
        mv.addObject("illnessList", illnessList);
        mv.setViewName("showIllness");
        return mv;
    }

    //根据疾病查找相关的所有科室
    @RequestMapping("/findIllnessOffice.do")
    public ModelAndView findIllnessOffice(Integer id) {
        ModelAndView mv = new ModelAndView();
        List<Office> officeList =  iOfficeRelationService.findOfficeByIllnessId(id);
        String illnessname = iIllnessService.findIllnessname(id);
        mv.addObject("illness", illnessname);
        mv.addObject("officeList", officeList);
        mv.setViewName("showIllnessOffice");
        return mv;
    }
}
