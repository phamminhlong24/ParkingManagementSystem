<%-- 
    Document   : notify
    Created on : Jun 17, 2022, 7:32:38 PM
    Author     : tranh
--%>

<%@page import="pm.dto.Notify"%>
<%@page import="pm.dao.NotiDAO"%>
<%@page import="pm.dao.ParkingSlotDAO"%>
<%@page import="pm.dao.VehicleDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@page import="pm.dao.UserDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="pm.dao.BookingDAO"%>
<%@page import="pm.dto.Booking"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    NotiDAO daoN = new NotiDAO();
    UserDAO daoU = new UserDAO();
    HttpSession session1 = request.getSession(true);
    String userName = (String) session1.getAttribute("username");
    int userId = daoU.getUserIdByUserName(userName);
    ArrayList<Notify> noti = daoN.getNotiInfoByUserid(userId);

%>

<html lang="en">
    <head>
        <title>My Request</title>
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
        <link rel="stylesheet" href="./style.css" />
    </head>
    <body>

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
                                            <div class="title col-md-12">
                                                <p class="title-content">Notification</p>
                                                <p class="title-small">
                                                    View real-time and occupied parking space
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div
                                    class=""
                                    style="
                                    height: 65vh;
                                    position: relative;
                                    overflow: hidden;
                                    overflow-y: scroll
                                    "
                                    >

                                    <% for (Notify notify : noti) {
                                            String slot = notify.getSlotNumber();
                                            if (notify.getParkingType().equals("Hour")) {
                                    %>
                                    <div style="width: 99%; height: 90px; 
                                         box-shadow: 10px 10px 5px rgba(0, 0, 0, 0.25);
                                         margin: 5px 0 20px 0;
                                         background-color: 	#FAF0E6;
                                         ">
                                        <p style="font-size: 23px; padding: 10px 20px">Your booking time at slot <%= slot%> is over.<br/>
                                            We hope you have a great time in using our service.
                                            Thank your and see you later.</p>            
                                    </div>
                                    <%
                                    } else if (notify.getParkingType().equals("Month")) {
                                    %>
                                    <div style="width: 99%; 
                                         box-shadow: 10px 10px 5px rgba(0, 0, 0, 0.25);
                                         margin: 5px 0 20px 0;
                                         background-color: 	#FAF0E6;
                                         ">
                                        <p style="font-size: 23px; padding: 10px 20px">Your booking time at slot <%= slot%> is over.<br/>
                                            Please follow the information below for booking this slot in the next month.</p>  

                                        <p style="font-size: 20px; padding: 3px 20px; font-style: italic">Please make payment before the last day of the month. 
                                            In case the last day of a month is Saturday, Sunday, public holiday, the water supply stop date will be the working day immediately following that month. You can pay by cash at the management office at site (08:00 am - 05:00 pm) or via bank transfer with the details as below.
                                            We highly recommend Customers to pay via bank transfer.</p>
                                        <p style="font-weight: bold;font-size: 20px; padding: 3px 20px">
                                            Name : HeneryDaisy VietNam <br/>
                                            Account number : (123-012345-123) Address: TPHCM <br/>
                                            Bank: HienandDuong Bank (Vietnam) Ltd 
                                        </p>
                                        <p style="font-weight: bold;font-size: 20px; padding: 3px 20px 5px">Please ensure that the bank transfer description is clearly 
                                            stated: (Unit no:......., payment fee...... for month..........).
                                        </p>
                                    </div>

                                    <%
                                            }
                                        }
                                    %>

                                </div>
                            </div>
                            <!----- for is over ----->





                            <!--                            <div class="footer mt-3">
                                                            <div class="row pt-1">
                                                                <div class="col-md-6 mt-0">
                                                                    <div class="container-fluid">
                                                                        <h5 class="text-center">Our Address</h5>
                                                                        <div class="text-center">
                                                                            <p class="p-0 mb-0">457 Nguyen Hue</p>
                                                                            <p class="p-0 mb-0">Distric 1, TP.HCM, Viet Nam</p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <h5>Contact Us</h5>
                                                                    <i class="fa fa-phone fa-lg"></i>: 028 7300 1866<br />
                            
                                                                    <i class="fa fa-envelope fa-lg"></i>:
                                                                    <a href="daisymarika81@gmail.com"
                                                                       >daisymarika81@gmail.com</a
                                                                    >
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>-->
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


    </body>
</html>
