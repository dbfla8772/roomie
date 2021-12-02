package model.service;


import model.MyRoomie;
import model.Profile;
import model.Scrap;
import model.dao.MyRoomieDAO;

import java.sql.SQLException;
import java.util.List;

public class MyRoomieManager {
    private MyRoomieDAO myRoomieDAO;
    private static MyRoomieManager manager = new MyRoomieManager();

    private MyRoomieManager() {
        try {
            myRoomieDAO = new MyRoomieDAO();
            /*userAanlysis = new UserAnalysis(studentDao);*/
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static MyRoomieManager getInstance() {
        return manager;
    }

    public int create(MyRoomie myroomie) throws SQLException, ExistingStudentException {
        return myRoomieDAO.create(myroomie);
    }

    public boolean isPicked(MyRoomie myroomie) throws SQLException {
        return myRoomieDAO.isPicked(myroomie);
    }

    public List<Profile> findMyRoomieList(int s_id) throws SQLException {
        return myRoomieDAO.findMyRoomieList(s_id);
    }
}
