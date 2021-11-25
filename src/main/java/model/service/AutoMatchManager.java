package model.service;

import model.Point;
import model.Profile;
import model.Scrap;
import model.dao.PointDAO;
import model.dao.ScrapDAO;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

public class AutoMatchManager {
    private PointDAO pointDAO;
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
        List<Integer> sortedList = null;
        HashMap<Integer, Integer> cnt = new HashMap<>();

        int logDec = Integer.parseInt(loginP.getPoint_dec());
        int logBin = Integer.parseInt(loginP.getPoint_binary());

        int dec, bin;

        for (int i = 0; i < pointList.size(); i++) {
            dec = Integer.parseInt(pointList.get(i).getPoint_dec());
            bin = Integer.parseInt(pointList.get(i).getPoint_binary());

            if (logDec == dec) {
                sortedList.add(pointList.get(i).getS_id());
            } else {
                String b = Integer.toBinaryString(logBin ^ bin);
                cnt.put(14 - countChar(b, '1'), pointList.get(i).getS_id());
            }
        }
        Object[] pointMap = cnt.keySet().toArray();
        Arrays.sort(pointMap);

        for (Integer key : cnt.keySet()) {
            sortedList.add(cnt.get(key));
        }
        return sortedList;
    }
}
