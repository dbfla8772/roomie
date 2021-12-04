package model.service;

import controller.extra.AutoMatchController;
import model.Point;
import model.Profile;
import model.Scrap;
import model.dao.PointDAO;
import model.dao.ScrapDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.SQLException;
import java.util.*;

public class AutoMatchManager {
    private PointDAO pointDAO;
    private static final Logger log = LoggerFactory.getLogger(AutoMatchManager.class);
    private static AutoMatchManager manager = new AutoMatchManager();

    private AutoMatchManager() {
        try {
            pointDAO = new PointDAO();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static AutoMatchManager getInstance() {
        return manager;
    }

    public int create(Point point) throws SQLException, ExistingStudentException {
        return pointDAO.create(point);
    }

    public int update(Point point) throws SQLException {
        return pointDAO.update(point);
    }

    public Point findPoint(int s_id) throws SQLException {
        return pointDAO.findPoint(s_id);
    }

    public List<Point> findPointList(int s_id) throws SQLException {
        return pointDAO.findPointList(s_id);
    }

    public static int countChar(String str, char ch) {
        int count = 0;
        for (int i = 0; i < str.length(); i++) {
            if (str.charAt(i) == ch) {
                count++;
            }
        }
        return count;
    }

    public List<Integer> sortedPointList(int s_id) throws SQLException {
        Point loginP = findPoint(s_id);
        List<Point> pointList = findPointList(s_id);
        List<Integer> sortedList = new ArrayList<Integer>();
        Map<Integer, Integer> cnt = new HashMap<>();

        String logDec = loginP.getPoint_dec();
        String logBin = loginP.getPoint_binary();

        String dec, bin;
        int count;

        for (int i = 0; i < pointList.size(); i++) {
            dec = pointList.get(i).getPoint_dec();
            bin = pointList.get(i).getPoint_binary();
            count = 0;

            if (logDec.equals(dec)) {
                sortedList.add(pointList.get(i).getS_id());
            } else {
                for (int j = 0; j < bin.length(); j++) {
                    if (logBin.charAt(j) == bin.charAt(j)) {
                        count++;
                    }
                }
                cnt.put(count, pointList.get(i).getS_id());
            }
        }
        Object[] pointMap = cnt.keySet().toArray();
        Arrays.sort(pointMap);

        for (Integer key : cnt.keySet()) {
            sortedList.add(cnt.get(key));
        }
        log.debug("Sorted list:::" + sortedList);
        return sortedList;
    }
}
