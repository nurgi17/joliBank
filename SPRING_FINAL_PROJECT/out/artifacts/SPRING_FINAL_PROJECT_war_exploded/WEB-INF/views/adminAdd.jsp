<%@ page import="com.firstspring.classes.Users" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>View transactions</title>

    <!-- META SECTION -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- END META SECTION -->

    <!-- CSS INCLUDE -->
    <link rel="stylesheet" type="text/css" id="theme" href="resources/css/theme-default.css"/>
    <!-- EOF CSS INCLUDE -->

</head>
<body>

<!-- START PAGE CONTAINER -->
<div class="page-container">

    <!-- START PAGE SIDEBAR -->
    <div class="page-sidebar">
        <!-- START X-NAVIGATION -->
        <ul class="x-navigation">
            <li class="xn-logo">
                <%Users admin = (Users)session.getAttribute("admin");%>
                <%if(admin!=null){%>
                <a href="#"><%=admin.getLogin()%></a>
                <%}%>
                <a href="#" class="x-navigation-control"></a>
            </li>
            <div class="profile-image">
                <img src="resources/img/joliBankLogo.png" alt="John Doe" width="200px" height="100px"/>
            </div>

            <li class="xn-title">Navigation</li>
            <li>
                <a href="/profile"><span class="fa fa-user"></span> <span class="xn-text">Add new manager</span></a>
            </li>
            <li class="active">
                <a href="#"><span class="fa fa-tasks"></span> <span class="xn-text">View transactions</span></a>
            </li>
            <li>
                <a href="/adminChange"><span class="fa fa-edit"></span> <span class="xn-text">Change currency</span></a>
            </li>
            <li>
                <a href="/adminViewB"><span class="fa fa-money"></span> <span class="xn-text">View total balance</span></a>
            </li>
        </ul>
        <!-- END X-NAVIGATION -->
    </div>
    <!-- END PAGE SIDEBAR -->



    <!-- PAGE CONTENT -->
    <div class="page-content">

        <!-- START X-NAVIGATION VERTICAL -->
        <ul class="x-navigation x-navigation-horizontal x-navigation-panel">
            <!-- SEARCH -->
            <li class="xn-search">
                <form role="form">
                    <input type="text" name="search" placeholder="Search..."/>
                </form>
            </li>
            <!-- END SEARCH -->
            <!-- SIGN OUT -->
            <li class="xn-icon-button pull-right">
                <a href="#" class="mb-control" data-box="#mb-signout"><span class="fa fa-sign-out"></span></a>
            </li>
            <!-- END SIGN OUT -->
            <!-- MESSAGES -->
            <li class="xn-icon-button pull-right">
                <a href="#"><span class="fa fa-comments"></span></a>
            </li>
            <!-- END MESSAGES -->
            <!-- TASKS -->
            <li class="xn-icon-button pull-right">
                <a href="#"><span class="fa fa-tasks"></span></a>
            </li>
            <!-- END TASKS -->
        </ul>
        <!-- END X-NAVIGATION VERTICAL -->

        <!-- PAGE CONTENT WRAPPER -->
        <div class="page-content-wrap">

            <!-- START WIDGETS -->
            <div class="widget widget-info widget-padding-sm">
                <div class="widget-big-int plugin-clock">00:00</div>
                <div class="widget-subtitle plugin-date">Loading...</div>
                <div class="widget-controls">
                    <a href="#" class="widget-control-right" data-toggle="tooltip" data-placement="left"><span class="fa fa-times"></span></a>
                </div>
                <div class="widget-buttons widget-c3">
                    <div class="col">
                        <a href="#"><span class="fa fa-clock-o"></span></a>
                    </div>
                    <div class="col">
                        <a href="#"><span class="fa fa-bell"></span></a>
                    </div>
                    <div class="col">
                        <a href="#"><span class="fa fa-calendar"></span></a>
                    </div>
                </div>
            </div>
            <!-- END WIDGETS -->
        </div>

        <div class="page-content-wrap">
            <div class="row">
                <div class="col-md-12">

                    <!-- START DATATABLE EXPORT -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">All Transactions</h3>
                            <div class="btn-group pull-right">
                                <button class="btn btn-danger dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bars"></i> Export Transactions</button>
                                <ul class="dropdown-menu">
                                    <li><a href="#" onClick ="$('#customers2').tableExport({type:'json',escape:'false'});"><img src='resources/img/json.png' width="24"/> JSON</a></li>
                                    <li><a href="#" onClick ="$('#customers2').tableExport({type:'doc',escape:'false'});"><img src='resources/img/word.png' width="24"/> Word</a></li>
                                    <li><a href="#" onClick ="$('#customers2').tableExport({type:'pdf',escape:'false'});"><img src='resources/img/pdf.png' width="24"/> PDF</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="panel-body">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>AMOUNT</th>
                                    <th>CURRENCY_ID</th>
                                    <th>OPERATION_ID</th>
                                    <th>OPERATION_TIME</th>
                                    <th>RECEIVER_ACCOUNT_ID</th>
                                    <th>SENDER_ACCOUNT_ID</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:if test="${allTransactions!=null}">
                                    <c:forEach items="${allTransactions}" var="tran">
                                <tr>
                                    <td>${tran.id}</td>
                                    <td>${tran.amount}</td>
                                    <td>${tran.currency_id.short_name}</td>
                                    <td>${tran.operation_id.name}</td>
                                    <td>${tran.operation_time}</td>
                                    <td>${tran.receiver_account_id.first_name} - ${tran.receiver_account_id.last_name} - ${tran.receiver_account_id.name}</td>
                                    <td>${tran.sender_account_id.first_name} - ${tran.sender_account_id.last_name} - ${tran.sender_account_id.name}</td>
                                </tr>
                                    </c:forEach>
                                </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
            </div>
        </div>
</div>

<!-- MESSAGE BOX-->
<div class="message-box animated fadeIn" data-sound="alert" id="mb-signout">
    <div class="mb-container">
        <div class="mb-middle">
            <div class="mb-title"><span class="fa fa-sign-out"></span> Log <strong>Out</strong> ?</div>
            <div class="mb-content">
                <p>Are you sure you want to log out?</p>
                <p>Press No if youwant to continue work. Press Yes to logout current user.</p>
            </div>
            <div class="mb-footer">
                <div class="pull-right">
                    <form action="/logout" method="post">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <button type="submit" class="btn btn-success btn-lg">YES</button>
                    </form>
                    <button class="btn btn-default btn-lg mb-control-close">No</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- END MESSAGE BOX-->

<!-- START PRELOADS -->
<audio id="audio-alert" src="resources/audio/alert.mp3" preload="auto"></audio>
<audio id="audio-fail" src="resources/audio/fail.mp3" preload="auto"></audio>
<!-- END PRELOADS -->

<!-- START SCRIPTS -->
<!-- START PLUGINS -->
<script type="text/javascript" src="resources/js/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/plugins/jquery/jquery-ui.min.js"></script>
<script type="text/javascript" src="resources/js/plugins/bootstrap/bootstrap.min.js"></script>
<!-- END PLUGINS -->

<!-- START THIS PAGE PLUGINS-->
<script type='text/javascript' src='resources/js/plugins/icheck/icheck.min.js'></script>
<script type="text/javascript" src="resources/js/plugins/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>
<script type="text/javascript" src="resources/js/plugins/scrolltotop/scrolltopcontrol.js"></script>

<script type="text/javascript" src="resources/js/plugins/morris/raphael-min.js"></script>
<script type="text/javascript" src="resources/js/plugins/morris/morris.min.js"></script>
<script type="text/javascript" src="resources/js/plugins/rickshaw/d3.v3.js"></script>
<script type="text/javascript" src="resources/js/plugins/rickshaw/rickshaw.min.js"></script>
<script type='text/javascript' src='resources/js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js'></script>
<script type='text/javascript' src='resources/js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js'></script>
<script type='text/javascript' src='resources/js/plugins/bootstrap/bootstrap-datepicker.js'></script>
<script type="text/javascript" src="resources/js/plugins/owl/owl.carousel.min.js"></script>

<script type="text/javascript" src="resources/js/plugins/moment.min.js"></script>
<script type="text/javascript" src="resources/js/plugins/daterangepicker/daterangepicker.js"></script>
<!-- END THIS PAGE PLUGINS-->

<!-- START TEMPLATE -->

<script type="text/javascript" src="resources/js/plugins.js"></script>
<script type="text/javascript" src="resources/js/actions.js"></script>

<script type="text/javascript" src="resources/js/demo_dashboard.js"></script>
<!-- END TEMPLATE -->
<!-- END SCRIPTS -->
</body>
</html>






