<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="categoryURL" value="/quan-tri/the-loai/danh-sach"/>
<c:url var="editCategoryURL" value="/quan-tri/the-loai/chinh-sua"/>
<c:url var="categoryAPI" value="/api/category"/>
<html>
<head>
<title>Chỉnh sửa thể loại</title>
</head>
<body>
<div class="main-content">
	<div class="main-content-inner">
		<div class="breadcrumbs" id="breadcrumbs">
			<script type="text/javascript">
				try {
					ace.settings.check('breadcrumbs', 'fixed')
				} catch (e) {
				}
			</script>

			<ul class="breadcrumb">
				<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Home</a>
				</li>

				<li><a href="#">Forms</a></li>
				<li class="active">Form Elements</li>
			</ul>
			<!-- /.breadcrumb -->
		</div>
		<div class="page-content">
			<div class="row">
				<div class="col-xs-12">
					<c:if test="${not empty message}">
						<div class="alert alert-${alert}">
  							${message}
						</div>
					</c:if>
					<form:form class="form-horizontal" role="form" id="formSubmit" modelAttribute="model">
						<div class="form-group">
						  	<label for="name" class="col-sm-3 control-label no-padding-right">Thể loại:</label>
						  	<div class="col-sm-9">
						  		<form:textarea path="name" rows="5" cols="10" cssClass="form-control" id="name"/>
						  	</div>
						</div>
						<div class="form-group">
						  	<label for="code" class="col-sm-3 control-label no-padding-right">Code:</label>
						  	<div class="col-sm-9">
						  		<form:textarea path="code" rows="5" cols="10" cssClass="form-control" id="codes"/>
						  	</div>
						</div>
						<form:hidden path="id" id="categoryId"/>
						<div class="clearfix form-actions">
							<div class="col-md-offset-3 col-md-9">
											<c:if test="${not empty model.id}">
												<button class="btn btn-info" type="button" id="btnAddOrUpdateCategory">
													<i class="ace-icon fa fa-check bigger-110"></i>
													Cập nhật thể loại
												</button>
											</c:if>
											<c:if test="${empty model.id}">
												<button class="btn btn-info" type="button" id="btnAddOrUpdateCategory">
													<i class="ace-icon fa fa-check bigger-110"></i>
													Thêm thể loại
												</button>
											</c:if>

											&nbsp; &nbsp; &nbsp;
											<button class="btn" type="reset">
												<i class="ace-icon fa fa-undo bigger-110"></i>
												Hủy
											</button>
							</div>		
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>	

<script>
	$('#btnAddOrUpdateCategory').click(function (e) {
	    e.preventDefault();
	    var data = {};
	    var formData = $('#formSubmit').serializeArray();
	    $.each(formData, function (i, v) {
            data[""+v.name+""] = v.value;
        });
	    var id = $('#categoryId').val();
	    if (id == "") {
	    	addCategory(data);
	    } else {
	    	updateCategory(data);
	    }
	});
	
	function addCategory(data) {
		$.ajax({
            url: '${categoryAPI}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href = "${categoryURL}?message=insert_success";
            },
            error: function (error) {
            	window.location.href = "${editCategoryURL}?id="+result.id+"&message=error_system";
            }
        });
	}
	
	function updateCategory(data) {
		$.ajax({
            url: '${categoryAPI}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href = "${categoryURL}?id="+result.id+"&message=update_success";
            },
            error: function (error) {
            	window.location.href = "${editCategoryURL}?id="+result.id+"&message=error_system";
            }
        });
	}
</script>
</body>
</html>