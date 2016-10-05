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
				<div class="col-md-5">NOMBRE</div>
				<div class="col-md-3">LATITUD</div>
				<div class="col-md-3">LONGITUD</div>
				<div class="col-md-3">EST C/T</div>
				<div class="col-md-3">EST S/T</div>
			</div>
			<c:forEach var="playa" items="${playas}" >
				<div class="row">
					<div class="col-md-1">
						<c:out value="${playa.id}" />
					</div>
					<div class="col-md-5">
						<c:out value="${playa.nombre}" />
					</div>
					<div class="col-md-3">
						<c:out value="${playa.latitud}" />
					</div>
					<div class="col-md-3">
						<c:out value="${playa.longitud}" />
					</div>
				</div>
			</c:forEach>
			<a href="<c:url value="/playas/nuevo/" />" class="btn btn-primary">Nuevo</a>
		</tiles:putAttribute>
	</tiles:insertDefinition>
</div>
