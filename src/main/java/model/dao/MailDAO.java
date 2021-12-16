package model.dao;

import model.Mail;
import model.Profile;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import static jdk.nashorn.internal.runtime.regexp.joni.Config.log;

public class MailDAO {
    private JDBCUtil jdbcUtil = null;

    public MailDAO() {
        jdbcUtil = new JDBCUtil();
    }

    public int create(Mail mail) throws SQLException {
        String sql = "INSERT INTO mail VALUES (?, ?, MAILSEQ.nextval, ?, ?, ?)";
        Object[] param = new Object[]{mail.getMessage(), mail.getDatetime(), mail.getMailCheck(),
                                                            mail.getSender(), mail.getReceiver()};
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

    public int remove(int m_id) throws SQLException {
        String sql = "DELETE FROM mail WHERE m_id=?";
        jdbcUtil.setSqlAndParameters(sql, new Object[] {m_id});

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

    //보낸 메일
    public Mail findsendMail(int m_id) throws SQLException {
        String sql = "SELECT sender, receiver, message, mail_check, datetime "
                + "FROM MAIL "
                + "WHERE m_id=?";
        jdbcUtil.setSqlAndParameters(sql, new Object[] {m_id});

        try {
            ResultSet rs = jdbcUtil.executeQuery();
            if (rs.next()) {
                Mail mail = new Mail(
                        m_id,
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
            jdbcUtil.close();
        }
        return null;
    }

    //받은 메일
    public Mail findreceiveMail(int m_id) throws SQLException {
        String sql1 = "UPDATE MAIL SET mail_check=1 WHERE m_id=?";
        jdbcUtil.setSqlAndParameters(sql1, new Object[] {m_id});

        try {
            int result = jdbcUtil.executeUpdate();
        } catch (Exception ex) {
            jdbcUtil.rollback();
            ex.printStackTrace();
        }
        finally {
            jdbcUtil.commit();
            jdbcUtil.close();
        }

        String sql = "SELECT sender, receiver, message, mail_check, datetime "
                + "FROM MAIL "
                + "WHERE m_id=?";
        jdbcUtil.setSqlAndParameters(sql, new Object[] {m_id});

        try {
            ResultSet rs = jdbcUtil.executeQuery();
            if (rs.next()) {
                Mail mail = new Mail(
                        m_id,
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
            jdbcUtil.close();
        }
        return null;
    }

    //받은 메일 리스트
    public List<Mail> findReceiveMailList(int s_id) {
        String sql = "SELECT m_id, name, message, datetime, mail_check "
                + "FROM MAIL m JOIN Profile p ON p.s_id=m.sender "
                + "WHERE receiver=? "
                + "ORDER BY m_id DESC";

        jdbcUtil.setSqlAndParameters(sql, new Object[] {s_id});

        try {
            ResultSet rs = jdbcUtil.executeQuery();
            List<Mail> mailList = new ArrayList<Mail>();

            while (rs.next()) {
                Mail mail = new Mail(
                        rs.getInt("m_id"),
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
            jdbcUtil.close();
        }
        return null;
    }

    // 보낸 메일 리스트
    public List<Mail> findSendMailList(int s_id) {
        String sql = "SELECT m_id, name, message, datetime, mail_check "
                + "FROM MAIL m JOIN Profile p ON p.s_id=m.receiver "
                + "WHERE sender=?";
        jdbcUtil.setSqlAndParameters(sql, new Object[] {s_id});

        try {
            ResultSet rs = jdbcUtil.executeQuery();
            List<Mail> mailList = new ArrayList<Mail>();

            while (rs.next()) {
                Mail mail = new Mail(
                        rs.getInt("m_id"),
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
            jdbcUtil.close();
        }
        return null;
    }
}
