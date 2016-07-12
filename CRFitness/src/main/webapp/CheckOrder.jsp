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

#radioBtn .notActive {
	color: #3276b1;
	background-color: #fff;
}
</style>
</head>
<body>
	<aside>
		<div class="checkorder">

			<form class="form-horizontal">
				<fieldset>

					<!-- Form Name -->
					<legend class="well well-sm" style="text-align: center">填寫訂單資訊</legend>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinputname">收件人姓名</label>
						<div class="col-md-4">
							<input id="textinputname" name="textinputname" type="text"
								placeholder="收件人姓名" class="form-control input-md"
								autocomplete="off" required="">
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinputmobile">收件地址</label>
						<div class="col-md-4">
							<input id="textinputmobile" name="textinputmobile" type="text"
								placeholder="收件地址" class="form-control input-md"
								autocomplete="off">
						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinputmobilealt">E-mail</label>
						<div class="col-md-4">
							<input id="textinputmobilealt" name="textinputmobilealt"
								type="text" placeholder="E-mail" class="form-control input-md"
								autocomplete="off">
						</div>
					</div>

					<!-- 付款方式 -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinputmobilealt">
							付款方式</label>
						<div class="col-md-4">
							<div class="input-group">
								<div id="radioBtn" class="btn-group">
									<a class="btn btn-primary btn-sm active" data-toggle="happy"
										data-title="X">線上刷卡</a> <a
										class="btn btn-primary btn-sm notActive" data-toggle="happy"
										data-title="Y">ATM轉帳</a> <a
										class="btn btn-primary btn-sm notActive" data-toggle="happy"
										data-title="Z">超商繳費</a> <a
										class="btn btn-primary btn-sm notActive" data-toggle="happy"
										data-title="A">用身體付</a>
								</div>
								<input type="hidden" name="happy" id="happy">
							</div>
						</div>
					</div>

					<!-- Button -->
					</br>
					<div class="form-group">
						<label class="col-md-4 control-label" for="singlebuttonsubmit"></label>
						<div class="col-md-4">
							<button id="singlebuttonsubmit" name="singlebuttonsubmit"
								class="btn btn-success">送出訂單</button>
						</div>
					</div>

				</fieldset>
			</form>
		</div>

	</aside>
	<script type="text/javascript">
		$('#radioBtn a').on(
				'click',
				function() {
					var sel = $(this).data('title');
					var tog = $(this).data('toggle');
					$('#' + tog).prop('value', sel);

					$('a[data-toggle="' + tog + '"]').not(
							'[data-title="' + sel + '"]').removeClass('active')
							.addClass('notActive');
					$('a[data-toggle="' + tog + '"][data-title="' + sel + '"]')
							.removeClass('notActive').addClass('active');
				})
	</script>
</body>
</html>