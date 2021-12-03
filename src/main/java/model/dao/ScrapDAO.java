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
        jdbcUtil = new JDBCUtil();
        String resource = "mybatis-config.xml";
        InputStream inputStream;
        try {
            inputStream = Resources.getResourceAsStream(resource);
        } catch (IOException e) {
            throw new IllegalArgumentException(e);
        }
        sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
    }

//    public int create(Scrap scrap) {
//        SqlSession sqlSession = sqlSessionFactory.openSession();
//        try {
//            int result = sqlSession.getMapper(ScrapMapper.class).insertScrap(scrap);
//            if (result > 0) {
//                sqlSession.commit();
//            }
//            return result;
//        } finally {
//            sqlSession.close();
//        }
//    }
//
//    public int remove(int s_id, int scrap_id) {
//        SqlSession sqlSession = sqlSessionFactory.openSession();
//        try {
//            int result = sqlSession.getMapper(ScrapMapper.class).deleteScrap(s_id, scrap_id);
//            if (result > 0) {
//                sqlSession.commit();
//            }
//            return result;
//        } finally {
//            sqlSession.close();
//        }
//    }
    public int create(Scrap scrap) throws SQLException {
        String sql = "INSERT INTO scrap VALUES(?, SCRAPSEQ.nextval, ?)";
        Object[] param = new Object[] {scrap.getS_id(), scrap.getScrap_id()};
        jdbcUtil.setSqlAndParameters(sql, param);

        try {
            int result = jdbcUtil.executeUpdate();
            return result;
        } catch (Exception ex) {
            jdbcUtil.rollback();
            ex.printStackTrace();
        } finally {
            jdbcUtil.commit();
            jdbcUtil.close();
        }
        return 0;
    }

    public int remove(int s_id, int scrap_id) throws SQLException {
        String sql = "DELETE FROM scrap WHERE s_id=? AND scrap_id=?";
        jdbcUtil.setSqlAndParameters(sql, new Object[] {s_id, scrap_id});

        try {
            int result = jdbcUtil.executeUpdate();
            return result;
        } catch (Exception ex) {
            jdbcUtil.rollback();
            ex.printStackTrace();
        }
        finally {
            jdbcUtil.commit();
            jdbcUtil.close();
        }
        return 0;
    }

    public boolean isScraped(int s_id, int scrap_id) {
        String sql = "SELECT count(*) FROM scrap WHERE s_id=? AND scrap_id=?";
        jdbcUtil.setSqlAndParameters(sql, new Object[] {s_id, scrap_id});

        try {
            ResultSet rs = jdbcUtil.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                return (count == 1 ? true : false);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            jdbcUtil.close();
        }
        return false;
    }

    public List<Profile> findScarpList(int s_id) throws SQLException {
        String sql = "SELECT scrap_id, activation, name, pr_img, age, sleep_habit, lifestyle, smoking, grade, major, cleaning, indoor_eating, mbti, sharing, habitude "
                + "FROM scrap s JOIN profile p ON s.scrap_id=p.s_id "
                + "WHERE activation=1 AND s.s_id = ? "
                + "ORDER BY sc_id DESC";
        jdbcUtil.setSqlAndParameters(sql, new Object[] {s_id});

        try {
            ResultSet rs = jdbcUtil.executeQuery();
            List<Profile> ScrapList = new ArrayList<Profile>();
            while (rs.next()) {
                Profile scrap = new Profile(
                        rs.getInt("scrap_id"),
                        rs.getInt("activation"),
                        rs.getString("name"),
                        rs.getInt("pr_img"),
                        rs.getInt("age"),
                        rs.getInt("sleep_habit"),
                        rs.getInt("lifestyle"),
                        rs.getInt("smoking"),
                        rs.getInt("grade"),
                        rs.getString("major"),
                        rs.getInt("cleaning"),
                        rs.getInt("indoor_eating"),
                        rs.getInt("mbti"),
                        rs.getInt("sharing"),
                        rs.getInt("habitude"));
                ScrapList.add(scrap);				// List에 User 객체 저장
            }
            return ScrapList;

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            jdbcUtil.close();		// resource 반환
        }
        return null;
    }

//    public boolean isScraped(int s_id, int scrap_id) {
//        SqlSession sqlSession = sqlSessionFactory.openSession();
//        try {
//            int cnt = sqlSession.getMapper(ScrapMapper.class).isScraped(s_id, scrap_id);
//            return (cnt == 1 ? true : false);
//        } finally {
//            sqlSession.close();
//        }
//    }
//
//    public List<Profile> findScarpList(int s_id) {
//        SqlSession sqlSession = sqlSessionFactory.openSession();
//        try {
//            return sqlSession.getMapper(ScrapMapper.class).findScrapList(s_id);
//        } finally {
//            sqlSession.close();
//        }
//    }
}
