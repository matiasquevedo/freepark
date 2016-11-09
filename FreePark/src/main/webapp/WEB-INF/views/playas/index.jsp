<%@ include file="/WEB-INF/views/templates/layout/tags.jsp"%>
<%@ page session="false"%>
<div class="container" style="margin-top: 50px;">
	<tiles:insertDefinition name="defaultTemplate">
		<tiles:putAttribute name="mensajes"
			value="/WEB-INF/views/templates/page/mensajes.jsp" />
		<tiles:putAttribute name="body">
			<center>
				<h1>Opciones de Administracion</h1>
			</center>
			
			<table class="table table-striped">
				<thead>
					<tr>
						<th>ID</th>
						<th>NOMBRE</th>
						<th>LATITUD</th>
						<th>LONGITUD</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="playa" items="${playas}">
						<tr>
							<th><c:out value="${playa.id}" /></th>
							<td><c:out value="${playa.nombre}" /></td>
							<td><c:out value="${playa.latitud}" /></td>
							<td><c:out value="${playa.longitud}" /></td>
							<td>
								<a href="<c:url value="eliminar/${playa.id}" />" class="glyphicon glyphicon-trash"></a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<a href="<c:url value="/playas/nuevo/" />" class="btn btn-primary">Nuevo</a>
		</tiles:putAttribute>
	</tiles:insertDefinition>
</div>
