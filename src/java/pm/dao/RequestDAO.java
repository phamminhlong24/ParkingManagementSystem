/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pm.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import pm.dto.Request;

import pm.utils.DBUtils;

/**
 *
 * @author tranh
 */
public class RequestDAO {

    public static boolean insertRequest(
            int BookingID,
            int userID,
            String PlateNumber,
            String SlotNumber,
            String RequestDate) {
        try {
            //buoc 1: mo ket noi
            Connection cn = DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "insert into "
                        + "Request(BookingID,Vehicle_PlateNumber,Parking_Slot_Number, Request_Status, userID, Request_Date) "
                        + "Values (?,?,?,0,?,?)";
                PreparedStatement pst = cn.prepareStatement(sql);

                pst.setInt(1, BookingID);
                pst.setString(2, PlateNumber);
                pst.setString(3, SlotNumber);
                pst.setInt(4, userID);
                pst.setString(5, RequestDate);

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

    public static int getUserStatusByUserName(String userName) {
        int status = -1;
        try {
            //buoc 1: mo ket noi
            Connection cn = DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "SELECT status FROM UserA WHERE UserName = ? \n";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, userName);
                ResultSet rs = pst.executeQuery();
                //buoc 3: doc ket qua cua buoc 2
                if (rs != null) {
                    while (rs.next()) {
                        int statusUser = rs.getInt("status");
                        status = statusUser;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public static ArrayList<Request> getAllRequestUserScreen(int UserID) {
        ArrayList<Request> list = new ArrayList<>();
        try {
            //buoc 1: mo ket noi
            Connection cn = DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "SELECT * FROM Request where UserID = ? \n";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, UserID);
                ResultSet rs = pst.executeQuery();
                //buoc 3: doc ket qua cua buoc 2
                while (rs.next()) {
                    int RequestID = rs.getInt("RequestID");
                    int BookingID = rs.getInt("BookingID");
                    int Request_Status = rs.getInt("Request_Status");
                    UserID = rs.getInt("UserID");
                    String requestDate = rs.getString("Request_Date");
                    Request rq = new Request(RequestID, BookingID, Request_Status, UserID, requestDate);
                    list.add(rq);
                }
                //buoc 4: dong ket noi
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static ArrayList<Request> getAllRequestAdminScreen() {
        ArrayList<Request> list = new ArrayList<>();
        try {
            //buoc 1: mo ket noi
            Connection cn = DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "SELECT * FROM Request order by RequestID desc \n";
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery(sql);
                //buoc 3: doc ket qua cua buoc 2
                while (rs.next()) {
                    int RequestID = rs.getInt("RequestID");
                    int BookingID = rs.getInt("BookingID");
                    int Request_Status = rs.getInt("Request_Status");
                    int UserID = rs.getInt("UserID");
                    String requestDate = rs.getString("Request_Date");
                    String slotNumber = rs.getString("Parking_Slot_Number");
                    String vehicle_PlateNumber = rs.getString("Vehicle_PlateNumber");
                    Request rq = new Request(RequestID, BookingID, vehicle_PlateNumber, slotNumber, Request_Status, UserID, requestDate);
                    list.add(rq);
                }
                //buoc 4: dong ket noi 
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void updateRequestStatus(String status, String requestID) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "UPDATE Request set [Request_Status] = ?\n"
                    + "                     where RequestID = ?";
            con = new DBUtils().makeConnection();
            ps = con.prepareStatement(sql);

            ps.setString(1, status);
            ps.setString(2, requestID);

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        } catch (Exception ex) {
            Logger.getLogger(BookingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        ArrayList<Request> rq = RequestDAO.getAllRequestUserScreen(1);
        for (Request request : rq) {
            System.out.println(request.getDateRequest());
        }
    }
}
