package model.dao;

import model.Mail;
import model.Profile;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MailDAO {
    private JDBCUtil jdbcUtil = null;

    public MailDAO() {
        jdbcUtil = new JDBCUtil();    // JDBCUtil 객체 생성
    }

    public int create(Mail mail) throws SQLException {
        String sql = "INSERT INTO mail VALUES (?, CHATSEQ.nextval, ?, ?, ?, ?)";
        Object[] param = new Object[]{mail.getMessage(), mail.getMailCheck(),
                                                            mail.getSender(), mail.getReceiver(),  mail.getDatetime()};
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

    public int remove(int ch_id) throws SQLException {
        String sql = "DELETE FROM mail WHERE ch_id=?";
        jdbcUtil.setSqlAndParameters(sql, new Object[] {ch_id});

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

    public Mail findMail(int ch_id) throws SQLException {
        String sql = "SELECT sender, receiver, message, mail_check, datetime "
                + "FROM MAIL "
                + "WHERE ch_id=?";
        jdbcUtil.setSqlAndParameters(sql, new Object[] {ch_id});

        try {
            ResultSet rs = jdbcUtil.executeQuery();		// query 실행
            if (rs.next()) {						// 학생 정보 발견
                Mail mail = new Mail(		// Profile 객체를 생성하여 정보를 저장
                        ch_id,
                        rs.getInt("sender"),
                        rs.getInt("receiver"),
                        rs.getString("message"),
                        rs.getString("datetime"),
                        rs.getInt("mail_check")
                );
                return mail;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            jdbcUtil.close();		// resource 반환
        }
        return null;
    }

    //받은 메일 리스트
    public List<Mail> findReceiveMailList(int s_id) {
        String sql = "SELECT ch_id, name, message, datetime, mail_check "
                + "FROM MAIL m JOIN Profile p ON p.s_id=m.sender "
                + "WHERE receiver=? "
                + "ORDER BY ch_id DESC";

        jdbcUtil.setSqlAndParameters(sql, new Object[] {s_id});

        try {
            ResultSet rs = jdbcUtil.executeQuery();				// query 실행
            List<Mail> mailList = new ArrayList<Mail>();

            while (rs.next()) {						// 학생 정보 발견
                Mail mail = new Mail(		// Profile 객체를 생성하여 정보를 저장
                        rs.getInt("ch_id"),
                        rs.getString("name"),
                        String.valueOf(s_id),
                        rs.getString("message"),
                        rs.getString("datetime"),
                        rs.getInt("mail_check")
                );
                mailList.add(mail);
            }
            return mailList;

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            jdbcUtil.close();		// resource 반환
        }
        return null;
    }

    // 보낸 메일 리스트
    public List<Mail> findSendMailList(int s_id) {
        String sql = "SELECT ch_id, name, message, datetime, mail_check "
                + "FROM MAIL m JOIN Profile p ON p.s_id=m.receiver "
                + "WHERE sender=?";
        jdbcUtil.setSqlAndParameters(sql, new Object[] {s_id});

        try {
            ResultSet rs = jdbcUtil.executeQuery();				// query 실행
            List<Mail> mailList = new ArrayList<Mail>();

            while (rs.next()) {						// 학생 정보 발견
                Mail mail = new Mail(		// Profile 객체를 생성하여 정보를 저장
                        rs.getInt("ch_id"),
                        String.valueOf(s_id),
                        rs.getString("name"),
                        rs.getString("message"),
                        rs.getString("datetime"),
                        rs.getInt("mail_check")
                );
                mailList.add(mail);
            }
            return mailList;
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            jdbcUtil.close();		// resource 반환
        }
        return null;
    }
}
