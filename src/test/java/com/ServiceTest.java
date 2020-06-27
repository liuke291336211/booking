package com;

import com.Entity.*;
import com.dao.WorkTimeDao;
import com.service.SecureService;
import com.service.impl.DoctorServiceImpl;
import com.service.impl.OfficeServiceImpl;
import com.util.DateChange;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Arrays;
import java.util.List;

public class ServiceTest {

    @Test
    public void serviceTest() {
        ApplicationContext app = new ClassPathXmlApplicationContext("springConfig.xml");
        SecureService bean = app.getBean(SecureService.class);
        Admin name = bean.findByPhone("123456");
        System.out.println(name);
    }
    @Test
    public void serviceOfficeTest() {
        ApplicationContext app = new ClassPathXmlApplicationContext("springConfig.xml");
        OfficeServiceImpl bean = app.getBean(OfficeServiceImpl.class);
        List<Office> all = bean.findAll(1, 4);
        for(Office o : all) {
            System.out.println(o);
        }
    }
    @Test
    public void serviceDoctorTest() {
        ApplicationContext app = new ClassPathXmlApplicationContext("springConfig.xml");
        DoctorServiceImpl bean = app.getBean(DoctorServiceImpl.class);
        List<Doctor> all = bean.findAll(1, 4);
        for(Doctor o : all) {
            System.out.println(o);
        }
    }
    @Test
    public void serviceOfficeTestDoctor() {
        ApplicationContext app = new ClassPathXmlApplicationContext("springConfig.xml");
        OfficeServiceImpl bean = app.getBean(OfficeServiceImpl.class);
        List<Illness> all = bean.findByOfficeidForIllness(9);
        for(Illness o : all) {
            System.out.println(o);
        }
    }
    @Test
    public void serviceOfficeTestDoctors() {
        ApplicationContext app = new ClassPathXmlApplicationContext("springConfig.xml");
        DoctorServiceImpl bean = app.getBean(DoctorServiceImpl.class);
        List<Schedule> shedule = bean.findShedule();
        for (Schedule sh : shedule){
            String string = DateChange.dateToString(sh.getWorktime(), "HH:mm:ss");
            System.out.println(sh.getWeekday() + string);
        }
    }
    @Test
    public void serviceWorkTimeTest() {
        ApplicationContext app = new ClassPathXmlApplicationContext("springConfig.xml");
        WorkTimeDao bean = app.getBean(WorkTimeDao.class);
        List<WorkTime> byDoctorId = bean.findByDoctorId(2);
        for(WorkTime o : byDoctorId) {
            System.out.println(o);
            List<Schedule> scheduleList = o.getScheduleList();
            for (Schedule sh : scheduleList){
                System.out.println("-------" + sh);
            }
        }
    }
    @Test
     public void testDoctor(){
        ApplicationContext app = new ClassPathXmlApplicationContext("springConfig.xml");
        DoctorServiceImpl bean = app.getBean(DoctorServiceImpl.class);
        Doctor doctorById = bean.findDoctorById(7);
        System.out.println(doctorById);
        for(Order or : doctorById.getOrders()) {
            System.out.println(or);
        }
    }
}
