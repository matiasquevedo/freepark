<%@ include file="/WEB-INF/views/templates/layout/tags.jsp"%>
<%@ page session="false"%>
<div class="container" style="margin-top: 50px;">
	<tiles:insertDefinition name="defaultTemplate">
		<tiles:putAttribute name="mensajes"
			value="/WEB-INF/views/templates/page/mensajes.jsp" />
		<tiles:putAttribute name="body">
			<h1>Opciones de Administracion</h1>
			<div class="row">
				<div class="col-md-1">ID</div>
				<div class="col-md-1">USUARIOS_ID</div>
				<div class="col-md-1">VEHICULOS_ID</div>
				<div class="col-md-4">FECHA_INGRESO</div>
				<div class="col-md-4">FECHA_SALIDA</div>
				<div class="col-md-1">ESTACIONAMIENTO_ID</div>
			</div>
			<c:forEach var="reserva" items="${reservas}" >
				<div class="row">
					<div class="col-md-1">
						<c:out value="${reserva.id}" />
					</div>
					<div class="col-md-1">
						<c:out value="${reserva.usuarios_id}" />
					</div>
					<div class="col-md-1">
						<c:out value="${reserva.vehiculos_id}" />
					</div>
					<div class="col-md-4">
						<c:out value="${reserva.fecha_ingreso}" />
					</div>
					<div class="col-md-4">
						<c:out value="${reserva.fecha_salida}" />
					</div>
					<div class="col-md-1">
						<c:out value="${reserva.estacionamiento_id}" />
					</div>
				</div>
			</c:forEach>
			<a href="<c:url value="/reservas/nuevo/" />" class="btn btn-primary">Nuevo</a>
		</tiles:putAttribute>
	</tiles:insertDefinition>
</div>
