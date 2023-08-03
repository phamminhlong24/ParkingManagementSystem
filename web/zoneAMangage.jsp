<%-- 
    Document   : zoneA
    Created on : Jun 6, 2022, 2:11:54 PM
    Author     : tranh
--%>

<%@page import="pm.dto.Booking"%>
<%@page import="pm.dao.BookingDAO"%>
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
                        <% for (ParkingSlot parkingSlot : list) {
                                String slotNum = parkingSlot.getParkingSlotNumber();
                                Booking bk = BookingDAO.getBookingInfoBySlotNum(slotNum);
                        %>
                        <% if (parkingSlot.getParkingSlotStatus() == 2) {
                                String actived = "actived";
                        %>
                        <button class="lot-A-detail mr-3 <%= actived%> "  data-toggle="modal" data-target="#<%=parkingSlot.getParkingSlotNumber()%>">
                            <%= parkingSlot.getParkingSlotNumber()%>
                        </button>
                        <%
                        } else if (parkingSlot.getParkingSlotStatus() == 1) {
                        %>
                        <button class="lot-A-detail mr-3 bg-warning"  data-toggle="modal" data-target="#<%=parkingSlot.getParkingSlotNumber()%>">
                            <%= parkingSlot.getParkingSlotNumber()%>
                        </button>
                        <%
                        } else if (parkingSlot.getParkingSlotStatus() == 3) {
                        %>
                        <button class="lot-A-detail mr-3 bg-info"  data-toggle="modal" data-target="#<%=parkingSlot.getParkingSlotNumber()%>">
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
                        <div class="modal fade" id="<%=parkingSlot.getParkingSlotNumber()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                                                                    value="<%= parkingSlot.getParkingSlotNumber()%>"
                                                                    />
                                                            </div>
                                                            <% if (parkingSlot.getParkingSlotStatus() != 0) {%>

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
                                                                <label class="form-check-label col-12 col-sm-12" style="font-weight: bold; font-size:25px">PARKING SLOT STATUS</label>
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
<!--End Of Zone A -->   
