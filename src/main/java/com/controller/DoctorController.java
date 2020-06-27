package com.controller;

import com.Entity.Doctor;
import com.Entity.DoctorTimeData;
import com.Entity.Schedule;
import com.Entity.WorkTime;
import com.github.pagehelper.PageInfo;
import com.service.IDoctorService;
import com.service.impl.DoctorServiceImpl;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/doctor")
public class DoctorController {

    @Autowired
    DoctorServiceImpl doctorService;

    @RequestMapping("/findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page", required = true, defaultValue = "1") Integer page,
                                @RequestParam(name = "size", required = true, defaultValue = "4") Integer size){
        ModelAndView mv = new ModelAndView();
        List<Doctor> all = doctorService.findAll(page, size);
        PageInfo pageInfo = new PageInfo(all);
        mv.addObject("doctorList", pageInfo);
        mv.setViewName("doctor-list");
        return mv;
    }
    @RequestMapping("/saveDoctor.do")
    public String saveDoctor(Doctor doctor){
        doctorService.addDoctor(doctor);
        return "redirect:findAll.do";
    }
    //删除医生
    @RequestMapping("/deleteDoctor.do")
    public String deleteDoctor(Integer id){
        doctorService.deleteDoctor(id);
        return "redirect:findAll.do";
    }
    //查询排班表，显示
    @RequestMapping("/findShedule.do")
    public ModelAndView findShedule(Integer id){
        List<Schedule> schedules=  doctorService.findShedule();
        ModelAndView mv = new ModelAndView();
        mv.addObject("doctorId", id);
        mv.addObject("schedules" , schedules);
        mv.setViewName("doctor-days");
        return mv;
    }
    //保存就诊时段设置
    @RequestMapping("/saveDays.do")
    public String saveDays(@RequestParam(name = "scheduleIds", required = true) Integer[] scheduleIds,
                           @RequestParam(name = "nums", required = true) Integer nums,
                           @RequestParam(name = "doctorId", required = true) Integer doctorId){
        doctorService.addWorkTime(scheduleIds, nums, doctorId);
        return "redirect:findAll.do";
    }

    @RequestMapping("/showDoctorTime.do")
    public ModelAndView showDoctorTime(Integer doctorid) {
        ModelAndView mv = new ModelAndView();
        //需要数据，医生信息，医生就诊时段，医生评论信息
        //就诊时段：今天日期、医生星期几及上午下午
        Doctor doctor = doctorService.findDoctorById(doctorid);
        mv.addObject("docotrData", doctor);
        mv.setViewName("doctorDetails");
        return mv;
    }

    @ResponseBody
    @RequestMapping("/TimeVisit.do")
    public List<WorkTime> getTimeVisit(@RequestParam(name = "doctorid", required = true) Integer doctorid) {

        List<WorkTime> workTimes =  doctorService.findSheduleByDoctorid(doctorid);
        return workTimes;
    }
}
