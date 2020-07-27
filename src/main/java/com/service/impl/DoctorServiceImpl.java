package com.service.impl;

import com.Entity.*;
import com.dao.DoctorDao;
import com.dao.OrderDao;
import com.dao.WorkTimeDao;
import com.github.pagehelper.PageHelper;
import com.service.IDoctorService;
import org.omg.PortableInterceptor.INACTIVE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;

@Service
public class DoctorServiceImpl implements IDoctorService {

    @Autowired
    DoctorDao doctorDao;

    @Autowired
    WorkTimeDao workTimeDao;

    @Autowired
    OrderDao orderDao;

    @Override
    public List<Doctor> findByNull() {
        return doctorDao.findByNull();
    }

    @Override
    public List<Doctor> findAll(Integer page, Integer size) {
        PageHelper.startPage(page, size);
        List<Doctor> doctorList = doctorDao.findAll();
        //查找就诊时间，设置在doctor属性中
        for (Doctor doctor : doctorList){
            List<WorkTime> workTimeList =  workTimeDao.findByDoctorId(doctor.getId());
            if(workTimeList != null) {
                StringBuilder sb = new StringBuilder();
                for(WorkTime workTime : workTimeList){
                    List<Schedule> scheduleList = workTime.getScheduleList();
                    for (Schedule sh : scheduleList){
                        sb.append(sh.getWeekday());
                        sb.append(sh.getWorktimeStr());
                        sb.append(";");
                    }
                    doctor.setVisittimeStr(sb.toString());
                }
            }
        }
        return doctorList;
    }

    @Override
    public void addOfficeId(Integer officeid, Integer[] doctorids) {
        for (Integer doctorid : doctorids) {
            doctorDao.updataOfficeid(officeid, doctorid);
        }
    }

    @Override
    public void addDoctor(Doctor doctor) {
        doctorDao.addDoctor(doctor);
    }

    @Override
    public List<Schedule> findShedule() {
       return doctorDao.findShedule();
    }

    @Override
    public void addWorkTime(Integer[] scheduleIds, Integer nums, Integer dotcotId) {
        for (Integer sch : scheduleIds) {
            doctorDao.addWorkTime(sch, nums, dotcotId);
        }
    }

    @Override
    public void deleteDoctor(Integer id) {
        //先删除worktime表
        workTimeDao.deleteByDoctorId(id);
        //BUG修改:再增加级联表
        //与订单order级联
        orderDao.deleteByDoctorId(id);
        //在删除医生表
        doctorDao.deleteDoctor(id);
    }

    @Override
    public HashMap<Doctor, Integer> CommnetCount() {
       HashMap<Doctor, Integer> temp = new HashMap<>();
        List<Doctor> doctorList =  doctorDao.findAll();
        for (Doctor doc : doctorList){
            int doctorIdToCount = orderDao.findByDoctorIdToCount(doc.getId());
            temp.put(doc, doctorIdToCount);
        }
        return temp;
    }

    @Override
    public Doctor findDoctorById(Integer doctorid) {

        return doctorDao.findById(doctorid);
    }

    @Override
    public List<WorkTime> findSheduleByDoctorid(Integer doctorid) {
        return doctorDao.findSheduleByDoctorid(doctorid);
    }

    @Override
    public Doctor findOfficeForDoctor(Integer doctorid) {
        return doctorDao.findByIdForOffice(doctorid);
    }
}
