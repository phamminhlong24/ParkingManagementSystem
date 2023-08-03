<%-- 
    Document   : zoneC
    Created on : Jun 6, 2022, 9:13:42 PM
    Author     : tranh
--%>

<%@page import="pm.dao.BookingDAO"%>
<%@page import="pm.dto.Booking"%>
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
    ArrayList<ParkingSlot> list2 = ParkingSlotDAO.getParkingSlotsZoneC();
%>
<div class="zone-C col-md-6">
    <div class="zone-C-name">Zone C</div>
    <div class="">
        <!--container-fluid-->
        <div class="row">
            <div class="zone-C-left col-md-12">
                <div class="row">
                    <% for (ParkingSlot parkingSlotC : list2) {
                            String slotNum = parkingSlotC.getParkingSlotNumber();
                            Booking bk = BookingDAO.getBookingInfoBySlotNum(slotNum);
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
                        <button class="lot-B-detail mr-3 mt-3 <%= actived%>" data-toggle="modal" data-target="#<%=parkingSlotC.getParkingSlotNumber()%>">
                            <%= parkingSlotC.getParkingSlotNumber()%>
                        </button>
                    </div>
                    <%
                        }else if (parkingSlotC.getParkingSlotStatus() == 1) {
                    %>
                    <div class="col-md-2">
                        <button class="lot-B-detail mr-3 mt-3 bg-warning" data-toggle="modal" data-target="#<%=parkingSlotC.getParkingSlotNumber()%>">
                            <%= parkingSlotC.getParkingSlotNumber()%>
                        </button>
                    </div>
                    <%
                    } else if (parkingSlotC.getParkingSlotStatus() == 3) {
                    %>
                    
                    <div class="col-md-2">
                        <button class="lot-B-detail mr-3 mt-3 bg-info" data-toggle="modal" data-target="#<%=parkingSlotC.getParkingSlotNumber()%>">
                            <%= parkingSlotC.getParkingSlotNumber()%>
                        </button>
                    </div>
                    <%
                        }
                    %>

                    <!--Parking Space Modal B1-->
                    <div class="modal fade" id="<%=parkingSlotC.getParkingSlotNumber()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" style='max-width: 1000px; ' role="document">
                            <div class="modal-content" style='border-radius: 30px '>
                                <div clas="container-fluid">
                                    <div class=" row">
                                        <div class="col-md-5">
                                            <img src="https://cdn.dribbble.com/users/1287580/screenshots/5410442/dribbble_2.gif" 
                                                 alt="alt"
                                                 style="width: 100%;border-radius: 30px;height: 650px "
                                                 />
                                        </div>
                                        <div class="col-md-7">
                                            <div class="content-form" style="padding: 65px 30px 0 30px">
                                                <h3 STYLE='font-size: 18px;
                                                    color: #453e79;
                                                    text-transform: uppercase;
                                                    letter-spacing: 7px;
                                                    padding: 5px 15px;
                                                    display: inline-block;
                                                    border: 1px solid #dad8e4;
                                                    margin-bottom: 40px;
                                                    font-weight: bold;
                                                    '>

                                                    BOOKING YOUR PARKING'S LOT
                                                </h3>

                                                <form action="mainController" method="post">
                                                    <div class="row">
                                                        <div class="form-group col-md-12">
                                                            <label class="form-check-label col-12 col-sm-12" 
                                                                   style="font-size:22px;text-align: center">
                                                                Parking slot number
                                                            </label>
                                                            <input
                                                                class="form-control col-12 col-sm-12"
                                                                readonly
                                                                id="name"
                                                                name="parkingNameA"
                                                                type="text" 
                                                                style="border:none; background-color:#fff;
                                                                font-weight: bold;font-size: 25px;text-align: center"
                                                                value="<%= parkingSlotC.getParkingSlotNumber()%>"
                                                                />
                                                        </div>
                                                        <% if (parkingSlotC.getParkingSlotStatus() != 0) {%>

                                                        <div class="form-group col-md-12">
                                                            <label class="form-check-label col-12 col-sm-12" style=" font-size:22px;">Parking slot's status</label>
                                                            <div class="col-12 col-sm-12" 
                                                                 style="font-weight: bold;color:red;font-size: 25px;">
                                                                Unavailable
                                                            </div>
                                                        </div>
                                                        <!--Choose Payment Method-->
                                                        <div class="form-group col-md-6">
                                                            <label class="form-check-label col-12 col-sm-12" style=" font-size:20px">Vehicle in use</label>
                                                            <div class="col-12 col-sm-12">
                                                                <input
                                                                    class="form-control col-12 col-sm-12"
                                                                    readonly
                                                                    id="name"
                                                                    name="vehicle-PlateName"
                                                                    type="text" 
                                                                    style="border:none; background-color:#fff;
                                                                    font-weight: bold;font-size: 25px;"
                                                                    value=" <%= bk.getVehiclePlateNumber()%>"
                                                                    />
                                                            </div>
                                                        </div>
                                                        <!--End of Payment Method-->

                                                        <!--Choose Payment Type-->

                                                        <div class="form-group col-md-6">
                                                            <label class="form-check-label col-12 col-sm-12" style="font-size:20px">Vehicle owner user name</label>
                                                            <div class="col-12 col-sm-12">
                                                                <input
                                                                    class="form-control col-12 col-sm-12"
                                                                    readonly
                                                                    id="name"
                                                                    name="vehicle-PlateName-User"
                                                                    type="text" 
                                                                    style="border:none; background-color:#fff;
                                                                    font-weight: bold;font-size: 25px;"
                                                                    value="<%= bk.getUsername()%>"
                                                                    />
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                        </div>
                                                        <%} else {%>
                                                        <div class="form-group row">
                                                            <label class="form-check-label col-12 col-sm-12" style="font-weight: bold; font-size:20px">PARKING SLOT STATUS</label>
                                                            <div class="col-12 col-sm-12" style="font-weight: bold; color:green;font-size:25px">
                                                                Available
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                        </div>
                                                        <%}%>

                                                        <!--End Of Your Vehicle-->

                                                    </div>



                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--End Of Parking Space Modal B1-->


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