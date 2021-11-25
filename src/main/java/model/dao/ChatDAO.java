package model.dao;

import model.Chat;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ChatDAO {
    private JDBCUtil jdbcUtil = null;

    public ChatDAO() {
        jdbcUtil = new JDBCUtil();    // JDBCUtil 객체 생성
    }

    public int create(Chat chat) throws SQLException {
        String sql = "INSERT INTO chat VALUES (?, ?, CHATSEQ.nextval, ?, ?, ?)";
        Object[] param = new Object[]{chat.getMessage(), chat.getDatetime(), chat.getChatCheck(),
                                                            chat.getSender(), chat.getReceiver()};
        jdbcUtil.setSqlAndParameters(sql, param);    // JDBCUtil 에 insert문과 매개 변수 설정

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
}
