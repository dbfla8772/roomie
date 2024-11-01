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
        jdbcUtil = new JDBCUtil();
    }

    public int create(Point point) throws SQLException {
        String sql = "INSERT INTO point VALUES (?, ?, ?)";
        Object[] param = new Object[] {point.getPoint_binary(), point.getPoint_dec(), point.getS_id()};
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

    public int update(Point point) throws SQLException {
        String sql = "UPDATE point "
                + "SET point_binary=?, point_dec=? "
                + "WHERE s_id=?";

        Object[] param = new Object[] {point.getPoint_binary(), point.getPoint_dec(), point.getS_id()};
        jdbcUtil.setSqlAndParameters(sql, param);

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

    public Point findPoint(int sId) throws SQLException {
        String sql = "SELECT s_id, point_binary, point_dec " +
                "FROM point " + "WHERE s_id=?";
        jdbcUtil.setSqlAndParameters(sql, new Object[]{sId});

        Point point = null;
        try {
            ResultSet rs = jdbcUtil.executeQuery();
            if (rs.next()) {
                point = new Point(
                        rs.getInt("s_id"),
                        rs.getString("point_binary"),
                        rs.getString("point_dec"));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            jdbcUtil.close();
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
            jdbcUtil.close();
        }

        String sql = "SELECT p.s_id, point_binary, point_dec "
                + "FROM POINT p JOIN STUDENT s ON p.s_id = s.s_id JOIN PROFILE pr ON p.s_id = pr.s_id "
                + "WHERE pr.activation=1 AND s.gender=? AND s.c_id=? AND NOT p.s_id IN (?)";
        jdbcUtil.setSqlAndParameters(sql, new Object[]{gender, c_id, sId});

       Point point = null;

            try {
                ResultSet rs = jdbcUtil.executeQuery();
                List<Point> pointList = new ArrayList<Point>();
                while (rs.next()) {
                    point = new Point(
                            rs.getInt("s_id"),
                            rs.getString("point_binary"),
                            rs.getString("point_dec"));
                    pointList.add(point);
                }
                return pointList;
            } catch (Exception ex) {
            ex.printStackTrace();
            } finally {
            jdbcUtil.close();
            }
            return null;
    }
}
