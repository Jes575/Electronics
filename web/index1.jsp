<%-- 
    Document   : index1
    Created on : 21 Jul, 2015, 9:56:35 PM
    Author     : jeose_000
--%>
<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Electronics</title>
        <link rel="stylesheet" href="css/navi1.css" type="text/css"/>
        <!--link rel="stylesheet" href="css/slider.css" type="text/css" /-->
       
        <script type="text/javascript" src="slider/swfobject.js"></script>
        <script type="text/javascript">
        var flashvars = {};
        flashvars.cssSource = "slider/piecemaker.css";
        flashvars.xmlSource = "slider/piecemaker.xml";
        var params = {};
        params.play = "false";
        params.menu = "false";
        params.scale = "showall";
        params.wmode = "transparent";
        params.allowfullscreen = "true";
        params.allowscriptaccess = "sameDomain";
        params.allownetworking = "all";
        swfobject.embedSWF('slider/piecemaker.swf', 'piecemaker', '960', '430', '10', null, flashvars, params, null);
</script>
    </head>
    <body>
        <div class="col-12 outerborder">
            <div class="col-1 leftspace"></div>
            <div class="col-10 contentsborder">
                <div class="col-12 slider">
                    <div class="featured_slide">
                    <div id="piecemaker"><img src="images/demo/piecemaker/1.jpg" alt="" /></div>
                    </div>
                </div>
                <div class="col-12 modulesborder">
                    <%for(int i=0;i<6;i++){%>
                    <div class="col-4 module">
                        <div class="col-12 modulehead">Module1</div>
                        <div class="col-12 moduleimage">
                            <div class="slider">
                                <figure>
                                <img src="images/product/rdl_atmega_isp_1.jpg"/>
                                <img src="images/product/atmel6_1.jpg"/>
                                <img src="images/product/rdl_arduino_nano_2.jpg"/>
                                <img src="images/product/rdl_arm_breadboard2_1.jpg"/>
                                </figure>
                            </div>
                        </div>
                        <div class="col-12 modulelink">
                            <ul style="list-style:url(images/pointer.png)">
                                <li><a href="#"> Relay Interfacing Board</a></li>
                                <li><a href="#">  Stepper/ Servo/ Motor Driver</a></li>
                                <li><a href="#">  Audio / Telephone Interfacing Boards</a></li>
                                <li><a href="#"> Keypad / Joystick</a></li>
                                <li> <a href="#"> Display Interfacing Board</a></li>
                                <li> <a href="#"> More in Interfacing Board...</a></li>
                            </ul>
                        </div>
                    </div>
                    <%}%>  
                </div>
                <div class="col-12 newarrivalborder">
                    <div class="col-6 newarrival"></div>
                    <div class="col-6 comingsoon"></div>
                </div>
                
            </div>
        </div>
        <div class="col-12 footerborder">
         <%@include file="footer.jsp" %>
        </div>
    </body>
</html>
