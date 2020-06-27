package com.service.impl;

import com.Entity.Order;
import com.Entity.Patient;
import com.dao.PatientDao;
import com.service.IPatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class PatientServiceImpl implements IPatientService {

    @Autowired
    PatientDao patientDao;

    @Override
    public List<Order> findOrderAllById(Integer patientId) {
        return patientDao.findOrderAllById(patientId);
    }

    @Override
    public boolean isPhonenum(String phonenum) {
        Patient byPhone = patientDao.findByPhone(phonenum);
        if (byPhone == null) {
            return false;
        } else {
            return true;
        }
    }

    @Override
    public boolean phonenumAndEmail(String phonenum, String email, String password) {
        Patient patient = patientDao.findByPhone(phonenum);
        if(patient != null && patient.getEmail().equals(email)) {
            //ture修改密码
            patientDao.updataPassword(phonenum, password);
            return true;
        } else {
            return false;
        }
    }
}
