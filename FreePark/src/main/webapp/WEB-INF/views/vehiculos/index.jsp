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
				<div class="col-md-5">PATENTE</div>
				<div class="col-md-3">MARCA</div>
				<div class="col-md-3">MODELO</div>
			</div>
			<c:forEach var="vehiculo" items="${vehiculos}">
				<div class="row">
					<div class="col-md-1">
						<c:out value="${vehiculo.id}" />
					</div>
					<div class="col-md-5">
						<c:out value="${vehiculo.patente}" />
					</div>
					<div class="col-md-3">
						<c:out value="${vehiculo.marca}" />
					</div>
					<div class="col-md-3">
						<c:out value="${vehiculo.modelo}" />
					</div>
				</div>
			</c:forEach>
			<a href="<c:url value="/vehiculos/nuevo/" />" class="btn btn-primary">Nuevo</a>
		</tiles:putAttribute>
	</tiles:insertDefinition>
</div>
