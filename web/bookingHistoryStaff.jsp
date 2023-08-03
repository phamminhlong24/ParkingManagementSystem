<%-- 
    Document   : bookingHistoryStaff
    Created on : Jun 18, 2022, 9:36:21 PM
    Author     : tranh
--%>

<%@page import="pm.dao.BookingDAO"%>
<%@page import="pm.dto.Booking"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                        <jsp:include page="menuStaff.jsp"/>
                        <!--End of Menu-->
                        <div class="body-right col-md-10">
                            <div class="right_in">
                                <div class="title-content">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="title col-md-12">
                                                <p class="title-content">My Booking History</p>
                                                <p class="title-small">
                                                    View real-time and occupied parking space
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="bg-white"
                                     style="
                                     border-radius: 20px;
                                     height: 60vh;
                                     position: relative;
                                     ">
                                    <div
                                        class="bg-white"
                                        style="
                                        /*margin-right: 30px;*/
                                        overflow: hidden;
                                        overflow-y: scroll;
                                        height: 60vh;
                                        position: relative;
                                        
                                        "
                                        >
                                        <table
                                            class="table"
                                            style="

                                            "
                                            >
                                            <thead style="" class="thead">
                                                <tr>
                                                    <th
                                                        scope="col"
                                                        style="
                                                        text-align: center;

                                                        color: black;
                                                        "
                                                        >
                                                        Booking ID
                                                    </th>
                                                    <th
                                                        scope="col"
                                                        style="
                                                        text-align: center;

                                                        color: black;
                                                        "
                                                        >
                                                        Vehicle Plate Number
                                                    </th>
                                                    <th
                                                        scope="col"
                                                        style="
                                                        text-align: center;

                                                        color: black;
                                                        "
                                                        >
                                                        Duration Of Booking
                                                    </th>
                                                    <th
                                                        scope="col"
                                                        style="
                                                        text-align: center;

                                                        color: black;
                                                        "
                                                        >
                                                        Parking Slot Number
                                                    </th>
                                                    <th
                                                        scope="col"
                                                        style="
                                                        text-align: center;

                                                        color: black;
                                                        "
                                                        >
                                                        Booking Status
                                                    </th>
                                                    <th
                                                        scope="col"
                                                        style="
                                                        text-align: center;

                                                        color: black;
                                                        "
                                                        >
                                                        Booking Date
                                                    </th>
                                                    <th
                                                        scope="col"
                                                        style="
                                                        text-align: center;

                                                        color: black;
                                                        "
                                                        >
                                                        Action
                                                    </th>
                                                </tr>

                                            </thead> 
                                            <tbody>

                                                <%
                                                    int count = 1;
                                                    String username = (String) session.getAttribute("username");
                                                    ArrayList<Booking> listBooking = BookingDAO.getBookingTempInfoByUserName(username);
                                                    for (Booking booking : listBooking) {
                                                %>


                                                <tr class="scrool">
                                                    <td scope="col" style=" text-align: center; color: rgb(123, 123, 123);">
                                                        <%= count++%>
                                                    </td>
                                                    <td scope="col" style=" text-align: center; color: rgb(123, 123, 123);">
                                                        <input name="vehiclePlateBooingHistory" 
                                                               value="<%= booking.getVehiclePlateNumber()%>"
                                                               style="border:none; background-color: #fff; text-align: center "
                                                               readonly=""
                                                               />
                                                    </td>
                                                    <% if (1 <= booking.getDurationOfBooking() && booking.getDurationOfBooking() <= 24) {
                                                    %>
                                                    <td scope="col" style=" text-align: center; color: rgb(123, 123, 123);">

                                                        <%= booking.getDurationOfBooking()%> hour
                                                    </td>
                                                    <%
                                                    } else {
                                                    %>
                                                    <td scope="col" style=" text-align: center; color: rgb(123, 123, 123);">
                                                        30 Days
                                                    </td>
                                                    <%
                                                        }
                                                    %>

                                                    <td scope="col" style=" text-align: center; color: rgb(123, 123, 123);">
                                                        <input name="vehiclePlateBooingHistory" 
                                                               value="<%= booking.getSlotNumber()%>"
                                                               style="border:none; background-color: #fff; text-align: center;width: 20% "
                                                               readonly=""
                                                               />
                                                    </td>
                                                    <%if (booking.getStatus() == 0) {
                                                    %>
                                                    <td scope="col"  style=" text-align: center; color: #01a2ff; font-weight: bold">
                                                        <span class="proc">Processing</span>
                                                    </td>
                                                    <%
                                                    } else if (booking.getStatus() == 1) {
                                                    %>
                                                    <td scope="col"  style=" text-align: center; color: green; font-weight: bold">
                                                        <span class="acti">Active</span>
                                                    </td>

                                                    <%
                                                    } else if (booking.getStatus() == 2) {
                                                    %>
                                                    <td scope="col" style=" text-align: center; color: red; font-weight: bold">
                                                        Booking fail
                                                    </td>                                            
                                                    <%
                                                    } else if (booking.getStatus() == 3) {
                                                    %>
                                                    <td scope="col" style=" text-align: center; color: purple; font-weight: bold">
                                                        Leaving process
                                                    </td>
                                                    <%
                                                    } else if (booking.getStatus() == 4) {
                                                    %>
                                                    <td scope="col" style=" text-align: center; color: gray; font-weight: bold">
                                                        Leaving
                                                    </td>
                                                    <%
                                                        }
                                                    %>
                                                    <td scope="col" style=" text-align: center; color: rgb(123, 123, 123);">
                                                        <%= booking.getBookDate()%>
                                                    </td>
                                                    <% if (booking.getStatus() == 1) {
                                                    %>
                                                    <td scope="col" style=" text-align: center; color: rgb(123, 123, 123);">
                                                        <button type="button" class="btn btn-danger" data-toggle="modal" 
                                                                data-target="#<%= booking.getSlotNumber()%>" >
                                                            Canceled
                                                        </button>
                                                    </td>
                                                    <%
                                                        }
                                                    %>
                                            <form action="mainController" method="post">
                                                <div class="modal fade" id="<%= booking.getSlotNumber()%>" 
                                                     tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
                                                     >
                                                    <div class="modal-dialog modal-sm modal-notify modal-danger" role="document">
                                                        <!--Content-->
                                                        <div class="modal-content text-center">
                                                            <!--Header-->
                                                            <div class="modal-header d-flex justify-content-center bg-warning ">
                                                                <p class="heading text-dark" style="font-size: 30px">WARNING</p>
                                                            </div>
                                                            <!--Body-->
                                                            <div class="modal-body">
                                                                <i class="fas fa-times fa-4x animated rotateIn" style="color:red"></i>
                                                                <h3>Are you sure for canceling our services?</h3>
                                                                <input name="vehiclePlateBooingHistory" 
                                                                       value="<%= booking.getVehiclePlateNumber()%>"
                                                                       style="border:none; background-color: #fff; text-align: center;display: none"
                                                                       readonly=""
                                                                       />
                                                                <input name="slotPlateBooingHistory" 
                                                                       value="<%= booking.getSlotNumber()%>"
                                                                       style="border:none; background-color: #fff; text-align: center;width: 15%;display: none "
                                                                       readonly=""
                                                                       />
                                                            </div>
                                                            <!--Footer-->
                                                            <div class="modal-footer flex-center">
                                                                <button type="submit" class="btn  btn-danger" name="action" value="cancelService">Yes</button>
                                                                <button type="button" class="btn  btn-info waves-effect" data-dismiss="modal">No</button>
                                                            </div>
                                                        </div>
                                                        <!--/.Content-->
                                                    </div>
                                                </div>
                                            </form>
                                            </tr>
                                            <%
                                                }
                                            %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!--                            <div class="footer mt-3">
                                                                <div class="row pt-1">
                                                                    <div class="col-md-6 mt-0">
                                                                        <div class="container-fluid">
                                                                            <h5 class="text-center">Our Address</h5>
                                                                            <div class="text-center">
                                                                                <p class="p-0 mb-0">457 Nguyen Hue</p>
                                                                                <p class="p-0 mb-0">District 1, TP.HCM, Viet Nam</p>
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
                                                            </div>-->
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
                }, 1000);
            };
            $(function () {
                loader();
            });
        </script>
    </body>
</html>
