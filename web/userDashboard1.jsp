<%-- 
    Document   : userDashboard1
    Created on : May 30, 2022, 10:50:34 AM
    Author     : KIM DUONG
--%>

<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="pm.dto.TimeEnd"%>
<%@page import="pm.dao.TimeDAO"%>
<%@page import="pm.dto.TimeStart"%>
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
    Date date = new Date();   // given date
    Calendar calendar = GregorianCalendar.getInstance(); // creates a new calendar instance
    calendar.setTime(date);   // assigns calendar to given date 
    long hour = calendar.get(Calendar.HOUR_OF_DAY); // gets hour in 24h format
    calendar.get(Calendar.HOUR);        // gets hour in 12h format
    calendar.get(Calendar.MONTH);       // gets month number, NOTE this is zero based!


%>
<html lang="en">
    <head>
        <title>DashBoard</title>
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
            />

        <!-- Bootstrap CSS -->
        <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
            integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
            crossorigin="anonymous"
            />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
            integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" 
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" 
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link
            rel="stylesheet"
            href="fonts/material-design-iconic-font/css/material-design-iconic-font.css"
            /> 
        <link rel="stylesheet" href="./style.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Mukta:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">

    </head>

    <body >
        <div class="loader-wrapper">
            <span class="loader"><span class="loader-inner"></span></span>
            <br/>
            <p style="color:#000;font-size: 20px">   Loading...</p>
        </div>



        <div class="content">
            <!--Header-->
            <jsp:include page="header.jsp"/>
            <!--End of Header-->
            <div class="content-body">
                <div class="container-fluid">
                    <div class="row">
                        <!--Menu-->
                        <jsp:include page="menu.jsp"/>
                        <!--End of Menu-->
                        <div class="body-right col-md-10">
                            <div class="right_in">
                                <div class="title-content">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="title col-md-7">
                                                <p class="title-content">Parking Space Overview</p>
                                            </div>
                                            <div class="d-flex justify-content-end button-bookingSlot col-md-5">
                                                <button class="btn-warning-booking" data-toggle="modal" data-target="#modalBooking" >
                                                    Booking Slot
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="lot-content">
                                    <div class="container-fluid">
                                        <div class="parking-list">
                                            <!-- Zone A -->
                                            <jsp:include page="zoneA.jsp"></jsp:include>
                                                <!--Zone Bottom (Zone B && Zone C)-->
                                            <jsp:include page="zoneBottom.jsp"></jsp:include>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="modalBooking" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" style='max-width: 1000px; height: 300px' role="document">
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
                                                <!--Choose Payment Method-->
                                                <div class="form-group col-md-12">
                                                    <label class="form-check-label col-12 col-sm-12" style=" font-size:20px">Choose booking method</label>
                                                    <div class="col-12 col-sm-12">
                                                        <select name="methodNameA" class="custom-select">
                                                        <% ArrayList<PaymentMethod> listPayment = PaymentDAO.getPaymentMethod();
                                                            for (PaymentMethod paymentMethod : listPayment) {
                                                        %>
                                                        <option 
                                                            value="<%=paymentMethod.getMethodName()%>"
                                                            ><%=paymentMethod.getMethodName()%></option>
                                                        <%

                                                            }
                                                        %>
                                                    </select>

                                                </div>
                                            </div>


                                            <!--End of Payment Method-->



                                            <!--Choose Payment Type-->
                                            <% ArrayList<PaymentType> listPaymentType = PaymentDAO.getPaymentType();%>
                                            <div class="form-group col-md-12">
                                                <label class="form-check-label col-12 col-sm-12" style="font-size:20px">Choose payment type</label>
                                                <div class="col-12 col-sm-12">
                                                    <select name="typeNameA" class="custom-select" id="paymentType"  onchange="showValue()">
                                                        <%
                                                            for (PaymentType paymentType : listPaymentType) {
                                                        %>
                                                        <option value="<%=paymentType.getTypeID()%>"><%=paymentType.getTypeName()%></option>

                                                        <%

                                                            }
                                                        %>                                                                                           
                                                    </select>
                                                    <div class="hourBooking" style="display: none">
                                                        <div class="row">
                                                            <!--Hour Start-->
                                                            <div class="col-md-6 p-0">
                                                                <label class="form-check-label col-12 col-sm-12" style=" font-size:20px">Choose start time</label>
                                                                <small style="color: grey; text-align: center; margin-left: 12px">(Choose the time you want)</small>
                                                                <div class="col-12 col-sm-12">
                                                                    <select name="timStartA" class="custom-select" id= "timeIn" onClick="showTime()">
                                                                        <% ArrayList<TimeStart> list = new ArrayList();
                                                                            TimeDAO dao = new TimeDAO();
                                                                            list = dao.getAllTimeStart();
                                                                            for (TimeStart timStart : list) {
                                                                                if (timStart.getTimeStart() > hour && timStart.getTimeStart() < 24) {
                                                                        %>
                                                                        <option 
                                                                            value="<%=timStart.getTimeStart()%>"
                                                                            ><%=timStart.getTimeStart()%></option>
                                                                        <%
                                                                                }
                                                                            }
                                                                        %>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <!--End Hour start-->
                                                            <!--Hour end-->
                                                            <div class="col-md-6 p-0">
                                                                <label class="form-check-label col-12 col-sm-12" style=" font-size:20px">Choose end time</label>
                                                                <small style="color: grey; text-align: center; margin-left: 12px">(Choose the time you want to out)</small>
                                                                <div class="col-12 col-sm-12">
                                                                    <select name="timEndA" class="custom-select" id="timOut" onClick="showHour()">
                                                                        <% ArrayList<TimeEnd> listEnd = new ArrayList();
                                                                            TimeDAO daoE = new TimeDAO();
                                                                            listEnd = daoE.getAllTimeEnd();
                                                                            for (TimeEnd timEnd : listEnd) {
                                                                                if (timEnd.getTimeEnd() > hour && timEnd.getTimeEnd() <= 24) {
                                                                        %>

                                                                        <%
                                                                                }
                                                                            }
                                                                        %>
                                                                    </select>

                                                                </div>
                                                            </div>
                                                            <!--End Hour end-->

                                                            <div id="hour" style="padding-left: 12px">

                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>

                                            <!--End Of Payment Type-->

                                            <!--Choose Your Vehicle-->
                                            <div class="form-group col-md-12">
                                                <label class="form-check-label col-12 col-sm-12" style="font-size:22px">Choose your vehicle</label>
                                                <div class="col-12 col-sm-12">
                                                    <select name="vehicleNameA" class="custom-select" onchange="validateSelectBox(this)">
                                                        <% int uid = (Integer) session.getAttribute("userID");
                                                            ArrayList<Vehicle> listVehicle = VehicleDAO.getVehiclebyUserID(uid);
                                                            for (Vehicle vehicle : listVehicle) {
                                                                if (vehicle.getStatus() == 0) {
                                                        %>
                                                        <option value="<%=vehicle.getPlateNumber()%>"><%=vehicle.getPlateNumber()%></option>
                                                        <%} else {
                                                        %>
                                                        <!--<option value="" class="text-danger">All of your vehicle is park</option>-->
                                                        <%
                                                                }
                                                            }
                                                        %>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="modal-footer d-flex justify-content-end">
                                                <div>
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                </div>
                                                <div>
                                                    <% int uid1 = (Integer) session.getAttribute("userID");
                                                        int flag = 0;
                                                        ArrayList<Vehicle> listVehicle1 = VehicleDAO.getVehiclebyUserID(uid1);
                                                        for (Vehicle vehicle : listVehicle1) {
                                                            if (vehicle.getStatus() == 0) {
                                                                flag = 1;
                                                            }
                                                        }
                                                        if (flag == 1) {
                                                    %>
                                                    <button
                                                        class="btn buttonBooking"
                                                        style="background-color: #e5dccb"
                                                        type="submit"
                                                        value="ModalA"
                                                        name="action"
                                                        >
                                                        Booking
                                                    </button>
                                                    <%
                                                        }
                                                    %>

                                                </div>
                                            </div>


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

        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script
            src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"
        ></script>

        <script>

                                                        var loader = function () {
                                                            setTimeout(function () {
                                                                $(".loader-wrapper").css({opacity: 0, visibility: "hidden"});
                                                            }, 300);
                                                        };
                                                        $(function () {
                                                            loader();
                                                        });
        </script>

        <script language="javascript">

            function showValue() {

                var ele = document.querySelector("#paymentType").value;

                var div = document.querySelector(".hourBooking");

                if (ele == 2) {
                    div.style.display = "block";

                } else {
                    div.style.display = "none";
                }
            }



            function showTime() {
                let eleIn = document.querySelector("#timeIn").value;
                let timeIn = parseInt(eleIn) + 1;
//                console.log(timeIn)

                var html = "";

                for (let i = timeIn; i <= 24;
                        i++
                        ) {
                    html +=
                            "<option value='" + i + "'>" + i + "</option>"
//                    console.log(html)
                }
                document.getElementById("timOut").innerHTML = html;
//                console.log("html", html);



            }

            function showHour() {
                let eleIn = document.querySelector("#timeIn").value;
                var html = "";

                let eleOut = document.getElementById("timOut").value;

                let hour = eleOut - eleIn;

                html =
                        "<span>Hour your want to booking is: </span> <input name= " + "hourModal" + " value= " + hour + " style= " + "border:none; background-color: #fff; text-align: center; font-size: 22px " + " readonly='' " + "/>"
                document.getElementById("hour").innerHTML = html;
            }


        </script>

    </body>
</html>