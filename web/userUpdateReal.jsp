<%-- 
    Document   : userUpdate
    Created on : May 30, 2022, 10:51:33 AM
    Author     : KIM DUONG
--%>
<%@page import="pm.dto.UserA"%>
<%@page import="pm.dao.UserDAO"%>
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
        <style>
            .emp-profile{
                padding: 3%;
                margin-top: 3%;
                margin-bottom: 3%;
                border-radius: 0.5rem;
                background: #fff;
            }
            .profile-img{
                text-align: center;
            }
            .profile-img img{
                width: 70%;
                height: 100%;
            }
            .profile-img .file {
                position: relative;
                overflow: hidden;
                margin-top: -20%;
                width: 70%;
                border: none;
                border-radius: 0;
                font-size: 15px;
                background: #212529b8;
            }
            .profile-img .file input {
                position: absolute;
                opacity: 0;
                right: 0;
                top: 0;
            }
            .profile-head h5{
                color: #333;
            }
            .profile-head h6{
                color: #0062cc;
            }
            .profile-edit-btn{
                border: none;
                border-radius: 1.5rem;
                width: 70%;
                padding: 2%;
                font-weight: 600;
                color: #6c757d;
                cursor: pointer;
            }
            .proile-rating{
                font-size: 12px;
                color: #818182;
                margin-top: 5%;
            }
            .proile-rating span{
                color: #495057;
                font-size: 15px;
                font-weight: 600;
            }
            .profile-head .nav-tabs{
                margin-bottom:5%;
            }
            .profile-head .nav-tabs .nav-link{
                font-weight:600;
                border: none;
            }
            .profile-head .nav-tabs .nav-link.active{
                border: none;
                border-bottom:2px solid #0062cc;
            }
            .profile-work{
                padding: 14%;
                margin-top: -15%;
            }
            .profile-work p{
                font-size: 12px;
                color: #818182;
                font-weight: 600;
                margin-top: 10%;
            }
            .profile-work a{
                text-decoration: none;
                color: #495057;
                font-weight: 600;
                font-size: 14px;
            }
            .profile-work ul{
                list-style: none;
            }
            .profile-tab label{
                font-weight: 600;
            }
            .profile-tab p{
                font-weight: 600;
                color: #0062cc;
            }
        </style>
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
                                <%
                                    String username = (String) session.getAttribute("username");
                                    UserA us = UserDAO.getAccount(username);
                                %>
                                <div >
                                    <div class="row">                                       
                                        <form method="post">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="profile-img">
                                                        <img src="https://www.celeb.vn/wp-content/uploads/2021/12/daisy-la-gi-0.jpg " alt=""
                                                             style="width:140px; height:135px; border-radius:100px;margin-left:30px"/>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="profile-head" style="margin-left:100px; ">
                                                        <div style="font-size:30px; font-weight: bold">
                                                            <%= us.getFullname()%>
                                                        </div>                                                        
                                                        <p class="proile-rating"><span></span></p>
                                                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                                                            <li class="nav-item">
                                                                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">About</a>
                                                            </li>                                
                                                        </ul>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="row">
                                                <div class="col-md-5">
                                                </div>
                                                <div class="col-md-7">
                                                    <div class="tab-content profile-tab" id="myTabContent">
                                                        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <label>User Name</label>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <p><%= us.getUserName()%></p>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <label>Email</label>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <p><%= us.getEmail()%></p>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <label>Phone</label>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <p><%= us.getPhone()%></p>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <label>Address</label>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <p><%= us.getAddress()%></p>
                                                                </div>
                                                            </div>    
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <label>Gender</label>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <%
                                                                        if (us.getGender() == 0) {
                                                                    %>
                                                                    <div class="col-md-6">
                                                                        <p>Male</p>
                                                                    </div>
                                                                    <%
                                                                    } else {
                                                                    %>
                                                                    <div class="col-md-6">
                                                                        <p>Female</p>
                                                                    </div>
                                                                    <%
                                                                        }
                                                                    %>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>   

                                    </div>
                                    <div
                                        class="login_form_inner"
                                        style="margin-top: 30px"
                                        >
                                        <a href="userUpdate.jsp" style="margin-left:140px; "><button class="btn btn-primary" style="margin-bottom:30px">Click here to update your profile</button></a>
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

