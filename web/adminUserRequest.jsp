<%-- 
    Document   : adminUserRequest
    Created on : May 30, 2022, 10:49:33 AM
    Author     : KIM DUONG
--%>

<%@page import="pm.dao.RequestDAO"%>
<%@page import="pm.dto.Request"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% ArrayList<Request> list = RequestDAO.getAllRequestAdminScreen();%>
<html lang="en">
    <head>
        <title>Admin User Request</title>
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
                        <jsp:include page="menuStaff.jsp"/>
                        <!--End of Menu-->
                        <div class="body-right col-md-10">
                            <div class="right_in">
                            <div class="title-content mb-1">
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="title col-md-12">
                                            <p class="title-content">User Request Management</p>
                                            <p class="title-small">
                                                View real-time and occupied parking space
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div
                                class="bg-white"
                                style="
                                
                                height: 60vh;
                                position: relative;
                                box-shadow: 10px 10px 5px rgba(0, 0, 0, 0.25);
                                overflow: hidden;
                                overflow-y: scroll;
                                border-radius: 20px;
                                "
                                >
                                <form
                                    action="mainController"
                                    method="post"
                                    class="form-inline"
                                    style="margin-left: 700px"
                                    >
                                    <div
                                        class="form-group"
                                        style="color: black; background-color: white"
                                        >
                                        <input
                                            type="text"
                                            class="form-control"
                                            placeholder="Enter User's ID"
                                            name="txtAccountSearch"
                                            value=""
                                            />
                                    </div>
                                    <button
                                        type="submit"
                                        value="searchAccount"
                                        name="action"
                                        class="btn btn-outline-primary my-2 my-sm-0"
                                        >
                                        Search
                                    </button>
                                </form>
                                <table>
                                    <table
                                        class="table"
                                        style="
                                        border-color: black;
                                        margin-top: 5px;
                                        color: black;
                                        "
                                        >
                                        <thead class="thead">
                                            <tr>
                                                <th
                                                    scope="col"
                                                    style="
                                                    text-align: center;
                                                    background-color: #01a2ff;
                                                    color: white;
                                                    "
                                                    >
                                                    Request ID
                                                </th>
                                                <th
                                                    scope="col"
                                                    style="
                                                    text-align: center;
                                                    background-color: #01a2ff;
                                                    color: white;
                                                    "
                                                    >
                                                    User ID
                                                </th>

                                                <th
                                                    scope="col"
                                                    style="
                                                    text-align: center;
                                                    background-color: #01a2ff;
                                                    color: white;
                                                    "
                                                    >
                                                    Booking ID
                                                </th>
                                                <th
                                                    scope="col"
                                                    style="
                                                    text-align: center;
                                                    background-color: #01a2ff;
                                                    color: white;
                                                    "
                                                    >
                                                    Slot Number
                                                </th>
                                                <th
                                                    scope="col"
                                                    style="
                                                    text-align: center;
                                                    background-color: #01a2ff;
                                                    color: white;
                                                    "
                                                    >
                                                    Request Description
                                                </th>
                                                <th
                                                    scope="col"
                                                    style="
                                                    text-align: center;
                                                    background-color: #01a2ff;
                                                    color: white;
                                                    "
                                                    >
                                                    Vehicle Plate Number
                                                </th>

                                                <th
                                                    scope="col"
                                                    style="
                                                    text-align: center;
                                                    background-color: #01a2ff;
                                                    color: white;
                                                    "
                                                    >
                                                    Date Of Request
                                                </th>
                                                <th
                                                    scope="col"
                                                    style="
                                                    text-align: center;
                                                    background-color: #01a2ff;
                                                    color: white;
                                                    "
                                                    >
                                                    Status
                                                </th>
                                                <th
                                                    scope="col"
                                                    style="
                                                    text-align: center;
                                                    background-color: #01a2ff;
                                                    color: white;
                                                    "
                                                    >
                                                    Action
                                                </th>
                                            </tr>
                                        </thead>
                                        <% for (Request requestList : list) {
                                        %>
                                        <form action="mainController" method="post">
                                            <tr>
                                                <td
                                                    scope="col"
                                                    style="
                                                    text-align: center;
                                                    border-bottom: 1px solid black;
                                                    color: rgb(123, 123, 123);
                                                    "
                                                    >
                                                    <input name="requestID"
                                                           value="<%= requestList.getRequestId()%>"
                                                           style ="border: none; background-color: #fff; width:30%;text-align: center"
                                                           readonly=""
                                                           />

                                                </td>
                                                <td
                                                    scope="col"
                                                    style="
                                                    text-align: center;
                                                    border-bottom: 1px solid black;
                                                    color: rgb(123, 123, 123);
                                                    "
                                                    >
                                                    <input name="userID"
                                                           value="<%= requestList.getUserId()%>"
                                                           style ="border: none; background-color: #fff; width:10%;text-align: center"
                                                           readonly=""
                                                           />

                                                </td>
                                                <td
                                                    scope="col"
                                                    style="
                                                    text-align: center;
                                                    border-bottom: 1px solid black;
                                                    color: rgb(123, 123, 123);
                                                    "
                                                    >
                                                    <input name="bookingID"
                                                           value="<%= requestList.getBookingID()%>"
                                                           style ="border: none; background-color: #fff; width:20%;text-align: center"
                                                           readonly=""
                                                           />

                                                </td>

                                                <td
                                                    scope="col"
                                                    style="
                                                    text-align: center;
                                                    border-bottom: 1px solid black;
                                                    color: rgb(123, 123, 123);
                                                    "
                                                    >
                                                    <input name="slotNumber"
                                                           value="<%= requestList.getParkingSlotNumber()%>"
                                                           style ="border: none; background-color: #fff; width: 35%;text-align: center"
                                                           readonly=""
                                                           />
                                                </td>
                                                <td
                                                    scope="col"
                                                    style="
                                                    text-align: center;
                                                    border-bottom: 1px solid black;
                                                    color: rgb(123, 123, 123);
                                                    "
                                                    >
                                                    Cancel my booking.
                                                </td>

                                                <td
                                                    scope="col"
                                                    style="
                                                    text-align: center;
                                                    border-bottom: 1px solid black;
                                                    color: rgb(123, 123, 123);
                                                    "
                                                    >
                                                    <input name="vehiclePlateNumber"
                                                           value="<%= requestList.getVehiclePlateNumber()%>"
                                                           style ="border: none; background-color: #fff;text-align: center"
                                                           readonly=""
                                                           />
                                                </td>
                                                <td
                                                    scope="col"
                                                    style="
                                                    text-align: center;
                                                    border-bottom: 1px solid black;
                                                    color: rgb(123, 123, 123);
                                                    "
                                                    >
                                                    <%= requestList.getDateRequest()%>
                                                </td>
                                                <% if (requestList.getRequestStatus() == 0) {

                                                %>
                                                <td
                                                    scope="col"
                                                    style="
                                                    text-align: center;
                                                    border-bottom: 1px solid black;
                                                    color: rgb(0, 179, 255);
                                                    "
                                                    >
                                                    <span class="proc">Processing</span>
                                                </td>

                                                <td
                                                    class=""
                                                    scope="col"
                                                    style="
                                                    text-align: center;
                                                    border-bottom: 1px solid black;
                                                    "
                                                    >
                                                    <button class="btn btn-success" name="action" value="accecptCancelBooking">Accept</button>
                                                </td>
                                                <%                                            } else {
                                                %>
                                                <td
                                                    class="text-success"
                                                    scope="col"
                                                    style="
                                                    text-align: center;
                                                    border-bottom: 1px solid black;
                                                    "
                                                    >
                                                    <span class="acti">Accepted</span>
                                                </td>

                                                <%
                                                    }
                                                %>

                                            </tr>
                                        </form>
                                        <%
                                            }
                                        %>
                                    </table>
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
                            </div>-->
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
    </body>
</html>

