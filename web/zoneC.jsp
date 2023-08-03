<%-- 
    Document   : zoneC
    Created on : Jun 6, 2022, 9:13:42 PM
    Author     : tranh
--%>

<%@page import="pm.dao.VehicleDAO"%>
<%@page import="pm.dto.Vehicle"%>
<%@page import="pm.dto.PaymentType"%>
<%@page import="pm.dao.PaymentDAO"%>
<%@page import="pm.dto.PaymentMethod"%>
<%@page import="pm.dto.PaymentMethod"%>
<%@page import="pm.dto.PaymentMethod"%>
<%@page import="pm.dao.ParkingSlotDAO"%>
<%@page import="pm.dto.ParkingSlot"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    ArrayList<ParkingSlot> list1 = ParkingSlotDAO.getParkingSlotsZoneC();
%>
<div class="zone-C col-md-6">
    <div class="zone-C-name">Zone C</div>
    <div class="">
        <!--container-fluid-->
        <div class="row">
            <div class="zone-C-left col-md-12">
                <div class="row">
                    <% for (ParkingSlot parkingSlotC : list1) {
                    %>
                    <%
                        if (parkingSlotC.getParkingSlotStatus() == 0) {
                    %>
                    <div class="col-md-2">
                        <button class="lot-B-detail mr-3 mt-3" data-toggle="modal" data-target="#<%=parkingSlotC.getParkingSlotNumber()%>">
                            <%= parkingSlotC.getParkingSlotNumber()%>
                        </button>
                    </div>
                    <%
                    } else if (parkingSlotC.getParkingSlotStatus() == 2) {
                        String actived = "actived";
                    %>
                    <div class="col-md-2">
                        <button class="lot-B-detail mr-3 mt-3 <%= actived%>" >
                            <%= parkingSlotC.getParkingSlotNumber()%>
                        </button>
                    </div>
                    <%
                        }else if (parkingSlotC.getParkingSlotStatus() == 1 || parkingSlotC.getParkingSlotStatus() == 3) {
                        %>
                        <div class="col-md-2">
                        <button class="lot-B-detail mr-3 mt-3 bg-warning" >
                            <%= parkingSlotC.getParkingSlotNumber()%>
                        </button>
                    </div>
                        <%
                        }
                    %>

               


                    <%
                        }
                    %>
                </div>
            </div>


        </div>
    </div>
</div>

<script language="javascript">

    function showValue(classDiv, classId) {
        var idDiv = classId;
        console.log(idDiv)
        var clasDiv = classDiv;
        console.log(clasDiv)
        var ele = document.querySelector(idDiv).value;

        var div = document.querySelector(clasDiv);

        if (ele == 2) {
            div.style.display = "block";

        } else {
            console.log("block-none", ele);
            console.log("block-div-none", div);
            div.style.display = "none";
        }
    }
</script>