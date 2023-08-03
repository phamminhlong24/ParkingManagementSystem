/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pm.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import pm.dto.Booking;
import pm.dto.TimeEnd;
import pm.dto.TimeStart;
import pm.utils.DBUtils;

/**
 *
 * @author tranh
 */
public class TimeDAO {
        public static ArrayList<TimeStart> getAllTimeStart() {
        ArrayList<TimeStart> list = new ArrayList<>();
        try {
            //buoc 1: mo ket noi
            Connection cn = DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "SELECT * FROM TimeStart \n";
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery(sql);
                //buoc 3: doc ket qua cua buoc 2
                while (rs.next()) {
                    int timStartID = rs.getInt("Time_Slot_Id");
                    
                    int startTime = rs.getInt("StartTime");
                    
                    TimeStart time = new TimeStart(timStartID, startTime);
                    list.add(time);
                }
                //buoc 4: dong ket noi
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
        
        public static ArrayList<TimeEnd> getAllTimeEnd() {
        ArrayList<TimeEnd> list = new ArrayList<>();
        try {
            //buoc 1: mo ket noi
            Connection cn = DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "SELECT * FROM TimeEnd \n";
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery(sql);
                //buoc 3: doc ket qua cua buoc 2
                while (rs.next()) {
                    int timStartID = rs.getInt("Time_Slot_Id");
                    
                    int endTime = rs.getInt("EndTime");
                    
                    TimeEnd time = new TimeEnd(timStartID, endTime);
                    list.add(time);
                }
                //buoc 4: dong ket noi
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
        
        public static void main(String[] args) {
        ArrayList<TimeStart> list = new ArrayList();
        TimeDAO dao = new TimeDAO();
        list = dao.getAllTimeStart();
            for (TimeStart timeStart : list) {
                System.out.println(timeStart.getTimeStart());
            }
    }
}
