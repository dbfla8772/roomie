package model.dao;

import model.Profile;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProfileDAO {
    private JDBCUtil jdbcUtil = null;

    public ProfileDAO() {
        jdbcUtil = new JDBCUtil();
    }

    public int create(Profile profile) throws SQLException {
        String sql = "INSERT INTO PROFILE VALUES (1, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        Object[] param = new Object[] {
                profile.getName(), profile.getPr_img(), profile.getAge(), profile.getSleep_habit(),
                profile.getLifestyle(), profile.getSmoking(), profile.getGrade(), profile.getMajor(),
                profile.getCleaning(), profile.getIndoor_eating(), profile.getMbti(),
                profile.getSharing(), profile.getHabitude(), profile.getS_id()};
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

    public int update(Profile profile) throws SQLException {
        String sql = "UPDATE PROFILE "
                + "SET activation=?, name=?, pr_img=?, age=?, sleep_habit=?, lifestyle=?, smoking=?, grade=?, " +
                "major=?, mbti=?, cleaning=?, indoor_eating=?, sharing=?, habitude=?"
                + "WHERE s_id=?";
        Object[] param = new Object[] {profile.getActivation(),
                profile.getName(), profile.getPr_img(), profile.getAge(), profile.getSleep_habit(),
                profile.getLifestyle(), profile.getSmoking(), profile.getGrade(), profile.getMajor(),
                profile.getMbti(), profile.getCleaning(), profile.getIndoor_eating(),
                profile.getSharing(), profile.getHabitude(),
                profile.getS_id()};
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


    //주어진 사용자 ID에 해당하는 사용자 정보를 데이터베이스에서 찾아 Profile 도메인 클래스에저장하여 반환
    public Profile findProfile(int s_Id) throws SQLException {
        String sql = "SELECT activation, name, pr_img, age, sleep_habit, lifestyle, smoking, grade, " +
                "major, mbti, cleaning, indoor_eating, sharing, habitude "
                + "FROM PROFILE "
                + "WHERE s_id=? ";
        jdbcUtil.setSqlAndParameters(sql, new Object[] {s_Id});

        try {
            ResultSet rs = jdbcUtil.executeQuery();
            if (rs.next()) {
                Profile profile = new Profile(
                        s_Id,
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
                        rs.getInt("habitude")
                );
                return profile;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            jdbcUtil.close();
        }
        return null;
    }


    //해당 학교 전체 사용자 정보를 검색하여 List에 저장 및 반환
    public List<Profile> findProfileList(int c_Id, int gender, int s_id) throws SQLException {
        String sql = "SELECT activation, name, pr_img, age, sleep_habit, lifestyle, smoking, grade, " +
                "major, cleaning, indoor_eating, mbti, sharing, habitude, p.s_id "
                + "FROM PROFILE p JOIN STUDENT s ON p.s_id = s.s_id "
                + "WHERE activation=1 AND s.c_id=? AND s.gender=? AND NOT p.s_id IN (?) "
                + "ORDER BY p.s_id";
        jdbcUtil.setSqlAndParameters(sql, new Object[] {c_Id, gender, s_id},
                ResultSet.TYPE_SCROLL_INSENSITIVE,
                ResultSet.CONCUR_READ_ONLY);

        try {
            ResultSet rs = jdbcUtil.executeQuery();
            List<Profile> profileList = new ArrayList<Profile>();

            while (rs.next()) {
                Profile profile = new Profile(
                        rs.getInt("s_id"),
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
                profileList.add(profile);
            }
            return profileList;

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            jdbcUtil.close();
        }
        return null;
    }


    /*search*/
    public List<Profile> findProfileList(int s_id, int sleep_habit, int lifestyle, int smoking, int grade, String major,
                                         int cleaning, int indoor_eating, int mbti, int sharing, int habitude)
            throws SQLException {
        String sql1 = "SELECT gender, c_id "
                + "FROM PROFILE p JOIN STUDENT s ON p.s_id = s.s_id "
                + "WHERE s.s_id=?";
        jdbcUtil.setSqlAndParameters(sql1, new Object[] {s_id});
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

        String sql2 = "SELECT p.s_id, activation, name, pr_img, age, sleep_habit, lifestyle, smoking, grade, " +
                "major, cleaning, indoor_eating, mbti, sharing, habitude "
                + "FROM PROFILE p JOIN STUDENT s ON p.s_id = s.s_id "
                + "WHERE activation=1 AND s.gender=? AND s.c_id=? AND NOT p.s_id IN (?)";

        List<Object> params = new ArrayList<>();

        params.add(gender);
        params.add(c_id);
        params.add(s_id);

        if (sleep_habit != -1) {
            sql2 += "AND sleep_habit=? ";
            params.add(sleep_habit);
        }
        if (lifestyle != -1) {
            sql2 += "AND lifestyle=? ";
            params.add(lifestyle);
        }
        if (smoking != -1) {
            sql2 += "AND smoking=? ";
            params.add(smoking);
        }
        if (grade != -1) {
            sql2 += "AND grade=? ";
            params.add(grade);
        }
        if (major != null) {
            sql2 += "AND major=? ";
            params.add(major);
        }
        if (cleaning != -1) {
            sql2 += "AND cleaning=? ";
            params.add(cleaning);
        }
        if (indoor_eating != -1) {
            sql2 += "AND indoor_eating=? ";
            params.add(indoor_eating);
        }
        if (mbti != -1) {
            sql2 += "AND mbti=? ";
            params.add(mbti);
        }
        if (sharing != -1) {
            sql2 += "AND sharing=? ";
            params.add(sharing);
        }
        if (habitude != -1) {
            sql2 += "AND habitude=? ";
            params.add(habitude);
        }
        sql2 += "ORDER BY p.s_id";

        int size = params.size();
        Object[] param = params.toArray(new Object[size]);

        jdbcUtil.setSqlAndParameters(sql2,
                param, ResultSet.TYPE_SCROLL_INSENSITIVE,
                ResultSet.CONCUR_READ_ONLY);

        try {
            ResultSet rs = jdbcUtil.executeQuery();
            List<Profile> profileList = new ArrayList<Profile>();
            while (rs.next()) {
                Profile profile = new Profile(
                        rs.getInt("s_id"),
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
                profileList.add(profile);
            }
            return profileList;

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            jdbcUtil.close();
        }
        return null;
    }

}
