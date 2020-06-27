package com.dao;

import com.Entity.Admin;
import org.apache.ibatis.annotations.Param;

public interface AdminDao {

    Admin findByPhone(@Param("phonenum") String phonenum);

    void updataPassword(@Param("newPassword") String newPassword,@Param("phonenum") String phonenum);
}
