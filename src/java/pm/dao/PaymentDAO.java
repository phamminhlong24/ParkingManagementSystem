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
import pm.dto.ParkingSlot;
import pm.dto.PaymentMethod;
import pm.dto.PaymentType;
import pm.utils.DBUtils;

/**
 *
 * @author KIM DUONG
 */
public class PaymentDAO {

    public static ArrayList<PaymentMethod> getPaymentMethod() {
        ArrayList<PaymentMethod> list = new ArrayList<>();
        try {
            //buoc 1: mo ket noi
            Connection cn = DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "SELECT * FROM Payment_Method";
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery(sql);
                //buoc 3: doc ket qua cua buoc 2
                while (rs.next()) {
                    int methodID = rs.getInt("Method_ID");
                    String methodName = rs.getString("Method_Name");
                    PaymentMethod pm = new PaymentMethod(methodID, methodName);
                    list.add(pm);
                }
                //buoc 4: dong ket noi
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static ArrayList<PaymentType> getPaymentType() {
        ArrayList<PaymentType> list = new ArrayList<>();
        try {
            //buoc 1: mo ket noi
            Connection cn = DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "SELECT * FROM Payment_Type";
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery(sql);
                //buoc 3: doc ket qua cua buoc 2
                while (rs.next()) {
                    int typeID = rs.getInt("Type_ID");
                    String typeName = rs.getString("Type_Name");
                    PaymentType pt = new PaymentType(typeID, typeName);
                    list.add(pt);
                }
                //buoc 4: dong ket noi
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void insertPayment(
            int bookingID,
            int rentingFee,
            int method,
            int userID,
            int type) {
        try {
            //buoc 1: mo ket noi
            Connection cn = DBUtils.makeConnection();
            //buoc 2: viet query va execute
            if (cn != null) {
                String sql = "INSERT INTO Payment (BookingID, Renting_Fee, Method, UserId, Payment_Type) VALUES (?,?,?,?,?)";
                PreparedStatement pst = cn.prepareStatement(sql);

                pst.setInt(1, bookingID);
                pst.setInt(2, rentingFee);
                pst.setInt(3, method);
                pst.setInt(4, userID);
                pst.setInt(5, type);

                int count = pst.executeUpdate();

                if (count == 0) {
                    cn.close();
                } else {
                    cn.close();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {

        PaymentDAO pd = new PaymentDAO();
        pd.insertPayment(3, 270000, 2, 3, 1);
        
    }
}
