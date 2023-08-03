<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

    <head>
        <title>Sign up</title>
        <meta charset="urf-8">
        <link rel="stylesheet" href="./style.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>

    <body  class="login">
        <div class="signUp-content">
            <div class="d-flex justify-content-end">
                    <div>
                        <p style="padding-top: 15px;color:black; font-weight: bold">Do not have account yet?</p>
                    </div>
                    <div>
                        <button  style="background-color: white; margin-left: 30px;height: 50px;border-radius: 30px; padding: 10px 20px 10px 20px; margin-top: 8px; color:black"><a href="signIn.jsp" style="text-decoration:  none;"><b>Sign up</b></a></button>
                    </div>
                </div>
            <div style="display: flex; ">
                <!--<img src="./img/anh1.png">-->
                <div>
                    <div style="text-align: right; padding-top: 70px;">
                        <div>
                            <b style="font-size:40px; margin-right: 265px; text-align: center" >Register</b>
                        </div>
                    </div>
                    <form class="login_form" action="mainController" method="post" id="contactForm" style="margin-top: 30px">
                        <div class="container">
                            <div class="row">
                        <c:set var="errors" value = "${requestScope.REGIS_ERROR}"/>

                        <!--Username-->
                        <c:if test="${not empty errors.usernameLengthErr}">
                            <font style="color: red; margin-left: 26px">
                            ${errors.usernameLengthErr}
                            </font>
                        </c:if>
                        <c:if test="${not empty errors.usernameIsExisted}">
                            <font style="color: red; margin-left: 26px">
                            ${errors.usernameIsExisted}
                            </font>
                        </c:if>
                        <div class="col-md-6 form-group">

                            <input name="txtusername" required="" type="text" pattern = "^(\\w)+@(a-zA-Z]+([.](\\w+){1,2}"  class="form-control" id="name" placeholder="Username (6 - 30 characters)"
                                   onfocus="this.placeholder = ''" onblur="this.placeholder = 'Username (6 - 30 characters)'"
                                   value = "${param.txtusername == null ? "" : param.txtusername}" >
                        </div>
                        <!--End of UserName-->

                        <!--Fullname-->
                        <c:if test="${not empty errors.fullnameLengthErr}">
                            <font style="color: red; margin-left: 26px">
                            ${errors.fullnameLengthErr}
                            </font>
                        </c:if>
                        <div class="col-md-6 form-group">
                            <input name="txtfullname" required="" type="text" placeholder="Full Name (6 - 30 characters)" class="form-control" id="name"
                                   onfocus="this.placeholder = ''" onblur="this.placeholder = 'Full Name (6 - 30 characters)'"
                                   value = "${param.txtfullname}">

                        </div>

                        <!--PassWord-->
                        <c:if test="${not empty errors.passwordLengthErr}">
                            <font style="color: red; margin-left: 26px">
                            ${errors.passwordLengthErr}
                            </font>
                        </c:if>
                        <div class="col-md-6 form-group">
                            <input name="txtpassword" required="" type="password"  class="form-control" id="name"  placeholder="Password (6 - 30 characters)"
                                   onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password (6 - 30 characters)'">
                        </div>


                        <!--Email-->
                        <c:if test="${not empty errors.emailLengthErr}">
                            <font style="color: red; margin-left: 26px">
                            ${errors.emailLengthErr}
                            </font>
                        </c:if>
                        <div class="col-md-6 form-group">
                            <input name="txtemail" required="" type="text" placeholder="Email (6 - 30 characters)" class="form-control" id="name"
                                   onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email (6 - 30 characters)'"
                                   value = "${param.txtemail}" >

                        </div>


                        <!--Phone-->
                        <c:if test="${not empty errors.phoneLengthErr}">
                            <font style="color: red; margin-left: 26px">
                            ${errors.phoneLengthErr}
                            </font>
                        </c:if>
                        <c:if test="${not empty errors.phoneContainLetter}">
                            <font style="color: red; margin-left: 26px">
                            ${errors.phoneContainLetter}
                            </font>
                        </c:if>
                        <div class="col-md-6 form-group">
                            <input name="txtphone" type="text" placeholder="Phone (12 numbers)" class="form-control" id="name"
                                   onfocus="this.placeholder = ''" onblur="this.placeholder = 'Phone (12 characters)'"
                                   value = "${param.txtphone == null ? "" : param.txtphone}">
                            ${param.ERROR == null ? "" : param.ERROR}
                        </div>


                        <!--Address-->
                        <c:if test="${not empty errors.addressLengthErr}">
                            <font style="color: red; margin-left: 26px">
                            ${errors.addressLengthErr}
                            </font>
                        </c:if>
                        <div class="col-md-6 form-group">
                            <input name="txtaddress" type="text" placeholder="Address (6-50 characters)" class="form-control" id="name"
                                   onfocus="this.placeholder = ''" onblur="this.placeholder = 'Address (6-50 characters)'"
                                   value = "${param.txtaddress == null ? "" : param.txtaddress}">
                            ${param.ERROR == null ? "" : param.ERROR}
                        </div>


                        <div class="form-check"  style="margin-left:190px; margin-bottom: 14px">
                            <label class="form-check-label">
                                <input type="radio" class="form-check-input" name="txtgender" value="1" checked>Male
                            </label>
                            <label class="form-check-label" style="margin-left:30px">
                                <input type="radio" class="form-check-input" name="txtgender" value="0">Female
                            </label>
                        </div>

                        <div class="col-md-12 form-group" style="margin-left:200px">
                            <button class="glass-button" name="action" type="submit" value="Register" class="btn btn-primary btn-lg">Register</button>
                        </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="js/vendor/jquery-2.2.4.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
                integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
        crossorigin="anonymous"></script>
        <script src="js/vendor/bootstrap.min.js"></script>
        <script src="js/jquery.ajaxchimp.min.js"></script>
        <script src="js/jquery.nice-select.min.js"></script>
        <script src="js/jquery.sticky.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <!--gmaps Js-->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
        <script src="js/gmaps.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>