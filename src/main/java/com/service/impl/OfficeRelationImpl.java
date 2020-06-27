package com.service.impl;

import com.dao.IllnessDao;
import com.service.IOfficeRelation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OfficeRelationImpl implements IOfficeRelation {

    @Autowired
    IllnessDao illnessDao;

    @Override
    public void addOfficeId(Integer officeid, Integer[] illnessids) {
        for(Integer illness : illnessids) {
            illnessDao.addOfficeId(officeid, illness);
        }
    }
}
