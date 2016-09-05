<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/templates/layout/tags.jsp"%>
<c:if test="${not empty message}">
	<!-- Mensajes -->
	<div class="row">
		<div class="col-md-12">
			<div class="alert <c:out value="${cssmessage}" /> fade in"
				role="alert">
				<button type="button" class="close" data-dismiss="alert">
					<span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span>
				</button>
				<p><c:out value="${message}" /></p>
			</div>
		</div>
	</div>
	<!-- Mensajes -->
</c:if>