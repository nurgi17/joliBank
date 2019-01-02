<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Add new manager</title>

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
                <a href="#">${admin.login}</a>
                <a href="#" class="x-navigation-control"></a>
            </li>
            <div class="profile-image">
                <img src="resources/img/joliBankLogo.png" alt="John Doe" width="200px" height="100px"/>
            </div>

            <li class="xn-title">Navigation</li>
            <li class="active">
                <a href="#"><span class="fa fa-user"></span> <span class="xn-text">Add new manager</span></a>
            </li>
            <li>
                <a href="/adminViewT"><span class="fa fa-tasks"></span> <span class="xn-text">View transactions</span></a>
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

                    <form class="form-horizontal" action="/adminAddNewManager" method="post">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><strong>Add new manager</strong></h3>
                            </div>

                            <div class="panel-body">

                                <div class="form-group">
                                    <label class="col-md-3 col-xs-12 control-label">Full name</label>
                                    <div class="col-md-6 col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon"><span class="fa fa-pencil" style="margin-bottom: 7px;"></span></span>
                                            <input type="text" class="form-control" name="full_name" required/>
                                        </div>
                                        <span class="help-block">Please enter full name of new manager</span>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 col-xs-12 control-label">Login</label>
                                    <div class="col-md-6 col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon"><span class="fa fa-user" style="margin-bottom: 7px;"></span></span>
                                            <input type="text" class="form-control" name="login" required/>
                                        </div>
                                        <span class="help-block">Create new username</span>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 col-xs-12 control-label">Password</label>
                                    <div class="col-md-6 col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon"><span class="fa fa-unlock-alt" style="margin-bottom: 7px;"></span></span>
                                            <input type="password" class="form-control" name="password" required/>
                                        </div>
                                        <span class="help-block">Create new password</span>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <button type="submit" class="btn btn-primary pull-right">ADD</button>
                                <button type="reset" class="btn btn-default" onClick="noty({text: 'Everything is clear!', layout: 'topRight', type: 'success'});">CLEAR</button>
                            </div>
                        </div>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    </form>

                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">All Managers</h3>
                        </div>
                        <div class="panel-body">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>FULL NAME</th>
                                    <th>LOGIN</th>
                                    <th>PASSWORD</th>
                                    <th>ROLE</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:if test="${allManagers!=null}">
                                <c:forEach items="${allManagers}" var="m">
                                    <tr>
                                        <td>${m.id}</td>
                                        <td>${m.full_name}</td>
                                        <td>${m.login}</td>
                                        <td>${m.password}</td>
                                        <c:forEach items="${m.roles}" var="rol">
                                            <td>${rol.name}</td>
                                        </c:forEach>
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
        <!-- END PAGE CONTENT WRAPPER -->
    </div>
    <!-- END PAGE CONTENT -->
</div>
        </div>

            <!-- START DASHBOARD CHART -->
            <div class="chart-holder" id="dashboard-area-1" style="height: 200px;"></div>
            <div class="block-full-width">

            </div>
            <!-- END DASHBOARD CHART -->

        </div>
        <!-- END PAGE CONTENT WRAPPER -->
    </div>
    <!-- END PAGE CONTENT -->
</div>
<!-- END PAGE CONTAINER -->

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

<script type='text/javascript' src='resources/js/plugins/noty/jquery.noty.js'></script>
<script type='text/javascript' src='resources/js/plugins/noty/layouts/topCenter.js'></script>
<script type='text/javascript' src='resources/js/plugins/noty/layouts/topLeft.js'></script>
<script type='text/javascript' src='resources/js/plugins/noty/layouts/topRight.js'></script>

<script type='text/javascript' src='resources/js/plugins/noty/themes/default.js'></script>

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






