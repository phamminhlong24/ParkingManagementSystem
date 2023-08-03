<%-- 
    Document   : header.jsp
    Created on : Jun 8, 2022, 1:41:56 PM
    Author     : tranh
--%>
<%@page import="pm.dto.Notify"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pm.dao.UserDAO"%>
<%@page import="pm.dao.NotiDAO"%>
<%@page import="pm.dao.ParkingSlotDAO"%>
<%@page import="pm.dao.VehicleDAO"%>
<%@page import="pm.dao.BookingDAO"%>
<%@page import="pm.dto.Booking"%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    BookingDAO dao = new BookingDAO();
    VehicleDAO daoV = new VehicleDAO();
    ParkingSlotDAO daoP = new ParkingSlotDAO();
    NotiDAO daoN = new NotiDAO();
    UserDAO daoU = new UserDAO();

    HttpSession session1 = request.getSession(true);
    String userName = (String) session1.getAttribute("username");
    int userId = daoU.getUserIdByUserName(userName);
    ArrayList<Notify> noti = daoN.getNotiInfoByUserid(userId);
    ArrayList<Notify> notiHour = daoN.getNotiInfoByHour(userId);
    ArrayList<Notify> notiMonth = daoN.getNotiInfoByMonth(userId);

    ArrayList<Booking> bk = dao.getBookingByUsername(userName);
    ArrayList<Booking> listMonth = new ArrayList();
    ArrayList<Booking> listHour = new ArrayList();
    for (Booking booking : bk) {
        if (booking.getDurationOfBooking() == 720) {
            listMonth.add(booking);
        } else if (booking.getDurationOfBooking() < 720) {
            listHour.add(booking);
        }
    }
    Timestamp timestamp = new Timestamp(new Date().getTime());

    long rsH = -1L;
    int flagH = 0;
    String plate = "";

    long currentTime = timestamp.getTime();
    SimpleDateFormat ft1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String currentDateTime = ft1.format(currentTime);

    long rsTimeH = 0;
    for (Booking booking : listHour) {
        long timeExp = timestamp.getTime() - booking.getBookDate().getTime();
        rsH = timeExp / (60 * 60 * 1000);// giờ
        rsTimeH = rsH - booking.getDurationOfBooking();//4-4 = 0
        if (rsTimeH >= 0) {
            dao.updateBookingStatusByPlate("4", booking.getVehiclePlateNumber());
            dao.updateTimeSlotHour(0, 0, booking.getTimeStart(), booking.getTimeEnd(), booking.getSlotNumber());
            daoV.updateVehicleStatus("0", booking.getVehiclePlateNumber());
            daoP.updateParkingStatus("0", booking.getSlotNumber());
            daoN.insertNotiByUserId(userId, "Your booking hour time is expire", booking.getSlotNumber(), "Hour");
            flagH = 1;
        }
    }

    int flagM = 0;
    long rsM = -1L;
    int rsTime = -1;

    for (Booking booking : listMonth) {

        long a = timestamp.getTime() - booking.getBookDate().getTime();
        rsM = a / (60 * 60 * 1000);
        rsTime = (int) rsM - booking.getDurationOfBooking();
        if (rsTime >= 0) { // == 720 hour
            Calendar c = Calendar.getInstance();
            c.setTime(timestamp);
            c.add(Calendar.DATE, 30);
            Date timestampFuture = c.getTime();
            SimpleDateFormat ft2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String dNow1 = ft2.format(timestampFuture);
            dao.updateBookingDateByPlate(dNow1, booking.getVehiclePlateNumber());
            daoN.insertNotiByUserId(userId, "Your booking time in month is expire", booking.getSlotNumber(), "Month");
            flagM = 1;//update xong
        }
    }


%>
<!DOCTYPE html>
<div class="content-header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-8 header-logo" 
                 style="font-size: 25px; padding:10px 0 0 10px">
                <div class="row">
                    <div class="col-md-4 d-flex flex-row mt-2 ">
                        <div class="mr-2" style="width: 15px; height: 15px; border-radius: 50%; background-color:green"></div>
                        <div class="mr-2" style="width: 15px; height: 15px; border-radius: 50%; background-color:yellow"></div>
                        <div class="mr-2" style="width: 15px; height: 15px; border-radius: 50%; background-color:red"></div>
                    </div>
                    <div class="col-md-8">
                        <div style="font-size: 25px; padding:10px 10px;font-weight: 500;margin-right: 10px">
                            Welcome ${sessionScope.name} !
                        </div>
                    </div>
                </div>
            </div>


            <div class="col-md-4  ">
                <!--                                <div>
                                                    <p style="cursor: pointer;
                                                       padding:15px 0 0 10px;margin-right: 20px;font-size: 20px
                                                       " data-toggle="modal" 
                                                       data-target="#booking">
                                                        <i class="fa fa-question-circle"></i> 
                                                    </p>
                <%--<jsp:include page="tutorial.jsp"></jsp:include>--%>
                </div>-->



                <div class="d-flex flex-row justify-content-end">
                    <div style="position: relative; margin-right: 50px">
                        <a class="btn-group" type="button" id="dropdownMenuButtonNoti" data-toggle="dropdown" 
                           style="margin-top: 20px;">
                            <%                            if (notiHour.size() != 0 && notiMonth.size() != 0) {
                            %>
                            <i class="fa fa-bell"  style="font-size: 25px"></i> 
                            <div style="position: absolute; right:-10px; top: -5px;
                                 background-color: white;width: 20px; height: 20px;border-radius: 50%;
                                 text-align: center;color:red;font-weight: 700"><%= noti.size()%></div>
                            <%
                            } else if (notiMonth.size() != 0) {
                            %>
                            <i class="fa fa-bell"  style="font-size: 25px"></i>
                            <div style="position: absolute; right:-10px; top: -5px;
                                 background-color: white;width: 20px; height: 20px;border-radius: 50%;
                                 text-align: center;color:red;font-weight: 700"><%= notiMonth.size()%> </div>
                            <%
                            } else if (notiHour.size() != 0) {
                            %>
                            <i class="fa fa-bell"  style="font-size: 25px"></i> 
                            <div style="position: absolute; right:-10px; top: -5px;
                                 background-color: white;width: 20px; height: 20px;border-radius: 50%;
                                 text-align: center;color:red;font-weight: 700"><%= notiHour.size()%></div>
                            <%
                                }
                            %>

                        </a>
                        <% if (notiMonth.size() != 0 || notiHour.size() != 0) {
                        %>
                        <div class="dropdown-menu" style="z-index: 50"  aria-labelledby="dropdownMenuButtonNOti">
                            <a class="dropdown-item login-btn-drop" href="notify.jsp">Click here to view your notifications</a>            
                        </div>
                        <%
                            }%>

                    </div>
                    <div class=" ml-2 btn-group dropleft" >
                        <button class=" dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                                style="margin-top: 15px; border-radius: 30px; border:none">
                            <img src="./img/avatar.png" alt="avatar" style="height: 50px;height: 50px"/>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="z-index: 50">        
                            <a class="dropdown-item login-btn-drop" href="mainController?action=logout">Log Out</a>
                        </div>
                    </div>
                </div>



            </div>
        </div>
    </div>
</div>
