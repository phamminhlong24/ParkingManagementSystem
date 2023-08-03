<%-- 
    Document   : zoneA
    Created on : Jun 6, 2022, 2:11:54 PM
    Author     : tranh
--%>

<%@page import="java.util.Map"%>
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
<%
    ArrayList<ParkingSlot> list = ParkingSlotDAO.getParkingSlotsZoneA();

%>

<div class="zone-A">
    <div class="container-fluid">
        <div class="row">
            <div class="zone-name-A">Zone A</div>
            <div class="zone-A-content col-md-12">
                <div class="zone-A-lists">
                    <div class="zone-A-lot d-flex flex-row">

                        <%  for (ParkingSlot parkingSlot : list) {
                        %>
                        <% if (parkingSlot.getParkingSlotStatus() == 2) {
                                String actived = "actived";
                        %>
                        <button class="lot-A-detail mr-3 <%= actived%> "  >
                            <%= parkingSlot.getParkingSlotNumber()%>
                        </button>
                        <%
                        } else if (parkingSlot.getParkingSlotStatus() == 1 || parkingSlot.getParkingSlotStatus() == 3) {
                        %>
                        <button class="lot-A-detail mr-3 bg-warning" >
                            <%= parkingSlot.getParkingSlotNumber()%>
                        </button>
                        <%
                        } else {%>
                        <button class="lot-A-detail mr-3"  data-toggle="modal" data-target="#<%=parkingSlot.getParkingSlotNumber()%>">
                            <%= parkingSlot.getParkingSlotNumber()%>
                        </button>
                        <%}%>
                        <!--MODAL-->
                        <!--Parking Space Modal -->
                        <%
                            }
                        %>
                    </div>

                    <!--MODAL-->

                </div>
            </div>
        </div>
    </div>
</div>




<!--End Of Zone A -->   
