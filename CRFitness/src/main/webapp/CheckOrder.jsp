<%@ page language="java" contentType="text/html; charset=utf8"
	pageEncoding="utf8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<head>
<jsp:include page="/CRFitness.jsp" />
<link href="${this_contextPath}/icon/CRFicon.ico" rel="SHORTCUT ICON">
<title>填寫訂單</title>

<style type="text/css">
.checkorder {
	margin-top: 4%
}
</style>
</head>
<body>
	<aside>
		<div class="checkorder">
			<div class="col-ms-2"></div>
			<div class="row col-ms-8">
				<form class="form-horizontal">
					<fieldset>

						<!-- Form Name -->
						<legend>填寫訂單資訊</legend>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="textinputname">收件人姓名</label>
							<div class="col-md-4">
								<input id="textinputname" name="textinputname" type="text"
									placeholder="Full Name" class="form-control input-md"
									required="">

							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="textinputmobile">收件地址</label>
							<div class="col-md-4">
								<input id="textinputmobile" name="textinputmobile" type="text"
									placeholder="Mobile No" class="form-control input-md">

							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="textinputmobilealt">E-mail</label>
							<div class="col-md-4">
								<input id="textinputmobilealt" name="textinputmobilealt"
									type="text" placeholder="alternate mobile no."
									class="form-control input-md">
							</div>
						</div>
						
						<!-- 付款方式 -->
						<div class="form-group">
						<label class="col-md-4 control-label" for="textinputmobilealt">
						付款方式</label>
						<div class="col-md-4">
<div class="input-group">
    				<div id="radioBtn" class="btn-group">
    					<a class="btn btn-primary btn-sm active" data-toggle="happy" data-title="Y">YES</a>
    					<a class="btn btn-primary btn-sm notActive" data-toggle="happy" data-title="N">NO</a>
    				</div>
    				<input type="hidden" name="happy" id="happy">
    			</div>
					</div>	
						</div>

						<!-- Button -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="singlebuttonsubmit"></label>
							<div class="col-md-4">
								<button id="singlebuttonsubmit" name="singlebuttonsubmit"
									class="btn btn-primary">Submit</button>
							</div>
						</div>

					</fieldset>
				</form>
			</div>
			<div class="col-ms-2"></div>
		</div>
	</aside>
</body>
</html>