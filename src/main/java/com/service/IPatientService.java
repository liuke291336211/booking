package com.service;

import com.Entity.Order;

import java.util.List;

public interface IPatientService {
    List<Order> findOrderAllById(Integer patientId);

    boolean isPhonenum(String phonenum);
}
