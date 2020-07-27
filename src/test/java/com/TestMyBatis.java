package com;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;

public class TestMyBatis {
    @Test
    public void testS() throws IOException {
        String st = "springConfig.xml";
        InputStream stream = Resources.getResourceAsStream(st);
        SqlSessionFactory build = new SqlSessionFactoryBuilder().build(stream);
        SqlSession sqlSession = build.openSession();
    }
}
