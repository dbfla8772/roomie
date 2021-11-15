package model.service;

import model.Profile;
import model.Scrap;
import model.dao.ScrapDAO;

import java.sql.SQLException;
import java.util.List;

public class ScrapManager {

    private ScrapDAO scrapDAO;
    private static ScrapManager manager = new ScrapManager();

    private ScrapManager() {
        try {
            scrapDAO = new ScrapDAO();
            /*userAanlysis = new UserAnalysis(studentDao);*/
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static ScrapManager getInstance() {
        return manager;
    }

    public int create(Scrap scrap) throws SQLException, ExistingStudentException {
        return scrapDAO.create(scrap);
    }

    public int update(Scrap scrap) throws SQLException {
        return scrapDAO.remove(scrap);
    }

    public List<Profile> findScarpList(int s_id) throws SQLException, StudentNotFoundException {
        return scrapDAO.findScarpList(s_id);
    }
}
