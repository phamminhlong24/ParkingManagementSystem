<%-- 
    Document   : bookingStaff
    Created on : Jun 18, 2022, 9:06:34 PM
    Author     : tranh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Booking</title>
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
                            <div class="title-content">
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="title col-md-12">
                                            <p class="title-content">Booking</p>
                                            <p class="title-small">
                                                View real-time and occupied parking space
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--Content-->

                            <div class="booking-content">
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="booking-left col-md-9">
                                            <div class="car-detail">
                                                <div class="row">
                                                    <div class="car-detail-item-left col-md-10">
                                                        <div
                                                            class="d-flex justify-content-between pt-2 pl-3"
                                                            >
                                                            <div class="car-infor d-flex flex-row">
                                                                <img
                                                                    src="https://vcdn-vnexpress.vnecdn.net/2021/10/24/17372-GhibliHybrid-1031-163504-9453-2967-1635044998.jpg"
                                                                    class="car-img"
                                                                    alt="hinh anh"
                                                                    />
                                                                <div class="car-infor-detail">
                                                                    <p class="car-name p-0">${vehicleInfo.vehicleName}</p>
                                                                    <p class="car-id">${vehicleA}</p>
                                                                </div>
                                                            </div>
                                                            <div class="booking-date">
                                                                <!--<p class="time">May 16, 20:00</p>-->
                                                                <!--<p class="time"></p>-->
                                                                <input
                                                                    readonly
                                                                    id="name"
                                                                    name="dateTime"
                                                                    type="text" 
                                                                    style="border:none; background-color:#fff; width: 80%;
                                                                    font-weight: bold;font-size: 22px;text-align: center"
                                                                    value="${dateTime}"
                                                                    />
                                                                <p class="time-title" style="text-align: center">Booking Date</p>
                                                                <%
                                                                %>

                                                            </div>  
                                                        </div>
                                                    </div>
                                                    <div class="car-detail-item-right col-md-2 pt-2">

                                                        <c:if test="${hourModal != ''}">
                                                            <div
                                                                class="d-flex flex-column justify-content-center"
                                                                >
                                                                <p class="time text-center"></p>
                                                                <input
                                                                    readonly
                                                                    id="name"
                                                                    name="durationHour"
                                                                    type="text" 
                                                                    style="border:none; background-color:#fff; width: 80%;
                                                                    font-weight: bold;font-size: 22px;text-align: center"
                                                                    value="${hourModal}h"
                                                                    />
                                                                <p class="time-title text-center">Duration</p>
                                                            </div>
                                                        </c:if>
                                                        

                                                    </div>
                                                </div>
                                            </div>

                                            <div class="personal-detail">
                                                <div class="personal-detail-title pl-3 pt-2">
                                                    <i class="fa fa-user-circle"></i> Car & Personal
                                                    Information   
                                                </div>
                                                <div class="container-fluid mt-3">
                                                    <div class="row">
                                                        <div class="form-group col-md-6">
                                                            <label style="font-weight: bold">FULL NAME</label>
                                                            <input
                                                                type="text"
                                                                class="form-control"
                                                                id="fullName"
                                                                name="fullName"
                                                                placeholder="FULL NAME"
                                                                value="${userInfo.fullname}"
                                                                style="background-color:#fff"
                                                                readonly
                                                                />
                                                        </div>
                                                        <div class="form-group col-md-6">
                                                            <label style="font-weight: bold">ADDRESS</label>
                                                            <input
                                                                type="text"
                                                                class="form-control"
                                                                id="address"
                                                                name="address"
                                                                placeholder="ADDRESS"
                                                                style="background-color:#fff"
                                                                value="${userInfo.address}"
                                                                />
                                                        </div>
                                                        <div class="form-group col-md-6">
                                                            <label style="font-weight: bold">EMAIL</label>
                                                            <input
                                                                type="email"
                                                                class="form-control"
                                                                id="email"
                                                                name="email"
                                                                placeholder="EMAIL"
                                                                style="background-color:#fff"
                                                                value="${userInfo.email}"
                                                                />
                                                        </div>
                                                        <div class="form-group col-md-6">
                                                            <label style="font-weight: bold">GENDER</label>

                                                            

                                                            <c:if test="${userInfo.gender == 1}">
                                                                <input
                                                                    type="text"
                                                                    class="form-control"
                                                                    id="gender"
                                                                    name="gender"
                                                                    placeholder="GENDER"
                                                                    style="background-color:#fff"
                                                                    value="Male"
                                                                    />
                                                            </c:if>

                                                        </div>
                                                        <div class="form-group col-md-6">
                                                            <label style="font-weight: bold">PHONE</label>
                                                            <input
                                                                type="phone"
                                                                class="form-control"
                                                                id="phone"
                                                                name="phone"
                                                                placeholder="PHONE"
                                                                style="background-color:#fff"
                                                                value="${userInfo.phone}"
                                                                />
                                                        </div>


                                                        <div class="form-group col-md-6">
                                                            <label style="font-weight: bold">NUMBER PLATE</label>
                                                            <input
                                                                type="text"
                                                                class="form-control"
                                                                id="number-plate"
                                                                name="number-plate"
                                                                placeholder="NUMBER PLATE"
                                                                style="background-color:#fff"
                                                                value="${vehicleA}"
                                                                />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="booking-right col-md-3">
                                            <div class="detail-parking-lot">
                                                <i class="fa fa-parking mt-3 pl-3"></i> Parking Space
                                                <div class="lot-choose">
                                                    <p class="lot-infor">Parking slot number</p>
                                                    <p class="lot-infor-number">${parkingNameA}</p>
                                                </div>
                                            </div>
                                            <div class="payment">
                                                <i class="fa fa-wallet mt-3 pl-3"></i>
                                                <span class="pay-title">Payment Information</span>
                                                <div
                                                    class="d-flex justify-content-between payment-detail"
                                                    >
                                                    <p class="payment-detail-info">Slot number</p>
                                                    <input
                                                        readonly
                                                        id="name"
                                                        name="parkingNameA"
                                                        type="text" 
                                                        style="border:none; background-color:#fff; width: 20%;
                                                        font-weight: bold;font-size: 25px;text-align: center"
                                                        value="${parkingNameA}"
                                                        />

                                                </div>
                                                <div
                                                    class="d-flex justify-content-between payment-detail"
                                                    >
                                                    <p class="payment-detail-info">Payment Method</p>
                                                    <input
                                                        readonly
                                                        id="name"
                                                        name="paymentMethod"
                                                        type="text" 
                                                        style="border:none; background-color:#fff; width: 25%;
                                                        font-weight: bold;font-size: 22px;text-align: center"
                                                        value="${methodNameA}"
                                                        />
                                                </div>
                                                <div
                                                    class="d-flex justify-content-between payment-detail"
                                                    >
                                                    <p class="payment-detail-info">Booking fee</p>
                                                    <p class="payment-detail-value">80.000</p>
                                                </div>
                                                <div
                                                    class="d-flex justify-content-between payment-detail"
                                                    >
                                                    <p class="payment-detail-info">Total</p>
                                                    <p class="payment-detail-value">80.000</p>
                                                </div>
                                                <c:if test="${methodNameA == 'CASH'}">
                                                    <button class="button-pay" data-toggle="modal" data-target="#payment" >PAY</button>
                                                </c:if>
                                                <c:if test="${methodNameA == 'VN-PAY'}">
                                                    <button class="button-pay" data-toggle="modal" data-target="#payment" >PAY</button>
                                                </c:if>
                                                <!-- Modal cash -->
                                                <form action="mainController" method="post">
                                                    <div class="modal fade" id="payment" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog" role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5>Payment Processing</h5>
                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                        <span aria-hidden="true">&times;</span>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <h3 style="text-align: center">Please pay your booking by <span style="font-weight: bold">${methodNameA}</span></h3>
                                                                        
                                                                    <input
                                                                        readonly
                                                                        id="name"
                                                                        name="dateTime"
                                                                        type="text" 
                                                                        style="border:none; background-color:#fff; width: 80%;
                                                                        font-weight: bold;font-size: 22px;text-align: center;display: none"
                                                                        value="${dateTime1}"
                                                                        />


                                                                    <input
                                                                        readonly
                                                                        id="name"
                                                                        name="durationHour"
                                                                        type="text" 
                                                                        style="border:none; background-color:#fff; width: 80%;
                                                                        font-weight: bold;font-size: 22px;text-align: center;display: none"
                                                                        value="${hourModal}"
                                                                        />

                                                                    

                                                                    <input
                                                                        readonly
                                                                        type="text"
                                                                        class="form-control"
                                                                        id="number-plate"
                                                                        name="number-plate"
                                                                        placeholder="NUMBER PLATE"
                                                                        style="background-color:#fff;display: none"
                                                                        value="${vehicleA}"
                                                                        />
                                                                    <input
                                                                        readonly
                                                                        id="name"
                                                                        name="parkingNameA"
                                                                        type="text" 
                                                                        style="border:none; background-color:#fff; width: 20%;
                                                                        font-weight: bold;font-size: 25px;text-align: center;display: none"
                                                                        value="${parkingNameA}"
                                                                        />
                                                                    <input
                                                                        readonly
                                                                        id="name"
                                                                        name="paymentMethod"
                                                                        type="text" 
                                                                        style="border:none; background-color:#fff; width: 25%;
                                                                        font-weight: bold;font-size: 22px;text-align: center;display: none"
                                                                        value="${methodNameA}"
                                                                        />
                                                                    <h3>Pay and press the confirm button</h3>
                                                                    <button class="btn btn-success" type="submit" name="action" value="PayStaff">Confirm</button>
                                                                    <h5 style="text-align: center">And please wait a minute <span>...</span></h5>
                                                                </div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </form
                                                <!--End of modal cash-->

                                            </div>
                                        </div>
                                    </div> 



                                </div>
                            </div>



                            <!--End Body Content-->
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
                                        <a href="daisymarika81@gmail.com"
                                           >daisymarika81@gmail.com</a
                                        >
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
    </body>
</html>

