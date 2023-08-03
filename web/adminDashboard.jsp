<%-- 
    Document   : adminDashboard
    Created on : May 30, 2022, 10:42:42 AM
    Author     : KIM DUONG
--%>

<%@page import="pm.dto.Vehicle"%>
<%@page import="pm.dao.VehicleDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pm.dao.UserDAO"%>
<%@page import="pm.dto.UserA"%>
<%@page import="pm.dao.BookingDAO"%>
<%@page import="pm.dto.Booking"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Admin DashBoard</title>
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="./style.css" />

    </head>

    <body>
        <div class="loader-wrapper" style="height:950px">
            <span class="loader"><span class="loader-inner"></span></span>
            <br/>
            <p style="color:#000;font-size: 20px">   Loading...</p>
        </div>
        <div class="content">
            <!--Header-->
            <jsp:include page="header.jsp"/>
            <!--End of Header-->
            <%
                ArrayList<UserA> list = UserDAO.getAccounts();
                ArrayList<Vehicle> listVehicle = VehicleDAO.getAllVehicle();
                ArrayList<Vehicle> listVehicleStatus = VehicleDAO.getAllVehicleStatus();
                ArrayList<Booking> listBooking = BookingDAO.getBookingDatetime();
            %>
            <div class="content-body">
                <div class="container-fluid">
                    <div class="row">
                        <!--Menu-->
                        <jsp:include page="menuAdmin.jsp"/>
                        <!--End of Menu-->
                        <div class="body-right col-md-10">
                            <div class="right_in">
                                <div class="title-content">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="title col-md-12">
                                                <p class="title-content">Admin Dashboard</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="overview row" style="border-radius: 15px">
                                            <div class="col-md-4 icon-center">
                                                <i class="fa-solid fa-car"></i>
                                            </div>
                                            <div class="col-md-8 textoverview-center">
                                                <div
                                                    class="font-weight-bold"
                                                    style="color: #7f4ec5; font-size: 1.0rem"
                                                    >
                                                    <%  int count1 = 0;
                                                        for (Vehicle v : listVehicleStatus) {
                                                            count1++;
                                                        }
                                                    %>
                                                    <%= count1%>
                                                </div>     
                                                <div class="font-weight-bold">
                                                    Total of cars in park(tong xe dang do trong bai)
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                                
                                    <div class="col-md-4">
                                        <div class="overview row" style="border-radius: 15px">
                                            <div class="col-md-4 icon-center">
                                                <i class="fa-solid fa-users"></i>
                                            </div>
                                            <div class="col-md-8 textoverview-center">
                                                <div
                                                    class="font-weight-bold"
                                                    style="color: #7f4ec5; font-size: 1.0rem"
                                                    >
                                                    <%  int count = 0;
                                                        for (Vehicle v : listVehicle) {
                                                            count++;
                                                        }
                                                    %>
                                                    <%= count%>
                                                </div>
                                                 <div class="font-weight-bold">
                                                Total Vehicle in parking slot
                                            </div>
                                            </div>
                                        </div>
                                    </div>
                                                
                                    <div class="col-md-4">
                                        <div class="overview row" style="border-radius: 15px">
                                            <div class="col-md-8 textoverview-center">
                                                <div
                                                    class="font-weight-bold"
                                                    style="color: #7f4ec5; font-size: 1.0rem"
                                                >
                                                 <%  int count6 = 0;
                                                    for (UserA userA : list) {
                                                        count6++;
                                                    }
                                                %>
                                                <%= count6%>
                                            </div>
                                            <div class="font-weight-bold">
                                                 Total Registered User(tong so tai khoan dang hoat dong)
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                            
                                <div class="col-md-4">
                                    <div class="overview row">
                                        <div class="col-md-4 icon-center">
                                            <i class="fa-solid fa-users"></i>
                                        </div>
                                        <div class="col-md-8 textoverview-center">
                                            <div
                                                class="font-weight-bold"
                                                style="color: #7f4ec5; font-size: 1.0rem"
                                                >
                                                <%  int count5 = 0;
                                                    for (Booking checkindate : listBooking) {
                                                        count6++;
                                                    }
                                                %>
                                                <%= count5%>
                                            </div>
                                                
                                                <div class="font-weight-bold">Number of vehicle parked today(tong so xe dat trong ngay)</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="overview row" style="border-radius: 15px">
                                            <div class="col-md-4 icon-center">
                                                <i class="fa-solid fa-bell"></i>
                                            </div>
                                            <div class="col-md-8 textoverview-center">
                                                <div
                                                    class="font-weight-bold"
                                                    style="color: #7f4ec5; font-size: 1.0rem"
                                                    >
                                                    3
                                                </div>
                                                <div class="font-weight-bold">
                                                    Total Registered User Request
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="lot-content">
                                    <div class="container-fluid">
                                        <div class="parking-list">
                                            <!-- Zone A -->
                                            <jsp:include page="zoneAMangage.jsp"></jsp:include>
                                                <!--Zone Bottom (Zone B && Zone C)-->
                                            <jsp:include page="zoneBottomManage.jsp"></jsp:include>
                                        </div>
                                    </div>
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
                }, 500);
            };
            $(function () {
                loader();
            });
        </script>
    </body>
</html>


