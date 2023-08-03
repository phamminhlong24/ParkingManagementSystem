<%-- 
    Document   : tutorial
    Created on : Jun 9, 2022, 8:38:55 PM
    Author     : tranh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Modal booking  -->
<div class="modal fade" id="booking" tabindex="-1" role="dialog" 
     aria-labelledby="exampleModalLongTitle" aria-hidden="true"

     >
    <div class="modal-dialog" role="document"
         style='max-width: 1100px; max-height: 700px'
         >
        <div class="modal-content container-fluid" style='font-size: 20px'>
            <div class='row'>
                <div class='col-8'>
                    <img src='./booking.png' alt='booking' 
                         style='width: 100%; height: 500px'>
                </div>
                <div class='col-4 ' style='height: 50%; margin:auto 0'>
                    <div class='tittle'>
                        <h3 style='font-weight: bold'>Parking Space-Tutorial</h3>
                    </div>
                    <div class='tutorial-content '>
                        <p style=''>This is a dash board showed all parking slots in
                            Luas-Parking System. <br/>To choose your slot you can be click
                            in lot which has 
                            <span style='color: #E5E5E5; font-weight: bold '>GRAY</span> background. 
                            The <span style='color:#1E8AF9; font-weight: bold'>BLUE</span> one
                            is in used by other customer.
                        </p>
                        <div class='status'>
                            <div class='d-flex flex-row align-items-center'>
                                <div style='background-color: #E5E5E5;width: 32px;height: 17px'></div> 
                                <span class='text-success'> : Available</span>
                            </div>
                            <div class='d-flex flex-row align-items-center'>
                                <div style='background-color: #1E8AF9;width: 32px;height: 17px'></div> 
                                <span class='text-danger'> : Unavailable</span>
                            </div>
                        </div>

                    </div>
                    <div class='d-flex justify-content-end align-items-end'>
                        <button type="button" class='btn mb-5' 
                                data-dismiss="modal"
                                data-toggle="modal" 
                                data-target="#paymentWhenClick"
                                style='background-color: #DDEDFD'
                                >
                            Next <i class="fa fa-angle-right"></i>
                        </button>
                    </div>
                </div>
            </div>

        </div>

    </div>
</div>
<!--End of modal Booking-->



<!-- Modal pay when click -->
<div class="modal fade" id="paymentWhenClick" tabindex="-1" role="dialog" 
     aria-labelledby="exampleModalLongTitle" aria-hidden="true"

     >
    <div class="modal-dialog" role="document"
         style='max-width: 1100px; max-height: 700px'
         >
        <div class="modal-content container-fluid" style='font-size: 20px'>
            <div class='row'>
                <div class='col-7'>
                    <img src='./booking-detail.png' alt='booking' 
                         style='width: 100%; height: 500px'>
                </div>
                <div class='col-5 mt-5' style='height: 50%; margin:auto 0'>
                    <div class='tittle'>
                        <h3 style='font-weight: bold'>Lot's detail & Booking-Tutorial</h3>
                    </div>
                    <div class='tutorial-content '>
                        <p style=''>This is a pop up showed the detail of lot which you choose.
                            <br/>
                            In here you can choose the:
                            <br/>
                            <span style='margin-left: 10px; font-weight: bold'>.Payment Method</span>
                            <br/>
                            <span style='margin-left: 10px; font-weight: bold'>.Payment Type</span>
                            <br/>
                            <span style='margin-left: 20px; '> * Monthly</span> 
                            <span>: if you choose Monthly, you will pay and park at this lot in 
                                <span style='font-weight: bold'>30 days.</span>
                            </span>
                            <br/>
                            <span style='margin-left: 20px;'> * Hour</span> 
                            <span>: if you choose Hour, you will pay and park at this lot in 
                                <span style='font-weight: bold'>your's booking-hour.</span>
                            </span>
                            <br/>
                            <span style='margin-left: 10px; font-weight: bold'>.Your vehicle</span>
                            <span>: you can choose your vehicle <span style='font-weight: bold'>BUT</span> 
                                if all of your vehicle are parked here.
                                You <span style='font-weight: bold'>CAN NOT</span> choose vehicle.

                            </span>
                            <br/>


                        </p>
                        <p>
                            Click Booking for going to Payment Information.
                        </p>

                    </div>
                    <div class='d-flex justify-content-end align-items-end'>

                    </div>

                    <div class='d-flex justify-content-between'>
                        <div class='d-flex justify-content-end align-items-start'>
                            <button type="button" class='btn  mb-5' 
                                    data-dismiss="modal"
                                    data-toggle="modal" 
                                    style='background-color: #DDEDFD'
                                    data-target="#booking"
                                    >
                                <i class="fa fa-angle-left"></i> Back 
                            </button>
                        </div>
                        <div class='d-flex justify-content-end align-items-end'>
                            <button type="button" class='btn mb-5' 
                                    data-dismiss="modal"
                                    data-toggle="modal" 
                                    data-target="#paymentInfo"
                                    style='background-color: #DDEDFD'
                                    >
                                Next <i class="fa fa-angle-right"></i>
                            </button>
                        </div>

                    </div>
                </div>
            </div>

        </div>

    </div>
</div>
<!--End of modal payment when click-->


<!-- Modal payment-info -->
<div class="modal fade" id="paymentInfo" tabindex="-1" role="dialog" 
     aria-labelledby="exampleModalLongTitle" aria-hidden="true"

     >
    <div class="modal-dialog" role="document"
         style='max-width: 1100px; max-height: 700px'
         >
        <div class="modal-content container-fluid" style='font-size: 20px'>
            <div class='row'>
                <div class='col-8'>
                    <img src='./payment-info.png' alt='booking' 
                         style='width: 100%; height: 500px'>
                </div>
                <div class='col-4 ' style='height: 50%; margin:auto 0'>
                    <div class='tittle'>
                        <h3 style='font-weight: bold'>Payment Information<br/>-Tutorial</h3>
                    </div>
                    <div class='tutorial-content '>
                        <p> In this page you will see all the information which you choose in 
                            <span style='font-weight: bold'>Dash Board</span> page.</p>
                        <p>When you click <span style='font-weight: bold'>Pay</span>  
                            you will see your request in 
                            <span style='font-weight: bold'>My Booking History</span> page.</p>

                    </div>

                    <div class='d-flex justify-content-between'>
                        <div class='d-flex justify-content-end align-items-start'>
                            <button type="button" class='btn  mb-5' 
                                    data-dismiss="modal"
                                    data-toggle="modal" 
                                    style='background-color: #DDEDFD'
                                    data-target="#paymentWhenClick"
                                    >
                                <i class="fa fa-angle-left"></i> Back 
                            </button>
                        </div>
                        <div class='d-flex justify-content-end align-items-end'>
                            <button type="button" class='btn mb-5' 
                                    data-dismiss="modal"
                                    data-toggle="modal" 
                                    data-target="#updateProfile"
                                    style='background-color: #DDEDFD'
                                    >
                                Next <i class="fa fa-angle-right"></i>
                            </button>
                        </div>

                    </div>
                </div>
            </div>

        </div>

    </div>
</div>
<!--End of modal payment-info-->

<!-- Modal update Profile -->
<div class="modal fade" id="updateProfile" tabindex="-1" role="dialog" 
     aria-labelledby="exampleModalLongTitle" aria-hidden="true"

     >
    <div class="modal-dialog" role="document"
         style='max-width: 1100px; max-height: 700px'
         >
        <div class="modal-content container-fluid" style='font-size: 20px'>
            <div class='row'>
                <div class='col-8'>
                    <img src='./updateProfile.png' alt='booking' 
                         style='width: 100%; height: 500px'>
                </div>
                <div class='col-4 ' style='height: 50%; margin:auto 0'>
                    <div class='tittle'>
                        <h3 style='font-weight: bold'>Update Profile-Tutorial</h3>
                    </div>
                    <div class='tutorial-content '>
                        <p> In this page you will see your old information and you can update your profile.</p>
                    </div>


                    <div class='d-flex justify-content-between'>
                        <div class='d-flex justify-content-end align-items-start'>
                            <button type="button" class='btn  mb-5' 
                                    data-dismiss="modal"
                                    data-toggle="modal" 
                                    style='background-color: #DDEDFD'
                                    data-target="#paymentInfo"
                                    >
                                <i class="fa fa-angle-left"></i> Back 
                            </button>
                        </div>
                        <div class='d-flex justify-content-end align-items-end'>
                            <button type="button" class='btn mb-5' 
                                    data-dismiss="modal"
                                    data-toggle="modal" 
                                    data-target="#vehicleList"
                                    style='background-color: #DDEDFD'
                                    >
                                Next <i class="fa fa-angle-right"></i>
                            </button>
                        </div>

                    </div>
                </div>
            </div>

        </div>

    </div>
</div>
<!--End of modal Update Profile-->

<!-- Modal vehicle list -->
<div class="modal fade" id="vehicleList" tabindex="-1" role="dialog" 
     aria-labelledby="exampleModalLongTitle" aria-hidden="true"

     >
    <div class="modal-dialog" role="document"
         style='max-width: 1100px; max-height: 700px'
         >
        <div class="modal-content container-fluid" style='font-size: 20px'>
            <div class='row'>
                <div class='col-8'>
                    <img src='./vehicle-list.png' alt='booking' 
                         style='width: 100%; height: 500px'>
                </div>
                <div class='col-4 ' style='height: 50%; margin:auto 0'>
                    <div class='tittle'>
                        <h3 style='font-weight: bold'>Vehicle List-Tutorial</h3>
                    </div>
                    <div class='tutorial-content '>
                        <p> In this page you will see all your vehicle and it'status.</p>
                    </div>


                    <div class='d-flex justify-content-between'>
                        <div class='d-flex justify-content-end align-items-start'>
                            <button type="button" class='btn  mb-5' 
                                    data-dismiss="modal"
                                    data-toggle="modal" 
                                    style='background-color: #DDEDFD'
                                    data-target="#updateProfile"
                                    >
                                <i class="fa fa-angle-left"></i> Back 
                            </button>
                        </div>
                        <div class='d-flex justify-content-end align-items-end'>
                            <button type="button" class='btn mb-5' 
                                    data-dismiss="modal"
                                    data-toggle="modal" 
                                    data-target="#myRequest"
                                    style='background-color: #DDEDFD'
                                    >
                                Next <i class="fa fa-angle-right"></i>
                            </button>
                        </div>

                    </div>
                </div>
            </div>

        </div>

    </div>
</div>
<!--End of modal vehicle list-->

<!-- Modal Request -->
<div class="modal fade" id="myRequest" tabindex="-1" role="dialog" 
     aria-labelledby="exampleModalLongTitle" aria-hidden="true"

     >
    <div class="modal-dialog" role="document"
         style='max-width: 1100px; max-height: 700px'
         >
        <div class="modal-content container-fluid" style='font-size: 20px'>
            <div class='row'>
                <div class='col-8'>
                    <img src='./my-request.png' alt='booking' 
                         style='width: 100%; height: 500px'>
                </div>
                <div class='col-4 ' style='height: 50%; margin:auto 0'>
                    <div class='tittle'>
                        <h3 style='font-weight: bold'>My Request-Tutorial</h3>
                    </div>
                    <div class='tutorial-content '>
                        <p> In this page you will see all your request and it'status.</p>
                        <p>
                            <span> <span class='text-info'>Processing</span>: Your request is in processing</span>
                            <br/>
                            <span> <span class='text-danger'>Rejected</span>: Your request is rejected</span>
                            <br/>
                            <span> <span class='text-success'>Accepted</span>: Your request is accepted</span>
                        </p>
                    </div>
                    <div class='d-flex justify-content-between'>
                        <div class='d-flex justify-content-end align-items-start'>
                            <button type="button" class='btn  mb-5' 
                                    data-dismiss="modal"
                                    data-toggle="modal" 
                                    style='background-color: #DDEDFD'
                                    data-target="#vehicleList"
                                    >
                                <i class="fa fa-angle-left"></i> Back 
                            </button>
                        </div>
                        <div class='d-flex justify-content-end align-items-end'>
                            <button type="button" class='btn mb-5' 
                                    data-dismiss="modal"
                                    data-toggle="modal" 
                                    data-target="#bookingHistory"
                                    style='background-color: #DDEDFD'
                                    >
                                Next <i class="fa fa-angle-right"></i>
                            </button>
                        </div>

                    </div>
                </div>
            </div>

        </div>

    </div>
</div>
<!--End of modal Request-->

<!-- Modal booking history -->
<div class="modal fade" id="bookingHistory" tabindex="-1" role="dialog" 
     aria-labelledby="exampleModalLongTitle" aria-hidden="true"

     >
    <div class="modal-dialog" role="document"
         style='max-width: 1100px; max-height: 700px'
         >
        <div class="modal-content container-fluid" style='font-size: 20px'>
            <div class='row'>
                <div class='col-8'>
                    <img src='./booking-history.png' alt='booking' 
                         style='width: 100%; height: 500px'>
                </div>
                <div class='col-4 ' style='height: 50%; margin:auto 0'>
                    <div class='tittle'>
                        <h3 style='font-weight: bold'>My Booking History-Tutorial</h3>
                    </div>
                    <div class='tutorial-content '>
                        <p> In this page you will see all your request and it'status and <span class='text-danger'>Cancel</span> button</p>
                        <p>
                            When you click <span class='text-danger'>Cancel</span> button you will cancel your booking slot.
                        </p>
                    </div>
                    <div class='d-flex justify-content-between'>
                        <div class='d-flex justify-content-end align-items-start'>
                            <button type="button" class='btn  mb-5' 
                                    data-dismiss="modal"
                                    data-toggle="modal" 
                                    style='background-color: #DDEDFD'
                                    data-target="#myRequest"
                                    >
                                <i class="fa fa-angle-left"></i> Back 
                            </button>
                        </div>
                        <div class='d-flex justify-content-end align-items-end'>
                            <button type="button" class='btn btn-success mb-5' 
                                    data-dismiss="modal"
                                    data-toggle="modal" 
                                    style='color: #000'
                                    >
                                Finish 
                            </button>
                        </div>

                    </div>
                </div>
            </div>

        </div>

    </div>
</div>
<!--End of modal Request-->