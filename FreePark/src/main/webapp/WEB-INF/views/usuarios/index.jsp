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
						<th>APELLIDO</th>
						<th>NOMBRE</th>
						<th>EMAIL</th>
						<th>USUARIO</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="usuarioDato" items="${usuariosDatos}">
						<tr>
							<th><c:out value="${usuarioDato.id}" /></th>
							<td><c:out value="${usuarioDato.apellido}" /></td>
							<td><c:out value="${usuarioDato.nombre}" /></td>
							<td><c:out value="${usuarioDato.email}" /></td>
							<td><c:out value="${usuarioDato.usuario.username}" /></td>
							<td>
								<div class="btn-group">
									<button type="button"
										class="btn btn-sm btn-default dropdown-toggle"
										data-toggle="dropdown">
										<i class="glyphicon glyphicon-cog"></i> <span class="caret"></span>
									</button>
									<ul class="dropdown-menu" role="menu">
										<li><a
											href="<c:url value="/backend/usuarios/${usuarioDato.id}/editar" />"><i
												class="glyphicon glyphicon-edit"></i> Editar</a></li>
										<li><a
											href="<c:url value="/backend/seguridad/${usuarioDato.usuario.id}/editar" />"><i
												class="glyphicon glyphicon-user"></i> Seguridad</a></li>
										<li><a
											href="<c:url value="/backend/usuarios/${usuarioDato.usuario.id}/borrar" />"><i
												class="glyphicon glyphicon-remove"></i> Borrar</a></li>
									</ul>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<a href="<c:url value="/backend/usuarios/nuevo" />" class="btn btn-primary" title="Nuevo Usuario">Nuevo</a>
		</tiles:putAttribute>
	</tiles:insertDefinition>
</div>
