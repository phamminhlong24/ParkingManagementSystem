/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import pm.dto.Notify;
import pm.dto.ParkingSlot;
import pm.utils.DBUtils;

/**
 *
 * @author tranh
 */
public class NotiDAO {

    public static boolean insertNotiByUserId(
            int userID,
            String notiDescript,
            String parkingSlot,
            String parkingType
            
    ) {
        try {
            //buoc 1: mo ket noi
            Connection cn = DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "insert into "
                        + "Notification(UserId,Noti_descriptions,Parking_Slot_Number, Parking_Type) "
                        + "Values (?,?,?,?)";
                PreparedStatement pst = cn.prepareStatement(sql);

                pst.setInt(1, userID);
                pst.setString(2, notiDescript);
                pst.setString(3, parkingSlot);
                pst.setString(4, parkingType);

                int count = pst.executeUpdate();

                if (count == 0) {
                    cn.close();
                    return false;
                } else {
                    cn.close();
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }

    public static ArrayList<Notify> getNotiInfoByUserid(int userId) {
        ArrayList<Notify> list = new ArrayList();
        try {
            //buoc 1: mo ket noi
            Connection cn = DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "SELECT * FROM Notification WHERE userId = ? order by NotiId desc\n";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, userId);
                ResultSet rs = pst.executeQuery();
                //buoc 3: doc ket qua cua buoc 2
                if (rs != null) {
                    while (rs.next()) {
                        userId = rs.getInt("UserId");
                        String noti_de = rs.getString("Noti_descriptions");
                        String parking_slot = rs.getString("Parking_Slot_Number");
                        String parking_type = rs.getString("Parking_Type");
                        list.add(new Notify(userId, noti_de, parking_slot, parking_type));
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public static ArrayList<Notify> getNotiInfoByHour(int userId) {
        ArrayList<Notify> list = new ArrayList();
        try {
            //buoc 1: mo ket noi
            Connection cn = DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "SELECT * FROM Notification WHERE userId = ? and Parking_Type= 'Hour' \n";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, userId);
                ResultSet rs = pst.executeQuery();
                //buoc 3: doc ket qua cua buoc 2
                if (rs != null) {
                    while (rs.next()) {
                        userId = rs.getInt("UserId");
                        String noti_de = rs.getString("Noti_descriptions");
                        String parking_slot = rs.getString("Parking_Slot_Number");
                        String parking_type = rs.getString("Parking_Type");
                        list.add(new Notify(userId, noti_de, parking_slot, parking_type));
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public static ArrayList<Notify> getNotiInfoByMonth(int userId) {
        ArrayList<Notify> list = new ArrayList();
        try {
            //buoc 1: mo ket noi
            Connection cn = DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "SELECT * FROM Notification WHERE userId = ? and Parking_Type= 'Month' \n";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, userId);
                ResultSet rs = pst.executeQuery();
                //buoc 3: doc ket qua cua buoc 2
                if (rs != null) {
                    while (rs.next()) {
                        userId = rs.getInt("UserId");
                        String noti_de = rs.getString("Noti_descriptions");
                        String parking_slot = rs.getString("Parking_Slot_Number");
                        String parking_type = rs.getString("Parking_Type");
                        list.add(new Notify(userId, noti_de, parking_slot, parking_type));
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public static void main(String[] args) {
        NotiDAO dao = new NotiDAO();
        ArrayList<Notify> list = dao.getNotiInfoByMonth(2);
        System.out.println(list.size());
        for (Notify notify : list) {
            System.out.println(notify.getSlotNumber());
        }
    }
}
