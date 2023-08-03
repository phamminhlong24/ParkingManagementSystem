<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                            <div class="title-content">
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="title col-md-12">
                                            <p class="title-content">Add New Vehicles</p>
                                            <p class="title-small">
                                                Add your new vehicles
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="bg-white" style="
                                 margin-right: 60px;
                                 margin-left: 47px;
                                 height: 62vh;
                                 position: relative;
                                 ">
                                <form action="mainController" method="post" id="addForm" style="margin-top: 30px; margin-left: 350px">
                                    <c:set var="errors" value = "${requestScope.ADD_ERROR}"/>                                    
                                    <div class="form-group col-md-12">
                                        <div style="color:white; padding-top:40px">a</div>
                                        <c:if test="${not empty errors.vehicleNameLengthErr}">
                                            <font style="color: red; margin-left: 17px; font-weight: bold">
                                            ${errors.vehicleNameLengthErr}
                                            </font>
                                        </c:if>  
                                        <div class="col-md-12 form-group" style="">
                                            <input name="txtVehicleName" required="" type="text" placeholder="Vehicle name(5 - 35 characters)" id="name"
                                                   onfocus="this.placeholder = ''" onblur="this.placeholder = 'Vehicle name(5 - 35 characters)'"
                                                   value = "${param.txtVehicleName}" style="width:400px; height:50px; border-radius: 12px; margin-bottom: 14px; font-size:15px">
                                        </div>
                                        <c:if test="${not empty errors.vehiclePlateIsExisted}">
                                            <font style="color: red; margin-left: 17px; font-weight: bold">
                                            ${errors.vehiclePlateIsExisted}
                                            </font>
                                        </c:if>
                                        <c:if test="${not empty errors.vehiclePlateLengthErr}">
                                            <font style="color: red; margin-left: 17px; font-weight: bold">
                                            ${errors.vehiclePlateLengthErr}
                                            </font>
                                        </c:if>  
                                        <div class="col-md-12 form-group">
                                            <input name="txtVehiclePlateNum" required="" type="text" placeholder="Vehicle Plate Number(10 characters) ex:29A-123.12" id="name"
                                                   onfocus="this.placeholder = ''" onblur="this.placeholder = 'Vehicle Plate Number(10 characters)'"
                                                   value = "${param.txtVehiclePlateNum}" style="width:400px; height:50px; border-radius: 12px; margin-bottom: 14px; font-size:15px">
                                        </div>
                                        <c:if test="${not empty errors.vehicleDesLengthErr}">
                                            <font style="color: red; margin-left: 17px; font-weight: bold">
                                            ${errors.vehicleDesLengthErr}
                                            </font>
                                        </c:if>
                                        <div class="col-md-12 form-group">
                                            <input name="txtVehicleDes" required="" type="" placeholder="Vehicle Description(0 - 100 characters)" id="name"
                                                   onfocus="this.placeholder = ''" onblur="this.placeholder = 'Vehicle Description(0 - 100 characters)'"
                                                   value = "${param.txtVehicleDes}" style="width:400px; height:50px; border-radius: 12px; margin-bottom: 14px; font-size:15px">
                                        </div> 
                                    </div>
                                    <div style="margin-left: 300px">
                                        <a  class="btn btn-secondary" href="userVehicleList.jsp">Return to list</a>
                                        <button type="submit" value="addVehicle" name="action" class="btn btn-success">
                                            + Add</button>
                                    </div>
                                </form>
                            </div>
                            <div class="footer mt-3">
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
                                        <a href="daisymarika81@gmail.com">daisymarika81@gmail.com</a>
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