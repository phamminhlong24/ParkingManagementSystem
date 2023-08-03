<!DOCTYPE html>
<html>

    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <title>Sign in</title>
        <meta charset="urf-8">
        <link rel="stylesheet" href="./style.css"/>
    </head>
    <body class="login" >
        <div >
            <div class="login-content">
                <div class="d-flex justify-content-end">
                    <div>
                        <p style="padding-top: 15px;color:black; font-weight: bold">Do not have account yet?</p>
                    </div>
                    <div>
                        <button  style="background-color: white; margin-left: 30px;height: 50px;border-radius: 30px; padding: 10px 20px 10px 20px; margin-top: 8px; color:black"><a href="signUp.jsp" style="text-decoration:  none;"><b>Sign up</b></a></button>
                    </div>
                </div>
                <div style="display: flex; ">
                    <!--<img src="./img/anh1.png" style="width:750px; height:500px">-->
                    <div>
                        <div style="padding-top: 70px; margin-right:5px">
                            <p style="font-size:40px; text-align: center">Welcome To Parking System</p>                       
                        </div>
                        <div> 
                            <b><font style='color:greenyellow; margin-left:26px; font-size:16px;'><%= (request.getAttribute("REGIS_SUCCESS") == null) ? "" : (String) request.getAttribute("REGIS_SUCCESS")%> </font></b>
                        </div>
                        <div> 
                            <b><font style='color:greenyellow; margin-left:26px; font-size:16px;'><%= (request.getAttribute("UPDATE_SUCCESS") == null) ? "" : (String) request.getAttribute("UPDATE_SUCCESS")%> </font></b>
                        </div>


                        <form class="login_form" action="mainController" method="post" id="contactForm" style="margin-left:25px;">
                            <div class=" container">
                                <div class="row">
                                    <div class="col-md-12" >
                                        <input type="text"  class="form-control" id="name" name="txtuser" placeholder="Username" required=""
                                               onfocus="this.placeholder = ''" onblur="this.placeholder = 'Username'" style="border-radius: 10px; margin-bottom: 40px; padding: 10px 250px 10px 10px; font-size: 20px;" >
                                    </div>
                                    <div class="col-md-12">                      
                                        <input type="password"  class="form-control" id="name" name="txtpassword" placeholder="Password" required=""
                                               onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'" style="border-radius: 10px; margin-bottom: 40px; padding: 10px 250px 10px 10px; font-size: 20px;"  >
                                    </div>

                                    <div class="col-md-12 form-group">
                                        <div class="create_account row">
                                            <div class="col-md-8"><input type="checkbox" value="savelogin" name="savelogin" id="f-option2">
                                                <label for="f-option2">Remember me</label></div>
                                        </div>
                                    </div>
                                    <div> 
                                        <b><font style='color:red; margin-left:26px; font-size:16px;'><%= (request.getAttribute("ERROR1") == null) ? "" : (String) request.getAttribute("ERROR1")%> </font></b>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <button class="glass-button" style="margin-left: 200px" type="submit" value="Login" name="action" class="btn btn-primary btn-lg">Log In</button>
                                    </div> 
                                </div>
                            </div>
                        </form>

                    </div>
                </div>
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

