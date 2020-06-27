package com.service.impl;

import com.Entity.Doctor;
import com.Entity.Illness;
import com.Entity.Office;
import com.dao.DoctorDao;
import com.dao.OfficeDao;
import com.dao.OfficeRelationDao;
import com.github.pagehelper.PageHelper;
import com.service.IOfficeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OfficeServiceImpl implements IOfficeService {

    @Autowired
    OfficeDao officeDao;

    @Autowired
    DoctorDao doctorDao;

    @Autowired
    OfficeRelationDao officeRelationDao;

    @Override
    public List<Office> findAll(Integer page, Integer size) {
        PageHelper.startPage(page, size);
        List<Office> allOffice = officeDao.findAllOffice();
        return allOffice;
    }

    @Override
    public List<Office> findAll() {
        return officeDao.findAllOffice();
    }

    @Override
    public void addOffice(String officename) {
        officeDao.addOffice(officename);
    }

    @Override
    public List<Doctor> findByOfficeid(Integer id) {
        List<Doctor> officeDetail  = officeDao.findByOfficeid(id);
        return officeDetail;
    }

    @Override
    public Office findById(Integer id) {
        return officeDao.findById(id);
    }

    @Override
    public List<Illness> findByOfficeidForIllness(Integer id) {
        return officeDao.findByOfficeidForIllness(id);
    }

    //业务层，首先删除医生表再删除疾病和科室的关系表
    @Override
    public void deleteOffice(Integer id) {
        doctorDao.setOffice(id);
        officeRelationDao.deleteOfficeRelation(id);
        officeDao.deleteOffice(id);
    }

    //科室映射映射

    @Override
    public Office findByIdOnDoctor(Integer officeid) {
        return officeDao.findDoctorOnOffice(officeid);
    }
}
