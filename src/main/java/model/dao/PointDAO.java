package model.dao;
import model.Point;
import model.Profile;

import java.sql.ResultSet;
import java.sql.SQLException;

public class PointDAO {
    private JDBCUtil jdbcUtil = null;

    public PointDAO() {
        jdbcUtil = new JDBCUtil();	// JDBCUtil 객체 생성
    }

    public Point create(Point point) throws SQLException {
        String sql = "INSERT INTO point VALUES (Idseq.nextval, ?, ?, ?)";
        Object[] param = new Object[] {point.getPoint_binary(), point.getPoint_dec(),
                point.getS_id()};
        jdbcUtil.setSqlAndParameters(sql, param);	// JDBCUtil 에 insert문과 매개 변수 설정

        String key[] = {"pt_id"};	// PK 컬럼의 이름
        try {
            jdbcUtil.executeUpdate(key);  // insert 문 실행
            ResultSet rs = jdbcUtil.getGeneratedKeys();
            if(rs.next()) {
                int generatedKey = rs.getInt(1);   // 생성된 PK 값
                point.setPt_id(generatedKey);
            }
            return point;
        } catch (Exception ex) {
            jdbcUtil.rollback();
            ex.printStackTrace();
        } finally {
            jdbcUtil.commit();
            jdbcUtil.close();	// resource 반환
        }
        return null;
    }

    public int update(Point point) throws SQLException {
        String sql = "UPDATE point "
                + "SET cName=?, descr=?, chairId=? "
                + "WHERE cId=?";
        String chairId = comm.getChairId();
        if (chairId.equals("")) chairId = null;
        Object[] param = new Object[] {comm.getName(), comm.getDescription(),
                chairId, comm.getId()};
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

    public Point findPoint(Point point) throws SQLException {
        String sql = "";
        jdbcUtil.setSqlAndParameters(sql, new Object[] {userId});	// JDBCUtil에 query문과 매개 변수 설정

        try {
            ResultSet rs = jdbcUtil.executeQuery();		// query 실행
            if (rs.next()) {						// 학생 정보 발견
                User user = new User(		// User 객체를 생성하여 학생 정보를 저장
                        userId,
                        rs.getString("password"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getInt("commId"),
                        rs.getString("cName"));
                return user;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            jdbcUtil.close();		// resource 반환
        }
        return null;
    }


}
