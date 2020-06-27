package com.dao;

import com.Entity.Illness;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IllnessDao {

    void addOfficeId(@Param("officeid") Integer officeid,@Param("illness") Integer illness);

    List<Illness> findAll();

    void addIllness(String illnessname);

    void deleteById(Integer id);
}
