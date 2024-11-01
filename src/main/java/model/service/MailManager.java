package model.service;

import model.Mail;
import model.Scrap;
import model.dao.MailDAO;

import java.sql.SQLException;
import java.util.List;

public class MailManager {

    private MailDAO mailDAO;
    private static MailManager manager = new MailManager();

    private MailManager() {
        try {
            mailDAO = new MailDAO();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static MailManager getInstance() {
        return manager;
    }

    public int create(Mail mail) throws SQLException, ExistingStudentException {
        return mailDAO.create(mail);
    }

    public int remove(int ch_id) throws SQLException {
        return mailDAO.remove(ch_id);
    }

    public Mail findsendMail(int ch_id) throws Exception {
        Mail mail = mailDAO.findsendMail(ch_id);

        if (mail == null) {
            throw new Exception("존재하지 않는 메세지입니다.");
        }
        return mail;
    }

    public Mail findreceiveMail(int ch_id) throws Exception {
        Mail mail = mailDAO.findreceiveMail(ch_id);

        if (mail == null) {
            throw new Exception("존재하지 않는 메세지입니다.");
        }
        return mail;
    }

    public List<Mail> findReceiveMailList(int s_id) throws SQLException {
       return mailDAO.findReceiveMailList(s_id);
    }

    public List<Mail> findSendMailList(int s_id) throws SQLException {
        return mailDAO.findSendMailList(s_id);
    }

}
