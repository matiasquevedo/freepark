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
								<form:form method="POST" modelAttribute="vehiculo">
<<<<<<< HEAD
									<spring:bind path="id">
										<div class="form-group ${status.error ? 'has-error' : '' }">
											<form:hidden path="id" value="${vehiculo.id}" />
											<c:if test="${status.error}">
												<span class="text-danger">${status.errorMessage}</span>
											</c:if>
										</div>
									</spring:bind>
									<spring:bind path="patente">
										<div class="form-group ${status.error ? 'has-error' : '' }">
											<form:hidden path="patente" value="${vehiculo.patente}" />
											<c:if test="${status.error}">
												<span class="text-danger">${status.errorMessage}</span>
											</c:if>
										</div>
									</spring:bind>
									<spring:bind path="marca">
										<div class="form-group ${status.error ? 'has-error' : '' }">
											<form:hidden path="marca" value="${vehiculo.marca}" />
											<c:if test="${status.error}">
												<span class="text-danger">${status.errorMessage}</span>
											</c:if>
										</div>
									</spring:bind>
									<spring:bind path="modelo">
										<div class="form-group ${status.error ? 'has-error' : '' }">
											<form:hidden path="modelo" value="${vehiculo.modelo}" />
=======
									<spring:bind path="vehiculo">
										<div
											class="col-md-6 form-group ${status.error ? 'has-error' : '' }">
											<form:hidden path="vehiculo" value="${vehiculo}" />

>>>>>>> 03ec583423fe2066124c0250c9f2046e942c0a79
											<c:if test="${status.error}">
												<span class="text-danger">${status.errorMessage}</span>
											</c:if>
										</div>
									</spring:bind>
<<<<<<< HEAD
									<button type="submit" class="btn btn-default">
										 <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
									</button>
=======
									
									<button type="submit" class="btn glyphicon glyphicon-plus"></button>
>>>>>>> 03ec583423fe2066124c0250c9f2046e942c0a79
								</form:form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</tiles:putAttribute>
	</tiles:insertDefinition>
</div>
