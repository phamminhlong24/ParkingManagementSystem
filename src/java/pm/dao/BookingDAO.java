/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pm.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.Timestamp;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import pm.dto.Booking;
import pm.dto.ParkingSlot;
import pm.utils.DBUtils;

/**
 *
 * @author KIM DUONG
 */
public class BookingDAO {

    public static ArrayList<Booking> getAllBooking() {
        ArrayList<Booking> list = new ArrayList<>();
        try {
            //buoc 1: mo ket noi
            Connection cn = DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "SELECT * FROM Booking order by BookingID desc \n";
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery(sql);
                //buoc 3: doc ket qua cua buoc 2
                while (rs.next()) {
                    int bookingID = rs.getInt("BookingID");
                    String vehiclePlateNumber = rs.getString("Vehicle_PlateNumber");
                    int durationOfBooking = rs.getInt("Duration_Of_Booking");
                    String slotNumber = rs.getString("Parking_Slot_Number");
                    int status = rs.getInt("Booking_Status");
                    String username = rs.getString("Username");
                    Timestamp bookDate = rs.getTimestamp("Booking_Date");
                    int timeStart = rs.getInt("Start_Time");
                    int timeEnd = rs.getInt("End_time");
                    Booking bk = new Booking(bookingID, vehiclePlateNumber, durationOfBooking, slotNumber, status, username, bookDate, timeStart, timeEnd);
                    list.add(bk);
                }
                //buoc 4: dong ket noi
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static Booking getBookingInfoBySlotNum(String slotNumber) {
        Booking bk = new Booking();
        try {
            //buoc 1: mo ket noi
            Connection cn = DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "SELECT * FROM Booking WHERE Parking_Slot_Number = ? \n";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, slotNumber);
                ResultSet rs = pst.executeQuery();
                //buoc 3: doc ket qua cua buoc 2
                if (rs != null) {
                    while (rs.next()) {
                        int bookingID = rs.getInt("BookingID");
                        String vehiclePlateNumber = rs.getString("Vehicle_PlateNumber");
                        int durationOfBooking = rs.getInt("Duration_Of_Booking");
                        slotNumber = rs.getString("Parking_Slot_Number");
                        int status = rs.getInt("Booking_Status");
                        String username = rs.getString("Username");
                        Timestamp bookDate = rs.getTimestamp("Booking_Date");
                        int timeStart = rs.getInt("Start_Time");
                        int timeEnd = rs.getInt("End_time");
                        bk = new Booking(bookingID, vehiclePlateNumber, durationOfBooking, slotNumber, status, username, bookDate, timeStart, timeEnd);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bk;
    }

    public static ArrayList<Booking> getBookingByUsername(String userName) {
        ArrayList<Booking> list = new ArrayList<>();
        try {
            //buoc 1: mo ket noi
            Connection cn = DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "SELECT * FROM Booking WHERE Username = ? and Booking_status = 1\n";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, userName);
                ResultSet rs = pst.executeQuery();
                //buoc 3: doc ket qua cua buoc 2
                while (rs.next()) {
                    int bookingID = rs.getInt("BookingID");
                    String vehiclePlateNumber = rs.getString("Vehicle_PlateNumber");
                    int durationOfBooking = rs.getInt("Duration_Of_Booking");
                    String slotNumber = rs.getString("Parking_Slot_Number");
                    int status = rs.getInt("Booking_Status");
                    userName = rs.getString("Username");
                    Timestamp bookDate = rs.getTimestamp("Booking_Date");
                    int timeStart = rs.getInt("Start_Time");
                    int timeEnd = rs.getInt("End_time");
                    Booking bk = new Booking(bookingID, vehiclePlateNumber, durationOfBooking, slotNumber, status, userName, bookDate, timeStart, timeEnd);
                    list.add(bk);
                }
                //buoc 4: dong ket noi
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static int getBookingInfoByPlateNumber(String vehiclePlateNumber) {
        int bookingId = -1;
        try {
            //buoc 1: mo ket noi
            Connection cn = DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "SELECT BookingID FROM Booking WHERE Vehicle_PlateNumber = ? \n";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, vehiclePlateNumber);
                ResultSet rs = pst.executeQuery();
                //buoc 3: doc ket qua cua buoc 2
                if (rs != null) {
                    while (rs.next()) {
                        int bookingID = rs.getInt("BookingID");
                        bookingId = bookingID;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bookingId;
    }

    public static ArrayList<Booking> getBookingInfoByUserName(String username) {
        Booking bk = new Booking();
        ArrayList<Booking> list = new ArrayList();
        try {
            //buoc 1: mo ket noi
            Connection cn = DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "SELECT * FROM Booking WHERE Username = ? order by BookingID desc\n";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, username);
                ResultSet rs = pst.executeQuery();
                //buoc 3: doc ket qua cua buoc 2
                if (rs != null) {
                    while (rs.next()) {
                        int bookingID = rs.getInt("BookingID");
                        String vehiclePlateNumber = rs.getString("Vehicle_PlateNumber");
                        int durationOfBooking = rs.getInt("Duration_Of_Booking");
                        String slotNumber = rs.getString("Parking_Slot_Number");
                        int status = rs.getInt("Booking_Status");
                        username = rs.getString("Username");
                        Timestamp bookDate = rs.getTimestamp("Booking_Date");
                        int timeStart = rs.getInt("Start_Time");
                        int timeEnd = rs.getInt("End_time");
                        bk = new Booking(bookingID, vehiclePlateNumber, durationOfBooking, slotNumber, status, username, bookDate, timeStart, timeEnd);
                        list.add(bk);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static ArrayList<Booking> getBookingTempInfoByUserName(String username) {
        Booking bk = new Booking();
        ArrayList<Booking> list = new ArrayList();
        try {
            //buoc 1: mo ket noi
            Connection cn = DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "SELECT * FROM BookingTemporary WHERE Username = ? order by BookingID desc\n";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, username);
                ResultSet rs = pst.executeQuery();
                //buoc 3: doc ket qua cua buoc 2
                if (rs != null) {
                    while (rs.next()) {
                        int bookingID = rs.getInt("BookingID");
                        String vehiclePlateNumber = rs.getString("Vehicle_PlateNumber");
                        int durationOfBooking = rs.getInt("Duration_Of_Booking");
                        String slotNumber = rs.getString("Parking_Slot_Number");
                        int status = rs.getInt("Booking_Status");
                        username = rs.getString("Username");
                        Timestamp bookDate = rs.getTimestamp("Booking_Date");

                        bk = new Booking(bookingID, vehiclePlateNumber, durationOfBooking, slotNumber, status, username, bookDate);
                        list.add(bk);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static boolean insertBooking(
            String vehicle_plate,
            String durationOfBooking,
            String parkingSlotNumber,
            String userName,
            String bookingDate,
            int startTime, int endTime) {
        try {
            //buoc 1: mo ket noi
            Connection cn = DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "insert into "
                        + "Booking(Vehicle_PlateNumber, Duration_Of_Booking, Parking_Slot_Number, Booking_Status, Username, Booking_Date, Start_Time, End_Time) "
                        + "Values (?,?,?,0,?,?,?,?)";
                PreparedStatement pst = cn.prepareStatement(sql);

                pst.setString(1, vehicle_plate);
                pst.setString(2, durationOfBooking);
                pst.setString(3, parkingSlotNumber);
                pst.setString(4, userName);
                pst.setString(5, bookingDate);
                pst.setInt(6, startTime);
                pst.setInt(7, endTime);
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

    public static boolean insertBookingTemp(
            String vehicle_plate,
            String durationOfBooking,
            String parkingSlotNumber,
            String userName,
            String bookingDate) {
        try {
            //buoc 1: mo ket noi
            Connection cn = DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "insert into "
                        + "BookingTemporary(Vehicle_PlateNumber, Duration_Of_Booking, Parking_Slot_Number, Booking_Status, Username, Booking_Date) "
                        + "Values (?,?,?,1,?,?)";
                PreparedStatement pst = cn.prepareStatement(sql);

                pst.setString(1, vehicle_plate);
                pst.setString(2, durationOfBooking);
                pst.setString(3, parkingSlotNumber);
                pst.setString(4, userName);
                pst.setString(5, bookingDate);

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

    public static boolean updateBookingStatus(String bookingID) {
        try {
            //buoc 1: mo ket noi
            Connection cn = DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "UPDATE booking\n"
                        + "SET Booking_Status = 1 \n"
                        + "WHERE BookingID = ? COLLATE Latin1_General_CS_AS";
                PreparedStatement pst = cn.prepareStatement(sql);

                pst.setString(1, bookingID);

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

    public void updateBookingStatus(String status, String bookingID) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "UPDATE booking set [Booking_Status] = ?\n"
                    + "                     where BookingID = ?";
            con = new DBUtils().makeConnection();
            ps = con.prepareStatement(sql);

            ps.setString(1, status);
            ps.setString(2, bookingID);

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

    public void updateBookingStatusByPlate(String status, String Plate) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "UPDATE booking set [Booking_Status] = ?\n"
                    + "                     where Vehicle_PlateNumber = ?";
            con = new DBUtils().makeConnection();
            ps = con.prepareStatement(sql);

            ps.setString(1, status);
            ps.setString(2, Plate);

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

    public void updateBookingDateByPlate(String date, String Plate) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "UPDATE booking set [Booking_Date] = ?\n"
                    + "                     where Vehicle_PlateNumber = ? and Booking_Status = 1";
            con = new DBUtils().makeConnection();
            ps = con.prepareStatement(sql);

            ps.setString(1, date);
            ps.setString(2, Plate);

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

    public void updateBookingSlotByPlate(String Slot, String Plate) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "UPDATE booking set [Parking_Slot_Number] = ?\n"
                    + "                     where Vehicle_PlateNumber = ?";
            con = new DBUtils().makeConnection();
            ps = con.prepareStatement(sql);

            ps.setString(1, Slot);
            ps.setString(2, Plate);

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

    public void updateBookingDurationByPlate(String duration, String Plate) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "UPDATE booking set [Duration_of_Booking] = ?\n"
                    + "                     where Vehicle_PlateNumber = ?";
            con = new DBUtils().makeConnection();
            ps = con.prepareStatement(sql);

            ps.setString(1, duration);
            ps.setString(2, Plate);

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

    public void updateTimeSlotHour(int startTimeS, int endTimeS, int timeIn, int timeOut, String slotNumber) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "UPDATE TimeSlot set [StartStatus] = ?, [EndStatus] = ?\n"
                    + "                    where StartTime>= ? and StartTime <= ? and Parking_slot_number = ?";
            con = new DBUtils().makeConnection();
            ps = con.prepareStatement(sql);

            ps.setInt(1, startTimeS);
            ps.setInt(2, endTimeS);
            ps.setInt(3, timeIn);
            ps.setInt(4, timeOut);
            ps.setString(5, slotNumber);

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

    public void updateTimeSlotMonth(int startTimeS, int endTimeS, String slotNumber) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "UPDATE TimeSlot set [StartStatus] = ? , [EndStatus] = ?\n"
                    + "where Parking_slot_number = ?";
            con = new DBUtils().makeConnection();
            ps = con.prepareStatement(sql);

            ps.setInt(1, startTimeS);
            ps.setInt(2, endTimeS);
            ps.setString(3, slotNumber);

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
    
    public static ArrayList<Booking> getBookingDatetime() {
        ArrayList<Booking> list = new ArrayList<>();
        try {
            //buoc 1: mo ket noi
            Connection cn = DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "SELECT*FROM Booking WHERE Booking_Date = java.time.LocalDate.now \n";
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery(sql);
                //buoc 3: doc ket qua cua buoc 2
                while (rs.next()) {
                    int bookingID = rs.getInt("BookingID");
                    String vehiclePlateNumber = rs.getString("Vehicle_PlateNumber");
                    int durationOfBooking = rs.getInt("Duration_Of_Booking");
                    String slotNumber = rs.getString("Parking_Slot_Number");
                    int status = rs.getInt("Booking_Status");
                    String username = rs.getString("Username");
                    Timestamp bookDate = rs.getTimestamp("Booking_Date");
                    Booking bk = new Booking(bookingID, vehiclePlateNumber, durationOfBooking, slotNumber, status, username, bookDate);
                    list.add(bk);
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
        ArrayList<Booking> list = BookingDAO.getBookingByUsername("user123");
//        int bk = BookingDAO.getBookingInfoByPlateNumber("51F-970.22");
//        System.out.println(bk);
        for (Booking booking : list) {
            System.out.println(booking.getVehiclePlateNumber());
        }
    }
}
