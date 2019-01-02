<%@ page import="com.firstspring.classes.Users" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <!-- META SECTION -->
    <title>New transaction</title>
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

<%Users manager = (Users)session.getAttribute("manager");%>
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

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">New Transaction</h3>
            </div>
            <div class="panel-body">
                <p>Please select type transaction:</p>
                <div class="form-group">
                    <button type="button" class="btn btn-success mb-control" data-box="#message-box-exchange">EXCHANGE</button>
                    <button type="button" class="btn btn-info mb-control" data-box="#message-box-debet">DEBET</button>
                    <button type="button" class="btn btn-warning mb-control" data-box="#message-box-credit">CREDIT</button>
                    <button type="button" class="btn btn-danger mb-control" data-box="#message-box-transfer">TRANSFER</button>
                </div>
            </div>
        </div>

        <!-- END PAGE CONTENT WRAPPER -->
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


<div class="message-box animated fadeInLeft" id="message-box-exchange">
    <div class="mb-container">
        <div class="mb-middle">
            <div class="mb-title"><span class="fa fa-money"></span><strong>Exchange Money</strong></div>
            <div class="mb-content">
                <p>Please fill everything here:</p>
            </div>

            <form class="form-horizontal" action="/exchangeMoney" method="post">

                <div class="form-group">
                    <label class="col-md-3 col-xs-12 control-label">AMOUNT</label>
                    <div class="col-md-6 col-xs-12">
                        <div class="input-group">
                            <input type="text" class="form-control" name="amount" id="sum" onkeyup="doAjax()" required/>
                        </div>
                        <span style="color: red" id="error" class="pull-left"></span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 col-xs-12 control-label">SELECT CURRENCY FROM</label>
                    <div class="col-md-6 col-xs-12">
                        <div class="input-group">
                            <select class="form-control" name="currency" id="c1">
                                <option value="1">RUB</option>
                                <option value="2">EUR</option>
                                <option value="3">GBP</option>
                                <option value="4">USD</option>
                                <option value="5">KZT</option>
                                <option value="6">KGS</option>
                                <option value="7">CNY</option>
                            </select>
                            <span ></span>
                        </div>
                    </div>
                </div>


                <div class="form-group">
                    <label class="col-md-3 col-xs-12 control-label">SELECT CURRENCY TO</label>
                    <div class="col-md-6 col-xs-12">
                        <div class="input-group">
                            <select class="form-control" name="currency2" id="c2">
                                <option value="1">RUB</option>
                                <option value="2">EUR</option>
                                <option value="3">GBP</option>
                                <option value="4">USD</option>
                                <option value="5">KZT</option>
                                <option value="6">KGS</option>
                                <option value="7">CNY</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div>

                </div>
                <%if(manager!=null){%>
                <input type="hidden" name="manId" value="<%=manager.getLogin()%>">
                <%}%>
                <input type="hidden" name="oId" value="1">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <button type="submit" class="btn btn-success btn-lg">EXCHANGE</button>
            </form>
            <button class="btn btn-default btn-lg mb-control-close">NO</button>
        </div>
    </div>
</div>
<script>
    function doAjax() {
        $.ajax({
            url: 'Change1',
            data: ({sum : $('#sum').val(), id1:$('#c1').val(), id2:$('#c2').val()}),
            success: function (data) {
                $('#error').html(data);
            }
        });
    }
</script>

<div class="message-box animated fadeInLeft" id="message-box-debet">
    <div class="mb-container">
        <div class="mb-middle">
            <div class="mb-title"><span class="fa fa-plus-circle"></span><strong>Debet</strong></div>
            <div class="mb-content">
                <p>Please fill everything here:</p>
            </div>

            <form class="form-horizontal" action="/debet" method="post">

                <div class="form-group">
                    <label class="col-md-3 col-xs-12 control-label">AMOUNT</label>
                    <div class="col-md-6 col-xs-12">
                        <div class="input-group">
                            <input type="text" class="form-control" name="amount" id="sum1" onkeyup="doAjax1()" required/>
                        </div>
                        <span style="color: red" id="error1" class="pull-left"></span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 col-xs-12 control-label">SELECT ACCOUNT</label>
                    <div class="col-md-6 col-xs-12">
                        <div class="input-group">
                            <c:if test="${allAccounts!=null}">
                            <select class="form-control" name="account">
                                <c:forEach items="${allAccounts}" var="acc">
                                <option value="${acc.id}">${acc.first_name}-${acc.last_name}</option>
                                    </c:forEach>
                            </select>
                            </c:if>
                        </div>
                    </div>
                </div>
                <div>
                </div>

                <input type="hidden" name="oId" value="2">
                <%if(manager!=null){%>
                <input type="hidden" name="manId" value="<%=manager.getLogin()%>">
                <%}%>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <button type="submit" class="btn btn-info btn-lg">DEBET</button>
            </form>
            <button class="btn btn-default btn-lg mb-control-close">NO</button>
        </div>
    </div>
</div>

<script>
    function doAjax1() {
        $.ajax({
            url: 'Change2',
            data: ({total : $('#sum1').val()}),
            success: function (data) {
                $('#error1').html(data);
            }
        });
    }
</script>

<div class="message-box animated fadeInLeft" id="message-box-credit">
    <div class="mb-container">
        <div class="mb-middle">
            <div class="mb-title"><span class="fa fa-minus-circle"></span><strong>Credit</strong></div>
            <div class="mb-content">
                <p>Please fill everything here:</p>
            </div>

            <form class="form-horizontal" action="/credit" method="post">

                <div class="form-group">
                    <label class="col-md-3 col-xs-12 control-label">AMOUNT</label>
                    <div class="col-md-6 col-xs-12">
                        <div class="input-group">
                            <input type="text" class="form-control" name="amount" id="sum2" onkeyup="doAjax2()" required/>
                        </div>
                        <span style="color: red" id="error2" class="pull-left"></span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 col-xs-12 control-label">SELECT ACCOUNT</label>
                    <div class="col-md-6 col-xs-12">
                        <div class="input-group">
                            <c:if test="${allAccounts!=null}">
                                <select class="form-control" name="account" id="id4">
                                    <c:forEach items="${allAccounts}" var="acc">
                                        <option value="${acc.id}" >${acc.first_name}-${acc.last_name}</option>
                                    </c:forEach>
                                </select>
                            </c:if>
                        </div>
                    </div>
                </div>
                <div>
                </div>

                <input type="hidden" name="oId" value="3">
                <%if(manager!=null){%>
                <input type="hidden" name="manId" value="<%=manager.getLogin()%>">
                <%}%>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <button type="submit" class="btn btn-warning btn-lg">CREDIT</button>
            </form>
            <button class="btn btn-default btn-lg mb-control-close">NO</button>
        </div>
    </div>
</div>

<script>
    function doAjax2() {
        $.ajax({
            url: 'Change3',
            data: ({total:$('#sum2').val(), id:$('#id4').val()}),
            success: function (data) {
                $('#error2').html(data);
            }
        });
    }
</script>

<div class="message-box animated fadeInLeft" id="message-box-transfer">
    <div class="mb-container">
        <div class="mb-middle">
            <div class="mb-title"><span class="fa fa-share-square"></span><strong>Transfer Money</strong></div>
            <div class="mb-content">
                <p>Please fill everything here:</p>
            </div>

            <form class="form-horizontal" action="/transfer" method="post">

                <div class="form-group">
                    <label class="col-md-3 col-xs-12 control-label">AMOUNT</label>
                    <div class="col-md-6 col-xs-12">
                        <div class="input-group">
                            <input type="text" class="form-control" name="amount" id="sum3" onkeyup="doAjax3()"required/>
                        </div>
                        <span style="color: red" id="error3" class="pull-left"></span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-3 col-xs-12 control-label">SELECT FROM</label>
                    <div class="col-md-6 col-xs-12">
                        <div class="input-group">
                            <c:if test="${allAccounts!=null}">
                                <select class="form-control" name="account1" id="id5">
                                    <c:forEach items="${allAccounts}" var="acc">
                                        <option value="${acc.id}">${acc.first_name}-${acc.last_name}</option>
                                    </c:forEach>
                                </select>
                            </c:if>
                        </div>
                    </div>
                </div>


                <div class="form-group">
                    <label class="col-md-3 col-xs-12 control-label">SELECT TO</label>
                    <div class="col-md-6 col-xs-12">
                        <div class="input-group">
                            <c:if test="${allAccounts!=null}">
                                <select class="form-control" name="account2" id="id6">>
                                    <c:forEach items="${allAccounts}" var="acc">
                                        <option value="${acc.id}"> ${acc.first_name}-${acc.last_name}</option>
                                    </c:forEach>
                                </select>
                            </c:if>
                        </div>
                    </div>
                </div>

                <div>
                </div>
                <input type="hidden" name="oId" value="4">
                <%if(manager!=null){%>
                <input type="hidden" name="manId" value="<%=manager.getLogin()%>">
                <%}%>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <button type="submit" class="btn btn-danger btn-lg">TRANSFER</button>
            </form>
            <button class="btn btn-default btn-lg mb-control-close">NO</button>
        </div>
    </div>
</div>
<script>
    function doAjax3() {
        $.ajax({
            url: 'Change4',
            data: ({total:$('#sum3').val(), id:$('#id5').val(), id1:$('#id6').val()}),
            success: function (data) {
                $('#error3').html(data);
            }
        });
    }
</script>

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

<script type="text/javascript" src="resources/js/plugins/fullcalendar/fullcalendar.min.js"></script>
<!-- END THIS PAGE PLUGINS-->

<!-- START TEMPLATE -->

<script type="text/javascript" src="resources/js/plugins.js"></script>
<script type="text/javascript" src="resources/js/actions.js"></script>

<script type="text/javascript" src="resources/js/demo_dashboard.js"></script>
</body>
</html>






