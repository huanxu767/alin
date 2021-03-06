<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>达成率权重配置</title>
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
    <link href="../css/main.css" rel="stylesheet">

</head>


<body style="background-color: transparent;">


<div class="wrapper my-wrapper ">
    <div class="ibox my-ibox" id="ibox">
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
                        <th>指标名称</th>
                        <th>权重</th>
                        <th>核算下线</th>
                        <th>核算上线</th>
                        <th style="width: 136px">操作</th>
                    </tr>
                    </thead>
                    <tbody id="rateList">

                    </tbody>
                </table>

            </div>

        </div>
    </div>
</div>


<div class="modal inmodal fade" id="myModal5" tabindex="-1" role="dialog"  aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ibox " style="margin-bottom: 0;">
                            <!--<div class="ibox-title">-->
                            <!--<h5>修改权重</h5>-->
                            <!--</div>-->
                            <div class="ibox-content" style="padding-bottom: 0;text-align: left;">
                                <form method="post" class="form-horizontal" id="rateForm" novalidate="novalidate">
                                    <input type="hidden" class="form-control" id="kpiCode" name="kpiCode">
                                    <div class="form-group">
                                        <label class="col-lg-4 control-label">名称</label>
                                        <div class="col-lg-8"><p class="form-control-static" id="kpiName" style="text-align: left;"></p></div>
                                    </div>
                                    <div class="hr-line-dashed"></div>


                                    <div class="form-group"><label class="col-sm-4 control-label">权重</label>
                                        <div class="col-sm-8">
                                           <input type="text" class="form-control" id="weight" name="weight">
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group"><label class="col-sm-4 control-label">核算下线</label>
                                        <div class="col-sm-8">
                                            <div class="input-group m-b"><input type="text" class="form-control" id="kpiDown" name="kpiDown">
                                                <span class="input-group-addon">%</span></div>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>

                                    <div class="form-group"><label class="col-sm-4 control-label">核算上线</label>
                                        <div class="col-sm-8">
                                            <div class="input-group m-b"><input type="text" class="form-control" id="kpiUp" name="kpiUp"> <span class="input-group-addon">%</span></div>
                                        </div>
                                    </div>

                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <div class="col-sm-8 col-sm-offset-2">
                                            <button type="button" class="btn btn-white" data-dismiss="modal">取消</button>
                                            <button type="button" class="btn btn-primary" onclick="save()" id="sub">提交</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
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
<script src="../js/lib/jquery.page.js"></script>
<!-- Jquery Validate -->
<script src="../js/plugins/validate/jquery.validate.min.js"></script>
<script src="../js/systemadmin/rateAdmin.js"></script>

</body>
</html>






