<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/templates/layout/tags.jsp"%>
<jsp:useBean id="now" class="java.util.Date" scope="page" />
<footer>
	<div class="container-fluid">
		<div class="row">
			<div class="col-xs-12 col-md-6">
				<p>
					FreePark v0.0.9 
				</p>
			</div>
			<div class="col-xs-12 col-md-6">
				<p>
				<i class="fa fa-chrome" style="color:#fff;" aria-hidden="true"></i> Chrome 
				<i class="fa fa-firefox" style="color:#fff;" aria-hidden="true"></i> Firefox
				<i class="fa fa-internet-explorer" style="color:#fff;" aria-hidden="true"></i> Internet Explorer: v9, v10, v11
				<i class="fa fa-edge" style="color:#fff;" aria-hidden="true"></i> Edge<br>
					&copy; <em id="copyright-year"><fmt:formatDate value="${now}" pattern="yyyy" /></em> | <a
						href="<c:url value="/" />"
						title="T&eacute;rminos y condiciones">T&eacute;rminos y condiciones para aplicaciones inform&aacute;ticas</a>
				</p>
			</div>
		</div>
	</div>
</footer>
