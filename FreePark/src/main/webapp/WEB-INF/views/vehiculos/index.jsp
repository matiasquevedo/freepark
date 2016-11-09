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
						<th>PATENTE</th>
						<th>MARCA</th>
						<th>MODELO</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="vehiculo" items="${vehiculos}">
						<tr>
							<th><c:out value="${vehiculo.id}" /></th>
							<td><c:out value="${vehiculo.patente}" /></td>
							<td><c:out value="${vehiculo.marca}" /></td>
							<td><c:out value="${vehiculo.modelo}" /></td>
							<td>
								<a href="<c:url value="eliminar/${vehiculo.id}" />" class="glyphicon glyphicon-trash"></a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</tiles:putAttribute>
	</tiles:insertDefinition>
</div>
