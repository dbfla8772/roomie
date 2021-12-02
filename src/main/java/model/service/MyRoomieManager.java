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

    public int remove(MyRoomie myroomie) throws SQLException {
        return myRoomieDAO.remove(myroomie);
    }

    public boolean isPicked(int s_id, int roomie_id) throws SQLException {
        return myRoomieDAO.isPicked(s_id, roomie_id);
    }

    public List<Profile> findMyRoomieList(int s_id) throws SQLException {
        return myRoomieDAO.findMyRoomieList(s_id);
    }

    public List<Profile> findWaitRoomieList(int s_id) throws SQLException {
        return myRoomieDAO.findWaitRoomieList(s_id);
    }
}
