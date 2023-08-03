<%-- 
    Document   : adminUserManage
    Created on : May 30, 2022, 10:49:16 AM
    Author     : KIM DUONG
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="pm.dto.UserA"%>
<%@page import="pm.dao.UserDAO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Admin userManagement</title>
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
                        <jsp:include page="menuAdmin.jsp"/>
                        <!--End of Menu-->
                        <div class="body-right col-md-10">
                            <div class="title-content">
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="title col-md-12">
                                            <p class="title-content">User's Managerment</p>
                                            <p class="title-small">
                                                View real-time and occupied parking space
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div style="
                                 height: 75vh;
                                 position: relative;
                                 background: rgba(255, 255, 255, 0.5);
                                 box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
                                 backdrop-filter: blur(7px);
                                 -webkit-backdrop-filter: blur(7px);
                                 border-radius: 20px;
                                 border: 1px solid rgba(255, 255, 255, 0.18);
                                 ">

                                <form action="mainController" method="post" class="form-inline" style="margin-left: 900px">
                                    <div  class="form-group" style="color: black; background-color: white" >
                                        <input type="text" class="form-control" placeholder="Enter Vehicle's Plate Num"
                                               name="txtAVehicleSearch" value="<%= (request.getParameter("txtAVehicleSearch") == null) ? "" : request.getParameter("txtAVehicleSearch")%>"/>
                                    </div>
                                    <button type="submit" value="aSearchVehicle" name="action"
                                            class="btn btn-outline-primary my-2 my-sm-0" >
                                        Search
                                    </button>
                                </form>
                                <% ArrayList<UserA> list = UserDAO.getAccounts();
                                %>
                                <table class="table" style=" border-color: black; margin-top: 5px; color: black;" >
                                    <thead style="  
                                           background: rgb(238,174,202);
                                           background: linear-gradient(209deg, rgba(238,174,202,1) 0%, rgba(148,187,233,1) 100%);">

                                        <tr>
                                            <th scope="col"
                                                style="
                                                text-align: center;
                                                "
                                                >
                                                User ID
                                            </th>
                                            <th
                                                scope="col"
                                                style="
                                                text-align: center;
                                                "
                                                >
                                                Username
                                            </th>
                                            <th
                                                scope="col"
                                                style="
                                                text-align: center;
                                                "
                                                >
                                                Password
                                            </th>
                                            <th
                                                scope="col"
                                                style="
                                                text-align: center;
                                                "
                                                >
                                                Email
                                            </th>
                                            <th
                                                scope="col"
                                                style="
                                                text-align: center;
                                                "
                                                >
                                                Phone
                                            </th>
                                            <th
                                                scope="col"
                                                style="
                                                text-align: center;
                                                "
                                                >
                                                Full Name
                                            </th>
                                            <th
                                                scope="col"
                                                style="
                                                text-align: center;
                                                "
                                                >
                                                Role
                                            </th>
                                            <th
                                                scope="col"
                                                style="
                                                text-align: center;
                                                "
                                                >
                                                Status
                                            </th>
                                            <th
                                                scope="col"
                                                style="
                                                text-align: center; 
                                                "
                                                >
                                                Action
                                            </th>
                                        </tr>
                                    </thead>
                                    <!--End of Header-->
                                    <%
                                        for (UserA userA : list) {
                                    %>
                                    <tr>
                                        <td class="details" style='color: rgb(123, 123, 123); text-align: center'><%= userA.getuID()%></td>
                                        <td class="details" style='color: rgb(123, 123, 123); text-align: center'><%= userA.getUserName()%></td>
                                        <td class="details" style='color: rgb(123, 123, 123); text-align: center'><%= userA.getPassword()%></td>
                                        <td class="details" style='color: rgb(123, 123, 123); text-align: center'><%= userA.getEmail()%></td>
                                        <td class="details" style='color: rgb(123, 123, 123); text-align: center'><%= userA.getPhone()%></td>
                                        <td class="details" style='color: rgb(123, 123, 123); text-align: center'><%= userA.getFullname()%></td>
                                        <td class="details" style='color: rgb(123, 123, 123); text-align: center'>
                                            <% if (userA.getRole() == 0) {
                                            %>
                                            <p style = "color:red">Admin</p>
                                            <%
                                            } else {
                                            %>
                                            <p style = "color:rgb(123, 123, 123)">User</p>
                                            <%
                                                }
                                            %>
                                        </td>
                                        <td class="details" style='text-align: center; '>
                                            <% if (userA.getStatus() == 0) {
                                            %>
                                            <div style="color: #c62828; font-weight: bold; background-color: #ffcdd2;
                                                 padding: 0.2rem 5px; border-radius: 20px;
                                                 ">Inactive</div>
                                            <%
                                            } else {
                                            %>
                                            <div style="color: #388e3c; font-weight: bold; background-color: #c8e6c9;
                                                 padding: 0.2rem 5px; border-radius: 20px;
                                                 ">Active</div>
                                            <%
                                                }
                                            %>
                                        </td>
                                        <td>
                                            <% if (userA.getStatus() == 1 && userA.getRole() == 1) {
                                            %>
                                            <form action="mainController" method="post">
                                                <input type = "hidden" value = "<%=userA.getuID()%>" name ="uid" >
                                                <input type = "hidden" value = "<%=userA.getStatus()%>" name ="status" >
                                                <button type="submit" value="blockVehicle" name="action" class="btn btn-danger">
                                                    Block
                                                </button>
                                            </form>
                                            <%
                                            } else if (userA.getStatus() == 0 && userA.getRole() == 1) {
                                            %>
                                            <form action="mainController" method="post">
                                                <input type = "hidden" value = "<%=userA.getuID()%>" name ="uid" >
                                                <input type = "hidden" value = "<%=userA.getStatus()%>" name ="status" >
                                                <button type="submit" value="blockVehicle" name="action" class="btn btn-success">
                                                    Unblock
                                                </button>
                                            </form>
                                            <%
                                                }
                                            %>
                                        </td>
                                    </tr>

                                    <%
                                        }
                                    %>
                                </table>
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
    </body>
</html>

