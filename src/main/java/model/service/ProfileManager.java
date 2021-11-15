package model.service;

import model.Profile;
import model.dao.ProfileDAO;

import java.sql.SQLException;
import java.util.List;

public class ProfileManager {

    private ProfileDAO profileDAO;
    private static ProfileManager manager = new ProfileManager();
    //private StudentAnalysis userAanlysis;

    private ProfileManager() {
        try {
            profileDAO = new ProfileDAO();
            /*userAanlysis = new UserAnalysis(studentDao);*/
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static ProfileManager getInstance() {
        return manager;
    }

    public int create(Profile profile) throws SQLException, ExistingStudentException {
        return profileDAO.create(profile);
    }

    public int update(Profile profile) throws SQLException {
        return profileDAO.update(profile);
    }


    public Profile findProfile(int studentId)
            throws SQLException, StudentNotFoundException {
        Profile profile = profileDAO.findProfile(studentId);

        if (profile == null) {
            throw new StudentNotFoundException(studentId + "는 존재하지 않는 프로필입니다.");
        }
        return profile;
    }

    public List<Profile> findUserList(int c_id, int gender, int s_id) throws SQLException, StudentNotFoundException {
        return profileDAO.findUserList(1, 10, c_id, gender, s_id);
    }

    public List<Profile> findProfileList(int c_id, int gender, int s_id) throws SQLException, StudentNotFoundException {
        return profileDAO.findProfileList(c_id, gender, s_id);
    }

    /*public List<Profile> findUserListPage(int currentPage, int countPerPage, int c_id, int gender, int s_id) throws SQLException, StudentNotFoundException {
        return profileDAO.findUserList(currentPage, countPerPage, c_id, gender, s_id);
    }*/

    /*search 필터를 프로필 객체로 전달*/
    public List<Profile> findProfileList(int studentId, int sleep_habit, int lifestyle, int smoking,
                                         int cleaning, int indoor_eating, int mbti, int sharing, int habitude)
            throws SQLException, StudentNotFoundException {
        return profileDAO.findProfileList(studentId, sleep_habit, lifestyle, smoking,
                cleaning, indoor_eating, mbti, sharing, habitude);
    }


}
