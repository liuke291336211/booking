package com.service.impl;

import com.Entity.Office;
import com.Entity.OfficeRelation;
import com.dao.IllnessDao;
import com.dao.OfficeRelationDao;
import com.service.IOfficeRelationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OfficeRelationImpl implements IOfficeRelationService {

    @Autowired
    IllnessDao illnessDao;

    @Autowired
    OfficeRelationDao officeRelationDao;

    @Override
    public void addOfficeId(Integer officeid, Integer[] illnessids) {
        for(Integer illness : illnessids) {
            illnessDao.addOfficeId(officeid, illness);
        }
    }

    @Override
    public List<Office> findOfficeByIllnessId(Integer id) {
        return officeRelationDao.findOfficeByIllnessId(id);
    }
}
