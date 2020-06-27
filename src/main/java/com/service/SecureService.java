package com.service;

import com.Entity.Admin;
import com.Entity.Patient;

public interface SecureService {
    //只有查询的业务，测试
    Admin findByPhone(String adname);

    //判断是否登录成功
    boolean isLoginSuccess(Admin admin);

    void updataPassword(String newPassword, String phonenum);

    boolean isPatientSuccess(String phonenum, String password);

    Patient findPatient(String phonenum);

    void addPatient(Patient patient);
}
