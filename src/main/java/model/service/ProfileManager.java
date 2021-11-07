package model.service;

import model.Profile;
import model.dao.ProfileDAO;

import java.sql.SQLException;
import java.util.List;

public class ProfileManager {

    private ProfileDAO profileDAO;

    public Profile findCommunity(Profile profile) throws SQLException {
        Profile comm = profileDAO.findUsersInSearch(profile);

        List<Profile> memberList = .findUsersInCommunity(profile);
        comm.setMemberList(memberList);

        int numOfMembers = userDAO.getNumberOfUsersInCommunity(profile);
        comm.setNumOfMembers(numOfMembers);
        return comm;
    }


}
