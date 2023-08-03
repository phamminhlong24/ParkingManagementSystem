/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import pm.dto.ParkingSlot;
import pm.utils.DBUtils;

/**
 *
 * @author KIM DUONG
 */
public class ParkingSlotDAO {

    //Zone A
    public static ArrayList<ParkingSlot> getParkingSlotsZoneA() {
        ArrayList<ParkingSlot> list = new ArrayList<>();
        try {
            //buoc 1: mo ket noi
            Connection cn = DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "SELECT * FROM Parking_Slot WHERE Parking_SlotID <= 15 \n";
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery(sql);
                //buoc 3: doc ket qua cua buoc 2
                while (rs.next()) {
                    int Parking_SlotID = rs.getInt("Parking_SlotID");
                    String Parking_Slot_Number = rs.getString("Parking_Slot_Number");
                    int Parking_Slot_Status = rs.getInt("Parking_Slot_Status");
                    ParkingSlot ps = new ParkingSlot(Parking_SlotID, Parking_Slot_Number, Parking_Slot_Status);
                    list.add(ps);
                }
                //buoc 4: dong ket noi
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    //End of Zone A

    //Zone B Left
    public static ArrayList<ParkingSlot> getParkingSlotsZoneB() {
        ArrayList<ParkingSlot> list = new ArrayList<>();
        try {
            //buoc 1: mo ket noi
            Connection cn = DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "SELECT Parking_SlotID, Parking_Slot_Number,Parking_Slot_Status "
                        + "FROM Parking_Slot WHERE Parking_SlotID > 15 AND Parking_SlotID <= 75 \n";
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery(sql);
                //buoc 3: doc ket qua cua buoc 2
                while (rs.next()) {
                    int Parking_SlotID = rs.getInt("Parking_SlotID");
                    String Parking_Slot_Number = rs.getString("Parking_Slot_Number");
                    int Parking_Slot_Status = rs.getInt("Parking_Slot_Status");
                    ParkingSlot ps = new ParkingSlot(Parking_SlotID, Parking_Slot_Number, Parking_Slot_Status);
                    list.add(ps);
                }
                //buoc 4: dong ket noi
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    //End of Zone B left left

    //Zone C left left
    public static ArrayList<ParkingSlot> getParkingSlotsZoneC() {
        ArrayList<ParkingSlot> list = new ArrayList<>();
        try {
            //buoc 1: mo ket noi
            Connection cn = DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "SELECT Parking_SlotID, Parking_Slot_Number,Parking_Slot_Status "
                        + "FROM Parking_Slot WHERE Parking_SlotID > 75 AND Parking_SlotID <= 135\n";
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery(sql);
                //buoc 3: doc ket qua cua buoc 2
                while (rs.next()) {
                    int Parking_SlotID = rs.getInt("Parking_SlotID");
                    String Parking_Slot_Number = rs.getString("Parking_Slot_Number");
                    int Parking_Slot_Status = rs.getInt("Parking_Slot_Status");
                    ParkingSlot ps = new ParkingSlot(Parking_SlotID, Parking_Slot_Number, Parking_Slot_Status);
                    list.add(ps);
                }
                //buoc 4: dong ket noi
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static ArrayList<Integer> getParkingSlotsId(int TimeStar, int TimeEnd) {
        ArrayList<Integer> list = new ArrayList<>();
        try {
            //buoc 1: mo ket noi
            Connection cn = DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "select * from TimeSlot ti left join Parking_Slot ps "
                        + "on ti.Parking_Slot_Number = ps.Parking_Slot_Number\n"
                        + "where ti.StartTime >= ? and ti.StartTime <= ? "
                        + "and ti.StartStatus  = 0  and ps.Parking_Slot_Status != 2 "
                        + "and ps.Parking_Slot_Status != 3";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, TimeStar);
                pst.setInt(2, TimeEnd);
                ResultSet rs = pst.executeQuery();

                //buoc 3: doc ket qua cua buoc 2
                while (rs.next()) {
                    int timeSlot = rs.getInt("Time_Slot_ID");

//                    ParkingSlot ps = new ParkingSlot(Parking_SlotID);
                    list.add(timeSlot);
//                    int result = new Random().nextInt(list.size());
//                    list.add(result);
                }
                //buoc 4: dong ket noi
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static int getIdSlot(ArrayList array) {
        int result = new Random().nextInt(array.size());
        return result;
    }

    public static String getSlotNameById(int Id) {
        String slotName = "";
        try {
            //buoc 1: mo ket noi
            Connection cn = DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "select ps.Parking_Slot_Number from TimeSlot ti left join Parking_Slot ps "
                        + "on ti.Parking_Slot_Number = ps.Parking_Slot_Number\n"
                        + "where ti.Time_Slot_Id = ? ";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, Id);
                ResultSet rs = pst.executeQuery();
                //buoc 3: doc ket qua cua buoc 2
                if (rs != null) {
                    while (rs.next()) {
                        String slotNameBooking = rs.getString("Parking_Slot_Number");
                        slotName = slotNameBooking;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return slotName;
    }

    public static String getSlotNameByIdMonth(int Id) {
        String slotName = "";
        try {
            //buoc 1: mo ket noi
            Connection cn = DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "SELECT Parking_Slot_Number FROM Parking_Slot WHERE Parking_slotID = ? \n";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, Id);
                ResultSet rs = pst.executeQuery();
                //buoc 3: doc ket qua cua buoc 2
                if (rs != null) {
                    while (rs.next()) {
                        String slotNameBooking = rs.getString("Parking_Slot_Number");
                        slotName = slotNameBooking;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return slotName;
    }

    public static ArrayList<Integer> getParkingSlotsId() {
        ArrayList<Integer> list = new ArrayList<>();
        try {
            //buoc 1: mo ket noi
            Connection cn = DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "select Parking_SlotID from Parking_Slot "
                        + "where Parking_Slot_Status = 0\n";
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery(sql);
                //buoc 3: doc ket qua cua buoc 2
                while (rs.next()) {
                    int Parking_SlotID = rs.getInt("Parking_SlotID");

//                    ParkingSlot ps = new ParkingSlot(Parking_SlotID);
                    list.add(Parking_SlotID);
//                    int result = new Random().nextInt(list.size());
//                    list.add(result);
                }
                //buoc 4: dong ket noi
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    //End of Zone C left right
    public static boolean updateSlotStatus(String slotName) {
        try {
            //buoc 1: mo ket noi
            Connection cn = DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "UPDATE Parking_slot\n"
                        + "SET Parking_Slot_Status = 1 \n"
                        + "WHERE Parking_Slot_Number = ? COLLATE Latin1_General_CS_AS";
                PreparedStatement pst = cn.prepareStatement(sql);

                pst.setString(1, slotName);

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

    public void updateParkingStatus(String status, String Parking_Slot_Number) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "UPDATE Parking_slot set [Parking_Slot_Status] = ?\n"
                    + "                     where Parking_Slot_Number = ?";
            con = new DBUtils().makeConnection();
            ps = con.prepareStatement(sql);

            ps.setString(1, status);
            ps.setString(2, Parking_Slot_Number);

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        } catch (Exception ex) {
            Logger.getLogger(ParkingSlotDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        ArrayList<Integer> list = new ArrayList<>();
        list = ParkingSlotDAO.getParkingSlotsId(22, 24);

        int a = getIdSlot(list);
        ParkingSlotDAO dao = new ParkingSlotDAO();
        String name = dao.getSlotNameById(a);

        System.out.println(a);
        System.out.println(name);
//        getIdSlot(list);
//        for (ParkingSlot parkingSlot : list) {
//            System.out.println(parkingSlot.getParkingSlotID());
//        }
    }
}
