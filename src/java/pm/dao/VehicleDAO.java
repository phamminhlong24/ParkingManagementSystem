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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import pm.dto.UserA;
import pm.dto.Vehicle;
import pm.utils.DBUtils;

/**
 *
 * @author KIM DUONG
 */
public class VehicleDAO {

    public static boolean insertVehicle(int newVehicleUserID, String newVehicleName, String newVehicleDescription,
            String newVehiclePlateNumber, int newStatus)
            throws SQLException, NamingException, Exception {
        try {
            //buoc 1: mo ket noi
            Connection cn = DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "INSERT INTO Vehicle (Vehicle_User_ID, Vehicle_Name ,Vehicle_Description, Vehicle_PlateNumber, status) \n"
                        + "VALUES (?, ? ,?, ?, ?)";
                PreparedStatement pst = cn.prepareStatement(sql);

                pst.setInt(1, newVehicleUserID);
                pst.setString(2, newVehicleName);
                pst.setString(3, newVehicleDescription);
                pst.setString(4, newVehiclePlateNumber);
                pst.setInt(5, newStatus);

                int count = pst.executeUpdate();

                if (count == 0) {
                    cn.close();
                    return false;
                } else {
                    cn.close();
                    return true;
                }
            }
        } finally {
        }
        return true;
    }

    public static ArrayList<Vehicle> getVehiclebyUserID(int userID) {
        Connection cn = null;
        ArrayList<Vehicle> list = new ArrayList();

        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT * FROM Vehicle WHERE Vehicle_User_ID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, userID);
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    userID = rs.getInt("Vehicle_User_ID");
                    int vehicleID = rs.getInt("VehicleID");
                    String vehicleDes = rs.getString("Vehicle_Description");
                    String vehiclePlate = rs.getString("Vehicle_PlateNumber");
                    String vehicleName = rs.getString("Vehicle_Name");
                    int status = rs.getInt("Status");
                    Vehicle v = new Vehicle(vehicleID, vehicleID, vehicleName, vehicleDes, vehiclePlate, status);
                    list.add(v);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }

    public static ArrayList<Vehicle> getAllVehicle() {
        Connection cn = null;
        ArrayList<Vehicle> list = new ArrayList();

        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT * FROM Vehicle";
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    int vehicleID = rs.getInt("VehicleID");
                    int vehicleUserID = rs.getInt("Vehicle_User_ID");
                    String vehicleDescription = rs.getString("Vehicle_Description");
                    String vehicleName = rs.getString("Vehicle_Name");
                    String plateNumber = rs.getString("Vehicle_PlateNumber");
                    int status = rs.getInt("Status");
                    Vehicle v = new Vehicle(vehicleID, vehicleUserID, vehicleName, vehicleDescription, plateNumber, status);
                    list.add(v);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }

    public static ArrayList<Vehicle> searchByPlateNumber(String txtSearch, int userID) {
        Connection conn = null;//ket noi sql sever
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Vehicle> list = new ArrayList<>();
        String query = "select * from Vehicle INNER JOIN UserA ON "
                + "UserA.UserID = Vehicle.Vehicle_User_ID "
                + "where Vehicle_PlateNumber like ? "
                + "AND UserID = ? ";
        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            ps.setInt(2, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                Vehicle v = new Vehicle(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6));
                list.add(v);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public static ArrayList<Vehicle> searchVehicleByPlateNumber(String txtSearch) {
        Connection conn = null;//ket noi sql sever
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Vehicle> list = new ArrayList<>();
        String query = "select * from Vehicle INNER JOIN UserA ON "
                + "UserA.UserID = Vehicle.Vehicle_User_ID "
                + "where Vehicle_PlateNumber like ? ";

        try {
            conn = new DBUtils().makeConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Vehicle v = new Vehicle(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6));
                list.add(v);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public static Vehicle getAVehicle(String plateNumber) {
        Connection cn = null;
        Vehicle vehicleInfo = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT VehicleID,Vehicle_User_ID,Vehicle_Name,"
                        + "Vehicle_Description,Vehicle_PlateNumber,Status "
                        + "FROM Vehicle WHERE Vehicle_PlateNumber = ?  COLLATE Latin1_General_CS_AS";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, plateNumber);

                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int VehicleID = rs.getInt("VehicleID");
                    int Vehicle_User_ID = rs.getInt("Vehicle_User_ID");
                    String Vehicle_Name = rs.getString("Vehicle_Name");
                    String Vehicle_Description = rs.getString("Vehicle_Description");
                    String Vehicle_PlateNumber = rs.getString("Vehicle_PlateNumber");
                    int Status = rs.getInt("Status");

                    vehicleInfo = new Vehicle(VehicleID, Vehicle_User_ID, Vehicle_Name, Vehicle_Description, plateNumber, Status);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return vehicleInfo;
    }

    public static boolean updateVehicleStatus(String vehicleNumberPlate) {
        try {
            //buoc 1: mo ket noi
            Connection cn = DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "UPDATE vehicle\n"
                        + "SET Status = 1 \n"
                        + "WHERE Vehicle_PlateNumber = ? COLLATE Latin1_General_CS_AS";
                PreparedStatement pst = cn.prepareStatement(sql);

                pst.setString(1, vehicleNumberPlate);

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

    public void updateVehicleStatus(String status, String Vehicle_PlateNumber) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "UPDATE vehicle set [Status] = ?\n"
                    + "                     where Vehicle_PlateNumber = ?";
            con = new DBUtils().makeConnection();
            ps = con.prepareStatement(sql);

            ps.setString(1, status);
            ps.setString(2, Vehicle_PlateNumber);

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        } catch (Exception ex) {
            Logger.getLogger(VehicleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static boolean deleteVehicle(int vehicleID) {
        try {
            //buoc 1: mo ket noi
            Connection cn = DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "DELETE FROM Vehicle WHERE VehicleID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);

                pst.setInt(1, vehicleID);

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

    public static int getVehicleStatusByPlate(String Plate) {
        int status = -1;
        try {
            //buoc 1: mo ket noi
            Connection cn = DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "SELECT status FROM vehicle WHERE Vehicle_PlateNumber = ? \n";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, Plate);
                ResultSet rs = pst.executeQuery();
                //buoc 3: doc ket qua cua buoc 2
                if (rs != null) {
                    while (rs.next()) {
                        int vehicleStastus = rs.getInt("status");
                        status = vehicleStastus;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    
    public static ArrayList<Vehicle> getAllVehicleStatus() {
        Connection cn = null;
        ArrayList<Vehicle> list = new ArrayList();

        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT * FROM Vehicle WHERE status = 1";
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery(sql);
                while (rs.next()) {
                    int vehicleID = rs.getInt("VehicleID");
                    int vehicleUserID = rs.getInt("Vehicle_User_ID");
                    String vehicleDescription = rs.getString("Vehicle_Description");
                    String vehicleName = rs.getString("Vehicle_Name");
                    String plateNumber = rs.getString("Vehicle_PlateNumber");
                    int status = rs.getInt("Status");
                    Vehicle v = new Vehicle(vehicleID, vehicleUserID, vehicleName, vehicleDescription, plateNumber, status);
                    list.add(v);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }

    public static void main(String[] args) {
        ArrayList<Vehicle> list = VehicleDAO.getVehiclebyUserID(2);
        for (Vehicle vehicle : list) {
            System.out.println(vehicle.getPlateNumber());
        }
        boolean a = VehicleDAO.updateVehicleStatus("51G-866.68");
        System.out.println(a);
//        Vehicle v = VehicleDAO.getAVehicle("51F-970.22");
//        System.out.println(v);
    }
}
