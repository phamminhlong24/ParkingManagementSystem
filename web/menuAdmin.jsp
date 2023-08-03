<%-- 
    Document   : menu.jsp
    Created on : Jun 8, 2022, 1:48:35 PM
    Author     : tranh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="body-left col-md-2 p-0 " id="menu" style="height: 900px;">
    <div class="div-menu">
        <div id="myDIV" class="d-flex flex-column ">
            <a class=" menu-detail mt-2 btn  "  href="adminDashboard.jsp">
                <i class="icon fa fa-chalkboard pr-3"></i> DashBoard
            </a>
            <a class=" menu-detail mt-2 btn  " href="adminUserManage.jsp">
                <i class="icon fa fa-user pr-3"></i
                > User Manage
            </a>

            <a class=" menu-detail mt-2 btn  " href="adminUserVehicle.jsp"> 
                <i class="icon fa fa-car pr-3"></i> 
                Vehicle Manage
            </a>
        </div>
    </div>
</div>


