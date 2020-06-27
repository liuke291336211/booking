package com.service.impl;

import com.Entity.Admin;
import com.Entity.Patient;
import com.dao.AdminDao;
import com.dao.PatientDao;
import com.service.SecureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;

@Service
public class SecureServiceImpl implements SecureService {

    @Autowired
    AdminDao admin;
    @Autowired
    PatientDao patientDao;
    @Override
    public Admin findByPhone(String adname) {
        Admin byName = admin.findByPhone(adname);
        return byName;
    }

    /**
     * 管理员admin
     * @param admin
     * @return 数据库查询是否匹配，如果成功返回ture,失败返回false
     */
    @Override
    public boolean isLoginSuccess(Admin admin) {
        Admin adminDao = this.admin.findByPhone(admin.getPhonenum());
        if (adminDao != null && admin.getPhonenum().equals( adminDao.getPhonenum()) &&  admin.getPassword().equals(adminDao.getPassword())) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public void updataPassword(String newPassword, String phonenum) {
        admin.updataPassword(newPassword, phonenum);
    }

    @Override
    public boolean isPatientSuccess(String phonenum, String password) {
        Patient patient = patientDao.findByPhone(phonenum);
        if(patient != null && patient.getPhonenum().equals(phonenum) && patient.getPassword().equals(password)) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public Patient findPatient(String phonenum) {
        return patientDao.findByPhone(phonenum);
    }

    @Override
    public void addPatient(Patient patient) {
        patientDao.addPatient(patient);
    }
}
