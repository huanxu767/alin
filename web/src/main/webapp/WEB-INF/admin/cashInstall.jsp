<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>现金分期</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="../css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="../css/animate.css" rel="stylesheet">
    <!-- Toastr style -->
    <link href="../css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <link href="../css/style.css" rel="stylesheet">
    <link href="../css/plugins/ladda/ladda-themeless.min.css" rel="stylesheet">
    <link href="../css/plugins/steps/jquery.steps.css" rel="stylesheet">
    <!-- Sweet Alert -->
    <link href="../css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="../css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet">
    <link href="../css/plugins/jedate/jedate.css" rel="stylesheet">
    <link href="../css/main.css" rel="stylesheet">
    <link href="../css/easybuy-store.css" rel="stylesheet">
    <link href="../css/smart.css" rel="stylesheet">

</head>


<body style="background-color: transparent;">


<div class="wrapper my-wrapper ">

    <!--指标期间选择-->
    <div class="ibox" >
        <div class="ibox-title">
            <h5>对比期间选择</h5>
        </div>
        <div class="ibox-content">
            <div class="form-horizontal">
                <div class="form-group">
                    <label class="col-md-1 control-label">查询期：</label>
                    <div class="col-md-2">
                        <input type="text" id="cBeginTime" class="form-control " placeholder="" readonly>
                    </div>
                    <div class="col-md-2">
                        <input type="text" id="cEndTime" class="form-control"placeholder="" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-1 control-label">对比期：</label>
                    <div class="col-md-2">
                        <input type="text" id="dBeginTime" class="form-control" placeholder="" readonly>
                    </div>
                    <div class="col-md-2">
                        <input type="text" id="dEndTime" class="form-control" placeholder="" readonly>
                    </div>
                    <div class="col-md-6">
                        <button type="button" class="btn btn-w-m btn-primary" id="searchButton" onclick="cashInstallments(false)">查询</button>
                        <button type="button" class="btn btn-w-m btn-default" id="addButton">导出编辑</button>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <!--分析思路-->
    <div class="ibox" >
        <div class="ibox-title">
            <h5>分析思路</h5>
        </div>
        <div class="ibox-content">
            <p class="text-primary">A、营销策略分析：从分期与利息活动的角度分析金额的增幅</p>
            <p class="text-primary">B、构成分析：投放金额=人数*客单价，从品类客单和使用人数构成的角度查看对比增长</p>
            <p class="text-primary">C、提现比例影响分析：从提额比例提升的角度查看与对比期数据对比</p>
            <p class="text-primary">D、营销活动明细：展现查询期间内具体营销活动带来的投放</p>

        </div>
    </div>
    <!--营销策略分析-->
    <div class="ibox" >
        <div class="ibox-title">
            <h5>营销策略分析</h5>
        </div>
        <div class="ibox-content">
            <div id="cmarketingChart" class="normal-chart">

            </div>
        </div>
    </div>
    <!--营销策略分析-->
    <div class="ibox" id="xjfqkdfxBox">
        <div class="ibox-title">
            <h5>构成分析-客单分析</h5>
        </div>
        <div class="ibox-content" >
            <div class="sk-spinner sk-spinner-wave">
                <div class="sk-rect1"></div>
                <div class="sk-rect2"></div>
                <div class="sk-rect3"></div>
                <div class="sk-rect4"></div>
                <div class="sk-rect5"></div>
            </div>
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>天数 </th>
                        <th>投放金额(万元)</th>
                        <th>对比期金额(万元)</th>
                        <th>增长率</th>

                        <th>客单价(元)</th>
                        <th>对比期客单价(元)</th>
                        <th>增长率</th>

                        <th>投放人数</th>
                        <th>对比期人数</th>
                        <th>增长率</th>
                    </tr>
                    </thead>
                    <tbody id="xjfqkdfx">
                    <tr><td>3期</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td></tr>
                    <tr><td>6期</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td></tr>
                    <tr><td>9期</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td></tr>
                    <tr><td>12期</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td></tr>
                    <tr><td>24期</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td></tr>
                    <tr><td>36期</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td></tr>
                    <tr><td>48期</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td></tr>
                    <tr><td>60期</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td><td>-</td></tr>
                    </tbody>
                </table>
            </div>

        </div>
    </div>
    <!--客群分析-->
    <div class="ibox" id="cashSgfgBox">
        <div class="ibox-title">
            <h5>客群分析</h5>
            <div class="ibox-tools">
                <%--<a href="javascript:void(0);" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#myModal6">?</a>--%>
            </div>
        </div>
        <div class="ibox-content">
            <div class="sk-spinner sk-spinner-wave">
                <div class="sk-rect1"></div>
                <div class="sk-rect2"></div>
                <div class="sk-rect3"></div>
                <div class="sk-rect4"></div>
                <div class="sk-rect5"></div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <ul class="sortable-list connectList agile-list ui-sortable" style="margin-top: 14px;">
                        <li class="warning-element" id="task1" style="background:#fff">
                            首购：<span id="obfirstBuyCust">-</span>
                            <div class="stat-percent font-bold text-info">增长<span  id="obfirstBuyCustUp">-</span>% </div>
                        </li>
                        <li class="success-element" id="task2" style="background:#fff">
                            复购客户：<span id="obagainBuyCust">-</span>
                            <div class="stat-percent font-bold text-info">增长<span id="obagainBuyCustUp">-</span>% </div>
                        </li>
                        <li class="info-element" id="task3" style="background:#fff">
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th>维度 </th>
                                        <th>首购占比</th>
                                        <th>复购客户占比</th>
                                    </tr>
                                    </thead>
                                    <tbody >
                                    <tr><td>查询期</td><td id="obfirstBuyCustPersent">-</td><td id="obagainBuyCustPersent">-</td></tr>
                                    <tr><td>对比期</td><td id="obfirstBuyCustPersentCompare">-</td><td id="obagainBuyCustPersentCompare">-</td></tr>
                                    </tbody>
                                </table>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="col-lg-6">
                    <div id="cxlkhChart" class="normal-chart">
                        <!--新老客户对比-->
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-4">
                    <div id="crygcChart" class="normal-chart">
                        <!--人员构成-->
                    </div>
                </div>
                <div class="col-lg-8">
                    <div id="cfyghylyChart" class="normal-chart">
                        <!--非易购会员来源渠道-->
                    </div>
                </div>
            </div>

        </div>
    </div>
    <!--C、额度影响-->
    <div class="ibox">
        <div class="ibox-title">
            <h5>额度影响</h5>
            <div class="ibox-tools">
                <%--<a href="javascript:void(0);" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#myModal7">?</a>--%>
            </div>
        </div>
        <div class="ibox-content">
            <div class="row margin-top-20">
                <div class="normal-chart" id="cgedsyrsChart">
                    <!--各额度使用人数对比-->
                </div>
            </div>

            <div class="row margin-top-20">
                <div class="normal-chart" id="cgedrjtfChart">
                    <!--各额度人均投放金额对比-->
                </div>
            </div>
            <div class="row margin-top-20">
                <div class="normal-chart" id="cgedsylChart">
                    <!--各额度用户使用率分析-->
                </div>
            </div>
        </div>
    </div>
    <!--营销活动明细-->
    <div class="ibox" id="cashActivityBox">
        <div class="ibox-title">
            <h5>营销活动明细</h5>
        </div>
        <div class="ibox-content">
            <div class="sk-spinner sk-spinner-wave">
                <div class="sk-rect1"></div>
                <div class="sk-rect2"></div>
                <div class="sk-rect3"></div>
                <div class="sk-rect4"></div>
                <div class="sk-rect5"></div>
            </div>
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>活动名称</th>
                        <th>使用张数</th>
                        <th>贷款金额（元）</th>
                        <th>应收手续费（元）</th>
                        <th>券优惠手续费（元）</th>
                    </tr>
                    </thead>
                    <tbody id="cashActivtyList">
                    </tbody>
                    <tfoot>
                    <tr>
                        <td colspan="5" class="footable-visible" >
                            <div class="tcdPageCode m-pagination" id="cashActivityPage"></div>
                        </td>
                    </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>

    <!--提示 1-->
    <div class="modal inmodal fade" id="myModal6" tabindex="-1" role="dialog"  aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <p class="text-primary">指标说明</p>
                    <p class="text-primary">新客户：查询期内首次使用的客户</p>
                    <p class="text-primary">老客户：查询期内非首次使用的客户</p>
                    <p class="text-primary">易购员工：易购员工开通任性付的人数</p>
                    <p class="text-primary">非易购员工：非易购员工开通任性付的人数</p>
                </div>
            </div>
        </div>
    </div>

    <!--提示 2-->
    <div class="modal inmodal fade" id="myModal7" tabindex="-1" role="dialog"  aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <p class="text-primary">指标说明</p>
                    <p class="text-primary">• 使用人数：按用户额度区分各额度查询期和对比期的使用人数</p>
                    <p class="text-primary">• 人均投放金额：查询/对比期间内各额度区间内总投放金额÷使用人数</p>
                    <p class="text-primary">• 使用率：查询/对比期间内各额度区间内使用人数÷各额度总人数</p>
                </div>
            </div>
        </div>
    </div>
    <!-- Mainly scripts -->
    <script src="../js/jquery-3.1.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="../js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="../js/inspinia.js"></script>
    <!--<script src="../js/plugins/pace/pace.min.js"></script>-->

    <!-- iCheck -->
    <script src="../js/plugins/iCheck/icheck.min.js"></script>
    <!-- Ladda -->
    <script src="../js/plugins/ladda/spin.min.js"></script>
    <script src="../js/plugins/ladda/ladda.min.js"></script>
    <script src="../js/plugins/ladda/ladda.jquery.min.js"></script>
    <!-- Sweet alert -->
    <script src="../js/plugins/sweetalert/sweetalert.min.js"></script>
    <!-- Steps -->
    <script src="../js/plugins/steps/jquery.steps.js"></script>
    <!-- echarts -->
    <script src="../js/plugins/echarts/echarts.js"></script>
    <script src="../js/lib/jquery.page.js"></script>
    <!-- Jquery Validate -->
    <script src="../js/plugins/validate/jquery.validate.min.js"></script>
    <script src="../js/plugins/jedate/jquery.jedate.js"></script>
    <script src="../js/smart/myChart.js"></script>
</body>
<script>
    $(document).ready(function(){
        cashInstallmentsInit(false);
        $("#addButton").click(function(){
            window.parent.goDownPage();
        });
    });
</script>
</html>






