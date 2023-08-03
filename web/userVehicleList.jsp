<%@page import="pm.dao.VehicleDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pm.dto.Vehicle"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Vehicle List</title>
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="./style.css" />
    </head>

    <body>

        <div class="content">
            <!--Header-->
            <jsp:include page="header.jsp" />
            <!--End of Header-->
            <div class="content-body">
                <div class="container-fluid">
                    <div class="row">
                        <!--Menu-->

                        <jsp:include page="menu.jsp" />

                        <!--End of Menu-->
                        <div class="body-right col-md-10">
                            <div class="right_in">
                                <div class="title-content">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="title col-md-12">
                                                <p class="title-content">My Vehicles</p>
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
                                    <form action="mainController" method="post" class="form-inline pt-3" style="margin-left: 900px"> 
                                        <div class="form-group" style="color: black; background-color: white">
                                            <input type="text" class="form-control" placeholder="Enter Vehicle's Plate Num"
                                                   name="txtVehicleSearch" value="<%= (request.getParameter("txtVehicleSearch") == null) ? "" : request.getParameter("txtVehicleSearch")%>"/>
                                        </div>
                                        <button type="submit" value="uSearchVehicle" name="action" class="btn btn-outline-primary my-2 my-sm-0">
                                            Search
                                        </button>
                                    </form>
                                    <table class="table" style="
                                           border-color: black;
                                           margin-top: 5px;
                                           color: black;
                                           ">
                                        <thead style="  
                                               background: rgb(238,174,202);
                                               background: linear-gradient(209deg, rgba(238,174,202,1) 0%, rgba(148,187,233,1) 100%);">
                                            <tr>
                                                <th scope="col" style="
                                                    text-align: center;
                                                    color: black;
                                                    ">
                                                    Vehicle ID
                                                </th>
                                                <th scope="col" style="
                                                    text-align: center;

                                                    color: black;
                                                    ">
                                                    Vehicle Name
                                                </th>
                                                <th scope="col" style="
                                                    text-align: center;

                                                    color: black;
                                                    ">
                                                    Plate Number
                                                </th>
                                                <th scope="col" style="
                                                    text-align: center;

                                                    color: black;
                                                    ">
                                                    Vehicle Description
                                                </th>
                                                <th scope="col" style="
                                                    text-align: center;

                                                    color: black;
                                                    ">
                                                    Vehicle Status
                                                </th>
                                                <th scope="col" style="
                                                    text-align: center;

                                                    color: black;
                                                    ">
                                                    Action
                                                </th>
                                            </tr>
                                        </thead>
                                        <%
                                            String keyword = request.getParameter("txtVehicleSearch");
                                            Integer userID = (Integer) session.getAttribute("userID");
                                            ArrayList<Vehicle> list;
                                            int count = 1;
                                            if (keyword == null) {
                                                list = VehicleDAO.searchByPlateNumber("", userID);
                                            } else {
                                                list = VehicleDAO.searchByPlateNumber(keyword, userID);
                                            }
                                            for (Vehicle vehicle : list) {%>
                                        <tr style="
                                            border-color: black;
                                            margin-top: 40px;
                                            margin-bottom: 40px;
                                            color: black;
                                            overflow: hidden;overflow-y: scroll
                                            ">
                                            <td scope="col" style=" text-align: center;color: rgb(123, 123, 123);">
                                                <%= count++%>
                                            </td>
                                            <td scope="col" style=" text-align: center;color: rgb(123, 123, 123);">
                                                <%= vehicle.getVehicleName()%>
                                            </td>
                                            <td scope="col" style=" text-align: center;color: rgb(123, 123, 123);">
                                                <%= vehicle.getPlateNumber()%>
                                            </td>
                                            <td scope="col" style=" text-align: center; color: rgb(123, 123, 123);">
                                                <%= vehicle.getVehicleDescription()%>
                                            </td>
                                            <td scope="col" style=" text-align: center; color: rgb(123, 123, 123);">
                                                <% if (vehicle.getStatus() == 0) {
                                                %>
                                                <div style="color: #c62828; font-weight: bold; background-color: #ffcdd2;
                                                     padding: 0.2rem 5px; border-radius: 20px;
                                                     ">Not parked</div>
                                                <%
                                                } else {
                                                %>
                                                <div style="color: #388e3c; font-weight: bold; background-color: #c8e6c9;
                                                     padding: 0.2rem 5px; border-radius: 20px;
                                                     ">Parked</div>
                                                <%
                                                    }
                                                %>

                                            </td>
                                            <td style="text-align: center">                                             
                                                <% if (vehicle.getStatus() == 0) {
                                                %>
                                                <button type="button"  class="btn btn-danger" data-toggle="modal" data-target="#<%=vehicle.getVehicleName()%>">
                                                    Delete
                                                </button>
                                                <%
                                                    }
                                                %>
                                            </td>
                                        </tr>
                                        <!-- Modal -->
                                        <div class="modal fade" id="<%=vehicle.getVehicleName()%>" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-body">
                                                        <div style="font-size:25px; color:red; text-align: center; font-weight:bold">Are you sure deleting this vehicle from your vehicle list?</div>
                                                        <div style="text-align: center; font-size:18px;font-weight:bold"><%= vehicle.getVehicleName()%> || <%= vehicle.getPlateNumber()%> </div>                                                                                                                                        
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Return</button>
                                                        <form action="mainController" method="post">
                                                            <input type = "hidden" value = "<%=vehicle.getVehicleID()%>" name ="vid" >
                                                            <button type="submit" value="uDeleteVehicle" name="action" class="btn btn-outline-success">Confirm</button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>   
                                        <% }%>
                                        <tr>
                                            <td scope="col" style="text-align: center; color: rgb(123, 123, 123)">
                                            </td>
                                            <td scope="col" style="text-align: center; color: rgb(123, 123, 123)">
                                            </td>
                                            <td scope="col" style="text-align: center; color: rgb(123, 123, 123)">
                                            </td>
                                            <td scope="col" style="text-align: center; color: rgb(123, 123, 123)">
                                            </td>
                                            <td scope="col" style="text-align: center; color: rgb(123, 123, 123)">
                                            </td>
                                            <td scope="col" style="text-align: center; color: rgb(123, 123, 123)">
                                                <!-- Button trigger modal -->
                                                <a href="addVehicle.jsp" class="btn btn-success" >
                                                    + Add
                                                    </button>
                                            </td>
                                        </tr>
                                    </table>
                                    <div> 
                                        <b><font style='color:red; margin-left:470px; font-size:25px;'><%= (request.getAttribute("ADD_SUCCESS") == null) ? "" : (String) request.getAttribute("ADD_SUCCESS")%> </font></b>
                                    </div>
                                    <div> 
                                        <b><font style='color:red; margin-left:470px; font-size:25px;'><%= (request.getAttribute("DELETE_SUCCESS") == null) ? "" : (String) request.getAttribute("DELETE_SUCCESS")%> </font></b>
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
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
                integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
                integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
    </body>


</html>