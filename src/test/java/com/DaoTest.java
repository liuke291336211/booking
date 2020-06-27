package com;

import com.Entity.Admin;
import com.Entity.Order;
import com.Entity.Patient;
import com.dao.AdminDao;
import com.dao.OrderDao;
import com.dao.PatientDao;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Date;
import java.util.List;

public class DaoTest {

    @Test
    public void TestDao() {
        ApplicationContext app = new ClassPathXmlApplicationContext("springConfig.xml");
        AdminDao bean = app.getBean(AdminDao.class);
        Admin admin = bean.findByPhone("123456");
        System.out.println(admin);
    }
    @Test
    public void TestOrder() {
        ApplicationContext app = new ClassPathXmlApplicationContext("springConfig.xml");
        OrderDao bean = app.getBean(OrderDao.class);
        List<Order> orderById = bean.findOrderById(1);
        for (Order or : orderById){
            System.out.println(or);
            System.out.println(or.getPatient().getNickname());
        }
    }
    @Test
    public void TestOrderadd() {
        ApplicationContext app = new ClassPathXmlApplicationContext("springConfig.xml");
        PatientDao bean = app.getBean(PatientDao.class);
        List<Order> orderAllById = bean.findOrderAllById(1);
        for (Order or : orderAllById) {
            System.out.println(or);
        }

    }
    @Test
    public void TestPatientadd() {
        ApplicationContext app = new ClassPathXmlApplicationContext("springConfig.xml");
        PatientDao bean = app.getBean(PatientDao.class);
        Patient patient = new Patient();
        patient.setPassword("123");
        patient.setPhonenum("1234");
        patient.setNickname("喜喜");
        patient.setPname("小米");
        patient.setAddress("陕西西安");
        patient.setAge(12);
        patient.setSex("男");
        patient.setEmail("324@qq.com");
        bean.addPatient(patient);

    }
}
