<%-- 
    Document   : userUpdate
    Created on : May 30, 2022, 10:51:33 AM
    Author     : KIM DUONG
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Update Profile</title>
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
                            <div class="right_in">
                                <div class="title-content">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="title col-md-12">
                                                <p class="title-content">My Profile</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div 
                                    style="
                                    margin-right: 60px;
                                    margin-left: 47px;
                                    height: 65vh;
                                    position: relative;
                                    ">
                                    <a href="userUpdateReal.jsp"><button class="btn btn-outline-secondary"><- Return</button></a>
                                    <div class="row">
                                        <div class="col-md-4"></div>

                                        <div
                                            class="login_form_inner col-md-4"
                                            style="margin-top: 30px"
                                            >

                                            <form class="row login_form" action="mainController" method="post"> 
                                                <c:set var="errors" value = "${requestScope.PROFILE_ERROR}"/>
                                                <div style="font-size: 20px;margin-left: 24px;margin-bottom: 15px;margin-top: 15px;">
                                                    Your current full name: ${sessionScope.fullname}
                                                </div>
                                                <div class="col-md-12 form-group">
                                                    <input
                                                        name="txtfullnameupdate"
                                                        required=""
                                                        type="text"
                                                        class="form-control"
                                                        id="name"
                                                        placeholder="Enter New Full Name"
                                                        value=""
                                                        onfocus="this.placeholder = ''"
                                                        onblur="this.placeholder = 'Enter New Full Name'"
                                                        style="width: 300px"
                                                        />
                                                </div>
                                                <c:if test="${not empty errors.fullnameLengthErr}">
                                                    <font style="color: red; margin-left: 26px">
                                                    ${errors.fullnameLengthErr}
                                                    </font>
                                                </c:if>
                                                <div
                                                    style="
                                                    font-size: 20px;
                                                    margin-left: 24px;
                                                    margin-bottom: 15px;
                                                    margin-top: 15px;
                                                    "
                                                    >
                                                    Your current phone: ${sessionScope.phone}
                                                </div>

                                                <div class="col-md-12 form-group">
                                                    <input
                                                        class="form-control"
                                                        required=""
                                                        id="name"
                                                        name="txtphoneupdate"
                                                        type="text"
                                                        placeholder="Enter New Phone"
                                                        onfocus="this.placeholder = ''"
                                                        onblur="this.placeholder = 'Enter New Phone'"
                                                        style="width: 300px"
                                                        />
                                                </div>
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
                                                <div
                                                    style="
                                                    font-size: 20px;
                                                    margin-left: 24px;
                                                    margin-bottom: 15px;
                                                    margin-top: 15px;
                                                    "
                                                    >
                                                    Your current address: ${sessionScope.address}
                                                </div>

                                                <div class="col-md-12 form-group">
                                                    <input
                                                        class="form-control"
                                                        required=""
                                                        id="name"
                                                        name="txtaddressupdate"
                                                        type="text" 
                                                        placeholder="Enter New Address"
                                                        onfocus="this.placeholder = ''"
                                                        onblur="this.placeholder = 'Enter New Address'"
                                                        style="width: 300px"
                                                        />
                                                </div>
                                                <c:if test="${not empty errors.addressLengthErr}">
                                                    <font style="color: red; margin-left: 26px">
                                                    ${errors.addressLengthErr}
                                                    </font>
                                                </c:if>
                                                <div class="col-md-12 form-group"style="text-align: center; padding-right: 60px">
                                                    <button class="btn btn-outline-primary" name="action" type="submit" value="Update">
                                                        Update
                                                    </button>                                                                                                        
                                                </div>
                                            </form>

                                        </div>
                                        <div class="col-md-4"></div>
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

