package model.dao;

import model.Profile;
import model.Scrap;

import java.io.IOException;
import java.io.InputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import repository.mybatis.mapper.ScrapMapper;

public class ScrapDAO {
    private SqlSessionFactory sqlSessionFactory;
    private JDBCUtil jdbcUtil = null;

    public ScrapDAO() {
        String resource = "mybatis-config.xml";
        InputStream inputStream;
        try {
            inputStream = Resources.getResourceAsStream(resource);
        } catch (IOException e) {
            throw new IllegalArgumentException(e);
        }
        sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
    }

    public int create(Scrap scrap) {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        try {
            int result = sqlSession.getMapper(ScrapMapper.class).insertScrap(scrap);
            if (result > 0) {
                sqlSession.commit();
            }
            return result;
        } finally {
            sqlSession.close();
        }
    }

    public int remove(int s_id, int scrap_id) {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        try {
            int result = sqlSession.getMapper(ScrapMapper.class).deleteScrap(s_id, scrap_id);
            if (result > 0) {
                sqlSession.commit();
            }
            return result;
        } finally {
            sqlSession.close();
        }
    }

    public boolean isScraped(int s_id, int scrap_id) {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        try {
            int cnt = sqlSession.getMapper(ScrapMapper.class).isScraped(s_id, scrap_id);
            return (cnt == 1 ? true : false);
        } finally {
            sqlSession.close();
        }
    }

    public List<Profile> findScarpList(int s_id) {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        try {
            return sqlSession.getMapper(ScrapMapper.class).findScrapList(s_id);
        } finally {
            sqlSession.close();
        }
    }
}
