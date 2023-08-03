<%-- 
    Document   : menu.jsp
    Created on : Jun 8, 2022, 1:48:35 PM
    Author     : tranh
--%>

<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="pm.dto.Notify"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pm.dao.UserDAO"%>
<%@page import="pm.dao.NotiDAO"%>
<%@page import="pm.dao.VehicleDAO"%>
<%@page import="pm.dao.ParkingSlotDAO"%>
<%@page import="pm.dao.BookingDAO"%>
<%@page import="pm.dto.Booking"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="body-left col-md-2 p-0 " id="menu">
    <div class="div-menu">

        <div id="myDIV" class="d-flex flex-column " >
            <a class=" menu-detail mt-2 btn  "  href="userDashboard1.jsp">
                <i class="icon fa fa-chalkboard pr-3"></i> 
                DashBoard
            </a>

            <a class=" menu-detail mt-2 btn  " href="userUpdateReal.jsp">
                <i class="icon fa fa-user pr-3"></i
                > My Profile
            </a>

            <a class=" menu-detail mt-2 btn  " href="userVehicleList.jsp"> 
                <i class="icon fa fa-car pr-3"></i> 
                My Vehicle list
            </a>

            <a class=" menu-detail mt-2 btn  " href="userRequest.jsp">
                <i class="icon fa fa-newspaper pr-3"></i> 
                My Requests
            </a>
            <a class=" menu-detail mt-2 btn  " href="bookingHistory.jsp" visited >
                <i class="icon fa fa-money-check-alt pr-3"></i>
                Booking History
            </a>
        </div>

    </div>

</div>


<script>

</script>