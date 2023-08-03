<%-- 
    Document   : staffDashboard
    Created on : Jun 18, 2022, 8:41:56 PM
    Author     : tranh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        <style type="text/css">
            .result{
                display: none;
            }
        </style>

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
                        <jsp:include page="menuStaff.jsp"/>
                        <!--End of Menu-->
                        <div class="body-right col-md-10">
                            <div class="title-content">
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="title col-md-7">
                                            <p class="title-content">Parking Space Overview</p>
                                            <p class="title-small">
                                                View real-time and occupied parking space
                                            </p>
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
                                <div class="modal fade" id="modalBooking" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" style='max-width: 1000px; ' role="document">
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
                                                                    <div class="form-group col-md-6">
                                                                        <label class="form-check-label col-12 col-sm-12" style=" font-size:20px">Choose booking method</label>
                                                                        <div class="col-12 col-sm-12">
                                                                            <select name="methodNameA" class="custom-select">
                                                                                <option 
                                                                                    value="CASH"
                                                                                    >CASH</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <!--End of Payment Method-->

                                                                <!--Choose Payment Type-->

                                                                <div class="form-group col-md-12">
                                                                    <label class="form-check-label col-12 col-sm-12" style="font-size:20px">Choose payment type</label>
                                                                    <div class="col-12 col-sm-12">
                                                                        <select name="typeNameA" class="custom-select" id="paymentType"  onchange="showValue()">
                                                                            <option value="oneTime">One time</option>
                                                                        </select>
                                                                        <div class="hourBooking" style="display: block">
                                                                            <div class="input-group mb-3">
                                                                                <div class="input-group-prepend">
                                                                                    <span class="input-group-text" id="basic-addon1">Hour(1h-24h)</span>
                                                                                </div>
                                                                                <input
                                                                                    class="form-control"
                                                                                    id="name"
                                                                                    name="hourModal"
                                                                                    type="number" 
                                                                                    min="1"
                                                                                    max="24"
                                                                                    placeholder="Hour you are want to book"
                                                                                    style="width: 300px;"
                                                                                    value=""
                                                                                    />
                                                                            </div>
                                                                        </div>

                                                                    </div>
                                                                </div>

                                                                <!--End Of Payment Type-->

                                                                <!--Choose Your Vehicle-->
                                                                <div class="form-group col-md-12">
                                                                    <label class="form-check-label col-12 col-sm-12" style="font-size:22px">Choose your vehicle</label>
                                                                    <div class="col-12 col-sm-12">
                                                                        <input
                                                                            class="form-control"
                                                                            id="name"
                                                                            name="vehicleNameA"
                                                                            type="string" 
                                                                            placeholder="Enter customer's vehicle"
                                                                            style="width: 300px;"
                                                                            value=""
                                                                            />
                                                                    </div>
                                                                </div>
                                                                <div class="modal-footer d-flex justify-content-end">
                                                                    <div>
                                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                    </div>
                                                                    <div>

                                                                        <button
                                                                            class="btn buttonBooking"
                                                                            style="background-color: #e5dccb"
                                                                            type="submit"
                                                                            value="ModalStaff"
                                                                            name="action"
                                                                            >
                                                                            Booking
                                                                        </button>
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

<!--        <script language="javascript">

            function showValue() {

                var ele = document.querySelector("#paymentType").value;

                var div = document.querySelector(".hourBooking");

                if (ele == 2) {
                    div.style.display = "block";

                } else {
                    div.style.display = "none";
                }
            }



        </script>-->

    </body>
</html>
