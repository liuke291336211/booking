package com.service.impl;

import com.Entity.Illness;
import com.dao.IllnessDao;
import com.dao.OfficeRelationDao;
import com.github.pagehelper.PageHelper;
import com.service.IIllnessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IllnessServiceImpl implements IIllnessService {
    @Autowired
    IllnessDao illnessDao;

    @Autowired
    OfficeRelationDao officeRelationDao;

    @Override
    public List<Illness> findAll(Integer page, Integer size) {

        PageHelper.startPage(page, size);
        return illnessDao.findAll();
    }

    @Override
    public void addIllness(String illnessname) {
        illnessDao.addIllness(illnessname);
    }

    @Override
    public void deleteById(Integer id) {
        //先删除relation表
        officeRelationDao.deleteByIllnessid(id);
        illnessDao.deleteById(id);
    }
}
