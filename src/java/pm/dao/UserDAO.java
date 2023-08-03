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
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import pm.dto.UserA;
import pm.utils.DBUtils;

/**
 *
 * @author KIM DUONG
 */
public class UserDAO {

    public static boolean updateAccountStatus(int userID, int status) {
        try {
            //buoc 1: mo ket noi
            Connection cn = DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "UPDATE UserA\n"
                        + "SET Status = ?\n"
                        + "WHERE userID = ? ";
                PreparedStatement pst = cn.prepareStatement(sql);

                pst.setInt(1, status);
                pst.setInt(2, userID);

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

    public static UserA getAccount(String username, String password) {
        Connection cn = null;
        UserA user = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select UserID, Username, Password, Fullname, Email, Address, Phone, Gender, Role, Status\n"
                        + "from dbo.UserA\n"
                        + "where status = 1 and username = ? and password = ? COLLATE Latin1_General_CS_AS";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, username);
                pst.setString(2, password);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int UserID = rs.getInt("UserID");
                    String Username = rs.getString("Username");
                    String Password = rs.getString("Password");
                    String FullName = rs.getString("Fullname");
                    String Email = rs.getString("Email");
                    String Fullname = rs.getString("Fullname");
                    String Address = rs.getString("Address");
                    String Phone = rs.getString("Phone");
                    int Gender = rs.getInt("Gender");
                    int Role = rs.getInt("Role");
                    int Status = rs.getInt("Status");

                    user = new UserA(UserID, Username, Password, Fullname, Email, Address, Phone, Gender, Status, Role);
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
        return user;
    }

    public static int getUserIdByUserName(String userName) {
        int userID = -1;
        try {
            //buoc 1: mo ket noi
            Connection cn = DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "SELECT UserID FROM UserA WHERE UserName = ? \n";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, userName);
                ResultSet rs = pst.executeQuery();
                //buoc 3: doc ket qua cua buoc 2
                if (rs != null) {
                    while (rs.next()) {
                        int userId = rs.getInt("UserID");
                        userID = userId;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userID;
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

    public static UserA getAccount(String username) {
        Connection cn = null;
        UserA user = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select UserID, Username, Password, Fullname, Email, Address, Phone, Gender, Role, Status\n"
                        + "from dbo.UserA\n"
                        + "where status = 1 and username = ?  COLLATE Latin1_General_CS_AS";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, username);

                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int UserID = rs.getInt("UserID");
                    String Username = rs.getString("Username");
                    String Password = rs.getString("Password");
                    String FullName = rs.getString("Fullname");
                    String Email = rs.getString("Email");
                    String Fullname = rs.getString("Fullname");
                    String Address = rs.getString("Address");
                    String Phone = rs.getString("Phone");
                    int Gender = rs.getInt("Gender");
                    int Role = rs.getInt("Role");
                    int Status = rs.getInt("Status");

                    user = new UserA(UserID, Username, Password, Fullname, Email, Address, Phone, Gender, Status, Role);
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
        return user;
    }

    public static boolean insertAccount(String newUsername, String newPassword, String newFullname, String newEmail, String newAddress,
            String newPhone, int newRole, int newStatus, int newGender)
            throws SQLException, NamingException, Exception {
        try {
            //buoc 1: mo ket noi
            Connection cn = DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "INSERT INTO UserA \n"
                        + "VALUES (?,?,?,?,?,?,?,?,?)";
                PreparedStatement pst = cn.prepareStatement(sql);

                pst.setString(1, newUsername);
                pst.setString(2, newPassword);
                pst.setString(3, newFullname);
                pst.setString(4, newEmail);
                pst.setString(5, newAddress);
                pst.setString(6, newPhone);
                pst.setInt(7, newRole);
                pst.setInt(8, newStatus);
                pst.setInt(9, newGender);

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

    public static boolean updateAccount1(String email, String newFullname, String newPhone, String newAddress) {
        try {
            //buoc 1: mo ket noi
            Connection cn = DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "UPDATE UserA\n"
                        + "SET fullname = ?, phone = ?, address = ? \n"
                        + "WHERE email = ? COLLATE Latin1_General_CS_AS";
                PreparedStatement pst = cn.prepareStatement(sql);

                pst.setString(1, newFullname);
                pst.setString(2, newPhone);
                pst.setString(3, newAddress);
                pst.setString(4, email);

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

    public void updateUserStatus(String userName) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "Update UserA set [Status] = 1\n"
                    + "                     where userName = ?";
            con = new DBUtils().makeConnection();
            ps = con.prepareStatement(sql);

            ps.setString(1, userName);

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static ArrayList<UserA> getAccounts() {
        ArrayList<UserA> list = new ArrayList<>();
        try {
            //buoc 1: mo ket noi
            Connection cn = DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "SELECT UserID, Username, Password, Fullname, Email, Address, Phone, Role, Status, Gender \n"
                        + "From UserA";
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery(sql);
                //buoc 3: doc ket qua cua buoc 2
                while (rs.next()) {
                    int UserID = rs.getInt("UserID");
                    String Username = rs.getString("Username");
                    String Password = rs.getString("Password");
                    String Fullname = rs.getString("Fullname");
                    String Email = rs.getString("Email");
                    String Phone = rs.getString("Phone");
                    String Address = rs.getString("Address");
                    int Role = rs.getInt("Role");
                    int Status = rs.getInt("Status");
                    int Gender = rs.getInt("Gender");
                    UserA user = new UserA(UserID, Username, Password, Fullname, Email, Address, Phone, Gender, Status, Role);
                    list.add(user);
                }
                //buoc 4: dong ket noi
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Date addHoursToJavaUtilDate(Date date, int hours) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.HOUR_OF_DAY, hours);
        return calendar.getTime();
    }

    public static void main(String[] args) {
        ArrayList<UserA> list = UserDAO.getAccounts();
//        boolean a = UserDAO.updateAccountStatus("user124");
        UserDAO dao = new UserDAO();
        int id = UserDAO.getUserIdByUserName("user123");
        System.out.println(id);
//        dao.updateUserStatus("user124");
//        System.out.println(a);
//        for (UserA userA : list) {
//            System.out.println(userA.getuID());
//        }

    }
}
