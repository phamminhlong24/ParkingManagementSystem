<%-- 
    Document   : zonB
    Created on : Jun 6, 2022, 8:54:10 PM
    Author     : tranh
--%>

<%@page import="pm.dao.VehicleDAO"%>
<%@page import="pm.dto.Vehicle"%>
<%@page import="pm.dto.PaymentType"%>
<%@page import="pm.dao.PaymentDAO"%>
<%@page import="pm.dto.PaymentMethod"%>
<%@page import="pm.dao.ParkingSlotDAO"%>
<%@page import="pm.dto.ParkingSlot"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="container-fluid">
    <div class="row">
        <!--Zone B-->
         <jsp:include page="zoneB.jsp"></jsp:include>
        <!--Zone C-->
        <jsp:include page="zoneC.jsp"></jsp:include>
    </div>
</div>
