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
}
