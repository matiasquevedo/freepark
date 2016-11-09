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
						<th>USUARIOS_ID</th>
						<th>VEHICULOS_ID</th>
						<th>FECHA_INGRESO</th>
						<th>FECHA_SALIDA</th>
						<th>ESTACIONAMIENTO_ID</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="reserva" items="${reservas}">
						<tr>
							<th><c:out value="${reserva.id}" /></th>
							<td><c:out value="${reserva.usuario.username}" /></td>
							<td><c:out value="${reserva.vehiculo.patente}" /></td>
							<td><c:out value="${reserva.fechaIngreso}" /></td>
							<td><c:out value="${reserva.fechaSalida}" /></td>
							<td><c:out value="${reserva.estacionamiento.referencia}" /></td>
							<td>
								<a href="<c:url value="eliminar/${reserva.id}" />" class="glyphicon glyphicon-trash"></a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</tiles:putAttribute>
	</tiles:insertDefinition>
</div>
