<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <!-- META SECTION -->
    <title>Add new account page</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link rel="icon" href="favicon.ico" type="image/x-icon" />
    <!-- END META SECTION -->

    <!-- CSS INCLUDE -->
    <link rel="stylesheet" type="text/css" id="theme" href="resources/css/theme-default.css"/>
    <!-- EOF CSS INCLUDE -->
</head>
<body>
<!-- START PAGE CONTAINER -->
<div class="page-container page-navigation-top">
    <!-- PAGE CONTENT -->
    <div class="page-content">

        <!-- START X-NAVIGATION VERTICAL -->
        <ul class="x-navigation x-navigation-horizontal">
            <li class="xn-logo">
                <img src="resources/img/joliBankLogo.png" alt="John Doe" width="150px" height="54px"/>
                <a href="#" class="x-navigation-control"></a>
            </li>
            <li><a href="/profile"><span class="fa fa-user"></span> Profile</a></li>
            <li><a href="/managerAdd"><span class="fa fa-pencil"></span>Add Account</a></li>
            <li><a href="/managerTEPT"><span class="fa fa-asterisk"></span>New Transaction</a></li>
            <li><a href="/managerView"><span class="fa fa-tasks"></span>View Transactions</a></li>

            <!-- SIGN OUT -->
            <li class="xn-icon-button pull-right">
                <a href="#" class="mb-control" data-box="#mb-signout"><span class="fa fa-sign-out"></span></a>
            </li>
            <!-- END SIGN OUT -->
        </ul>
        <!-- PAGE CONTENT WRAPPER -->
        <div class="page-content-wrap">

            <div class="row">
                <div class="col-md-12">

                    <form class="form-horizontal" action="/addNewAcc" method="post">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><strong>Add new account</strong></h3>
                            </div>
                            <div class="panel-body">

                                <div class="form-group">
                                    <label class="col-md-3 col-xs-12 control-label">Amount</label>
                                    <div class="col-md-6 col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon"><span class="fa fa-money" style="margin-bottom: 7px;"></span></span>
                                            <input type="text" class="form-control" name="amount"/>
                                        </div>
                                        <span class="help-block">Input some amount of money</span>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 col-xs-12 control-label">Birth date</label>
                                    <div class="col-md-6 col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon"><span class="fa fa-calendar" style="margin-bottom: 7px;"></span></span>
                                            <input type="text" class="form-control datepicker" value="1998-10-13" name="birth_date">
                                        </div>
                                        <span class="help-block">Click on input field to get data</span>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="col-md-3 col-xs-12 control-label">Select currency</label>
                                    <div class="col-md-6 col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon"><span class="fa fa-btc" style="margin-bottom: 7px;"></span></span>

                                            <select class="form-control" name="currency">
                                            <option value="1">RUB</option>
                                            <option value="2">EUR</option>
                                            <option value="3">GBP</option>
                                            <option value="4">USD</option>
                                            <option value="5">KZT</option>
                                            <option value="6">KGS</option>
                                            <option value="7">CNY</option>
                                        </select>
                                        </div>
                                        <span class="help-block">Select box example</span>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="col-md-3 col-xs-12 control-label">First name</label>
                                    <div class="col-md-6 col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon"><span class="fa fa-font" style="margin-bottom: 7px;"></span></span>
                                            <input type="text" class="form-control" name="first_name"/>
                                        </div>
                                        <span class="help-block">Input first name</span>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="col-md-3 col-xs-12 control-label">Last name</label>
                                    <div class="col-md-6 col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon"><span class="fa fa-text-height" style="margin-bottom: 7px;"></span></span>
                                            <input type="text" class="form-control" name="last_name"/>
                                        </div>
                                        <span class="help-block">Input last name</span>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-3 col-xs-12 control-label">IIN number</label>
                                    <div class="col-md-6 col-xs-12">
                                        <div class="input-group">
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-align-justify" style="margin-bottom: 7px;"></span></span>
                                            <input type="text" class="form-control" name="iin_number"/>
                                        </div>
                                        <span class="help-block">Input iin number</span>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <button class="btn btn-default" type="reset">CLEAR</button>
                                <button class="btn btn-primary pull-right" type="submit">ADD</button>
                            </div>
                        </div>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    </form>

                </div>
            </div>

        </div>
        <!-- END PAGE CONTENT WRAPPER -->

        <div class="page-content-wrap">
            <div class="row">
                <div class="col-md-12">

                    <!-- START DATATABLE EXPORT -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">All accounts</h3>
                        </div>
                        <div class="panel-body">
                            <table class="table dataTable">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>AMOUNT</th>
                                    <th>CURRENCY_ID</th>
                                    <th>BIRTH_DATE</th>
                                    <th>CREATED_DATE</th>
                                    <th>FIRST_NAME</th>
                                    <th>LAST_NAME</th>
                                    <th>IIN_NUMBER</th>
                                    <th>IBAN_NUMBER</th>
                                    <th>IS_BLOCKED</th>
                                    <th>CHANGE</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:if test="${allAccounts!=null}">
                                    <c:forEach items="${allAccounts}" var="acc">
                                        <tr>
                                            <td>${acc.id}</td>
                                            <td>${acc.amount}</td>
                                            <td>${acc.currency_id.short_name}</td>
                                            <td>${acc.birth_date}</td>
                                            <td>${acc.created_date}</td>
                                            <td>${acc.first_name}</td>
                                            <td>${acc.last_name}</td>
                                            <td>${acc.iin_number}</td>
                                            <td>${acc.name}</td>
                                            <c:if test="${acc.is_blocked==true}">
                                            <td>BLOCKED</td>
                                            </c:if>
                                            <c:if test="${acc.is_blocked==false}">
                                                <td>NOT BLOCKED</td>
                                            </c:if>
                                            <td>
                                                <form action="/mEdit" method="post">
                                                    <input type="hidden" value="${acc.id}" name="id">
                                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                    <button class="btn btn-success" type="submit">EDIT</button>
                                                </form>
                                            </td>
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
    <!-- END PAGE CONTENT -->
</div>
<!-- END PAGE CONTAINER -->

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

<script type="text/javascript" src="resources/js/plugins/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="resources/js/plugins/tableexport/tableExport.js"></script>
<script type="text/javascript" src="resources/js/plugins/tableexport/jquery.base64.js"></script>
<script type="text/javascript" src="resources/js/plugins/tableexport/html2canvas.js"></script>
<script type="text/javascript" src="resources/js/plugins/tableexport/jspdf/libs/sprintf.js"></script>
<script type="text/javascript" src="resources/js/plugins/tableexport/jspdf/jspdf.js"></script>
<script type="text/javascript" src="resources/js/plugins/tableexport/jspdf/libs/base64.js"></script>

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

<script type="text/javascript" src="resources/js/plugins/fullcalendar/fullcalendar.min.js"></script>
<!-- END THIS PAGE PLUGINS-->

<!-- START TEMPLATE -->

<script type="text/javascript" src="resources/js/plugins.js"></script>
<script type="text/javascript" src="resources/js/actions.js"></script>

<script type="text/javascript" src="resources/js/demo_dashboard.js"></script>
</body>
</html>






