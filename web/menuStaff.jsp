<%-- 
    Document   : menuStaff
    Created on : Jun 18, 2022, 9:44:34 PM
    Author     : tranh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="body-left col-md-2 p-0 " id="menu" style="height: 900px;">
    <div id="myDIV" class="d-flex flex-column ">
        <a class=" menu-detail mt-2 btn  "  href="staffDashboard.jsp">
            <i class="icon fa fa-chalkboard pr-3"></i> DashBoard
        </a>
        <a class=" menu-detail mt-2 btn  " href="bookingHistoryStaff.jsp"  >
            <i class="icon fa fa-money-check-alt pr-3"></i>
            User Temporary Booking History
        </a>
        <a class=" menu-detail mt-2 btn  " href="adminUserBooking.jsp" >
            <i class="fa fa-file-import pr-3"></i> 
            User Booking List
        </a>
        <a class=" menu-detail mt-2 btn  " href="adminUserRequest.jsp" >
            <i class="fa fa-file-import pr-3"></i> 
            User Request List
        </a>
    </div>

</div>

