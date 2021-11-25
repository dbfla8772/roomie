package model.dao;

import model.Mail;

import java.sql.SQLException;

public class MailDAO {
    private JDBCUtil jdbcUtil = null;

    public MailDAO() {
        jdbcUtil = new JDBCUtil();    // JDBCUtil 객체 생성
    }

    public int create(Mail mail) throws SQLException {
        String sql = "INSERT INTO mail VALUES (?, ?, CHATSEQ.nextval, ?, ?, ?)";
        Object[] param = new Object[]{mail.getMessage(), mail.getDatetime(), mail.getChatCheck(),
                                                            mail.getSender(), mail.getReceiver()};
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

    public Mail findMail(int ch_id) {
    }

    public Mail findMailList(int s_id) {
    }
}
