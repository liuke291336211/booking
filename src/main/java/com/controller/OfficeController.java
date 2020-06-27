package com.controller;

import com.Entity.Doctor;
import com.Entity.Illness;
import com.Entity.Office;
import com.dao.IllnessDao;
import com.dao.OfficeRelationDao;
import com.github.pagehelper.PageInfo;
import com.service.IOfficeRelation;
import com.service.IOfficeService;
import com.service.impl.DoctorServiceImpl;
import com.service.impl.OfficeRelationImpl;
import com.service.impl.OfficeServiceImpl;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/office")
public class OfficeController {

    @Autowired
    OfficeServiceImpl officeService;

    @Autowired
    OfficeRelationImpl officeRelation;

    @Autowired
    IllnessDao illnessDao;

    @Autowired
    DoctorServiceImpl doctorService;
    @RequestMapping("/findAll.do")
    public ModelAndView findAllOffice(@RequestParam(name = "page", required = true, defaultValue = "1") Integer page,
                                      @RequestParam(name = "size", required = true, defaultValue = "4") Integer size) {
        ModelAndView mv = new ModelAndView();
        List<Office> offices = officeService.findAll(page, size);
        PageInfo pageInfo = new PageInfo(offices);
        mv.addObject("officeList", pageInfo);
        mv.setViewName("office-list");
        return mv;
    }

    @RequestMapping("/saveOffice.do")
    public String saveOffice(String officename){
        officeService.addOffice(officename);
        return "redirect:findAll.do";
    }

    @RequestMapping("/findById.do")
    public ModelAndView findById(Integer id) {
        List<Doctor> doctors = officeService.findByOfficeid(id);
        Office office = officeService.findById(id);
        List<Illness> illnesses = officeService.findByOfficeidForIllness(id);
        ModelAndView mv = new ModelAndView();
        mv.addObject("illnesses", illnesses);
        mv.addObject("office", office);
        mv.addObject("doctors", doctors);
        mv.setViewName("office-show");
        return mv;
    }
    //删除科室
    @RequestMapping("/deleteOffice.do")
    public String deleteOffice(Integer id){
        officeService.deleteOffice(id);
        return "redirect:findAll.do";
    }

    //为科室添加医生
    @RequestMapping("/addDoctor.do")
    public ModelAndView addDoctor(@RequestParam(name = "id", required = true) Integer id){
        ModelAndView mv = new ModelAndView();
        Office office = officeService.findById(id);
        List<Doctor> doctors =  doctorService.findByNull();
        mv.addObject("doctors", doctors);
        mv.addObject("office", office);
        mv.setViewName("office-addDoctor");
        return mv;
    }
    @RequestMapping("/addDoctorToOffice.do")
    public String addDoctorToOffice(@RequestParam(name = "officeId", required = true) Integer officeid,
                                    @RequestParam(name = "doctorIds", required = true) Integer[] doctorids) {
        doctorService.addOfficeId(officeid, doctorids);
        return "redirect:findAll.do";
    }
    @RequestMapping("/addIllness.do")
    public ModelAndView addIllness(@RequestParam(name = "id", required = true) Integer id){
        ModelAndView mv = new ModelAndView();
        Office office = officeService.findById(id);
        List<Illness> illness = illnessDao.findAll();
        mv.addObject("illnesses", illness);
        mv.addObject("office", office);
        mv.setViewName("office-addIllness");
        return mv;
    }
    @RequestMapping("/addIllnessToOffice.do")
    public String addIllnessToOffice(@RequestParam(name = "officeId", required = true) Integer officeid,
                                     @RequestParam(name = "illnessIds", required = true) Integer[] illnessids) {
        officeRelation.addOfficeId(officeid, illnessids);
        return "redirect:findAll.do";
    }

    //患者按推荐查询指定科室
    @RequestMapping("/showOffice.do")
    public ModelAndView showOffice(Integer officeid){
        ModelAndView mv = new ModelAndView();
        Office office = officeService.findById(officeid);
        List<Doctor> doctors = officeService.findByOfficeid(officeid);
        mv.addObject("office", office);
        mv.addObject("doctors", doctors);
        mv.setViewName("orderOfficeDoctor");
        return mv;
    }

    //患者查询所有科室
    @RequestMapping("/showAllOffice.do")
    public ModelAndView showAllOffice(){
        ModelAndView mv = new ModelAndView();
        List<Office> officeList = officeService.findAll();
        mv.addObject("officeList", officeList);
        mv.setViewName("showAllOffice");
        return mv;
    }

}
