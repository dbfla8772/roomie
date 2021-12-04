package model.dao;
import model.Point;
import model.Profile;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PointDAO {
    private JDBCUtil jdbcUtil = null;

    public PointDAO() {
        jdbcUtil = new JDBCUtil();	// JDBCUtil 객체 생성
    }

    public int create(Point point) throws SQLException {
        String sql = "INSERT INTO point VALUES (?, ?, ?)";
        Object[] param = new Object[] {point.getPoint_binary(), point.getPoint_dec(), point.getS_id()};
        jdbcUtil.setSqlAndParameters(sql, param);	// JDBCUtil 에 insert문과 매개 변수 설정

        try {
            int result = jdbcUtil.executeUpdate();	// insert 문 실행
            return result;
        } catch (Exception ex) {
            jdbcUtil.rollback();
            ex.printStackTrace();
        } finally {
            jdbcUtil.commit();
            jdbcUtil.close();	// resource 반환
        }
        return 0;
    }

    public int update(Point point) throws SQLException {
        String sql = "UPDATE point "
                + "SET point_binary=?, point_dec=? "
                + "WHERE s_id=?";

        Object[] param = new Object[] {point.getPoint_binary(), point.getPoint_dec(), point.getS_id()};
        jdbcUtil.setSqlAndParameters(sql, param);	// JDBCUtil에 update문과 매개 변수 설정

        try {
            int result = jdbcUtil.executeUpdate();	// update 문 실행
            return result;
        } catch (Exception ex) {
            jdbcUtil.rollback();
            ex.printStackTrace();
        }
        finally {
            jdbcUtil.commit();
            jdbcUtil.close();	// resource 반환
        }
        return 0;
    }

    public Point findPoint(int sId) throws SQLException {
        String sql = "SELECT s_id, point_binary, point_dec " +
                "FROM point " + "WHERE s_id=?";
        jdbcUtil.setSqlAndParameters(sql, new Object[]{sId});    // JDBCUtil에 query문과 매개 변수 설정

        Point point = null;
        try {
            ResultSet rs = jdbcUtil.executeQuery();        // query 실행
            if (rs.next()) {                        // 학생 정보 발견
                point = new Point(        // Community 객체를 생성하여 커뮤니티 정보를 저장
                        rs.getInt("s_id"),
                        rs.getString("point_binary"),
                        rs.getString("point_dec"));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            jdbcUtil.close();        // resource 반환
        }
        return point;
    }

    public List<Point> findPointList(int sId) throws SQLException {
        String sql1 = "SELECT gender, c_id "
                + "FROM STUDENT s "
                + "WHERE s.s_id=?";
        jdbcUtil.setSqlAndParameters(sql1, new Object[] {sId});

        int gender = 0;
        int c_id = 0;
        try {
            ResultSet rs = jdbcUtil.executeQuery();
            while (rs.next()) {
                gender = rs.getInt("gender");
                c_id = rs.getInt("c_id");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            jdbcUtil.close();		// resource 반환
        }

        String sql = "SELECT p.s_id, point_binary, point_dec "
                + "FROM POINT p JOIN STUDENT s ON p.s_id = s.s_id "
                + "WHERE activation = 1 AND s.gender=? AND s.c_id=? AND NOT p.s_id IN (?)";
        jdbcUtil.setSqlAndParameters(sql, new Object[]{gender, c_id, sId});    // JDBCUtil에 query문과 매개 변수 설정

       Point point = null;

            try {
                ResultSet rs = jdbcUtil.executeQuery();        // query 실행
                List<Point> pointList = new ArrayList<Point>();
                while (rs.next()) {                        // 학생 정보 발견
                    point = new Point(        // Community 객체를 생성하여 커뮤니티 정보를 저장
                            rs.getInt("s_id"),
                            rs.getString("point_binary"),
                            rs.getString("point_dec"));
                    pointList.add(point);
                }
                return pointList;
            } catch (Exception ex) {
            ex.printStackTrace();
            } finally {
            jdbcUtil.close();        // resource 반환
            }
            return null;
    }
}
