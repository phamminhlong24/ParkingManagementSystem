<%-- 
    Document   : userRequest
    Created on : May 30, 2022, 10:50:44 AM
    Author     : KIM DUONG
--%>

<%@page import="pm.dao.UserDAO"%>
<%@page import="pm.dao.RequestDAO"%>
<%@page import="pm.dto.Request"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession session1 = request.getSession(true);
    String userName = (String) session1.getAttribute("username");
    int uId = UserDAO.getUserIdByUserName(userName);
    ArrayList<Request> list = RequestDAO.getAllRequestUserScreen(uId);%>
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
                                                <p class="title-content">My Request</p>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div
                                    class="bg-white"
                                    style="

                                    height: 75vh;
                                    position: relative;
                                    background: rgba(255, 255, 255, 0.5);
                                    box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
                                    backdrop-filter: blur(7px);
                                    -webkit-backdrop-filter: blur(7px);
                                    border-radius: 20px;
                                    border: 1px solid rgba(255, 255, 255, 0.18);
                                    "
                                    >
                                   
                                        <table
                                            class="table"
                                            style="
                                            border-color: black;
                                            margin-bottom: 40px;
                                            color: black;
                                            border-radius: 20px;
                                            "
                                            >
                                            <thead >
                                                <tr style="  
                                                   background: rgb(238,174,202);
                                                   background: linear-gradient(209deg, rgba(238,174,202,1) 0%, rgba(148,187,233,1) 100%);border-radius: 20px;
                                                   ">
                                                    <th
                                                        scope="col"
                                                        style="
                                                        text-align: center;
                                                        
                                                        color: black;
                                                        "
                                                        >
                                                        Request ID
                                                    </th>
                                                    <th
                                                        scope="col"
                                                        style="
                                                        text-align: center;
                                                        
                                                        color: black;
                                                        "
                                                        >
                                                        Request Description
                                                    </th>
                                                    <th
                                                        scope="col"
                                                        style="
                                                        text-align: center;
                                                        
                                                        color: black;
                                                        "
                                                        >
                                                        Date Of Request
                                                    </th>
                                                    <th
                                                        scope="col"
                                                        style="
                                                        text-align: center;
                                                        
                                                        color: black;
                                                        "
                                                        >
                                                        Status
                                                    </th>
                                                </tr>
                                            </thead>
                                            <% 
                                                int count = 1;
                                                for (Request requestList : list) {
                                                    
                                            %>
                                            <tr style=" border-color: black;
                                                margin-top: 40px;
                                                margin-bottom: 40px;
                                                color: black;
                                                overflow: hidden;overflow-y: scroll">
                                                <td
                                                    scope="col"
                                                    style="
                                                    text-align: center;
                                                    border-bottom: 1px solid black;
                                                    color: rgb(123, 123, 123);
                                                    "
                                                    >
                                                    <%= count++%>
                                                </td>
                                                <td
                                                    scope="col"
                                                    style="
                                                    text-align: center;
                                                    border-bottom: 1px solid black;
                                                    color: rgb(123, 123, 123);
                                                    "
                                                    >
                                                    I want to cancel my booking.
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
                                                <td scope="col" style=" text-align: center; color: #01a2ff; border-bottom: 1px solid black; 
                                                    font-weight: bold ; vertical-align:middle ">
                                                    <span style="background-color: #cdedff; padding: 10px; border-radius: 20px; margin-top: 10px">Processing</span>
                                                </td>
                                                <%                                            } else {
                                                %>
                                                <td scope="col" style=" text-align: center; color: green; font-weight: bold;border-bottom: 1px solid black ; vertical-align:middle">
                                                    <span style="background-color: #c8e6c9;padding: 10px 25px; border-radius: 20px"> Accepted </span>
                                                </td>
                                                <%
                                                    }
                                                %>

                                            </tr>
                                            <%
                                                }
                                            %>




                                        </table>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--                                        <div class="footer mt-3">
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

