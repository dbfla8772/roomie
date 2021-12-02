package model.service;


import model.MyRoomie;
import model.Profile;
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

    public List<Profile> findMyRoomieList(int s_id) throws SQLException {
        return myRoomieDAO.findMyRoomieList(s_id);
    }
}
