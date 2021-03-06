package com.dao;

import com.Entity.Office;

import java.util.List;

public interface OfficeRelationDao {

    //删除relation表记录
    void deleteOfficeRelation(Integer officeid);

    void addOfficeId(Integer officeid, Integer[] illnessids);

    void deleteByIllnessid(Integer id);

    List<Office> findOfficeByIllnessId(Integer id);
}
