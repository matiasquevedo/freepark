<%@ include file="/WEB-INF/views/templates/layout/tags.jsp"%>
<%@ page session="false"%>
<div class="container" style="margin-top: 50px;">
	<tiles:insertDefinition name="defaultTemplate">
		<tiles:putAttribute name="mensajes"
			value="/WEB-INF/views/templates/page/mensajes.jsp" />
		<tiles:putAttribute name="body">
			<h2>Editar Usuario</h2>
			<div class="panel panel-default">
				<div class="panel-heading">Formulario</div>
				<div class="panel-body">
					<form:form nethod="POST" id="form" modelAttribute="usuarioDatos"
						role="form" cssClass="form-horizontal">
						
						<spring:bind path="id">
							<form:hidden id="id" path="id" disabled="true" />
						</spring:bind>
						
						<spring:bind path="apellido">
							<div class="form-group ${status.error ? 'has-error' : '' }">
								<label class="control-label col-md-2" for="apellido">Apellido:</label>
								<div class="col-md-10">
									<form:input id="apellido" cssClass="form-control"
										path="apellido" placeholder="Apellido" data-bv-notempty="true"
										data-bv-notempty-message="El Apellido no puede estar vacio" />
									<c:if test="${status.error}">
										<span class="text-danger">${status.errorMessage}</span>
									</c:if>
								</div>
							</div>
						</spring:bind>
						
						<spring:bind path="nombre">
							<div class="form-group ${status.error ? 'has-error' : '' }">
								<label class="control-label col-md-2" for="nombre">Nombre:</label>
								<div class="col-md-10">
									<form:input id="nombre" cssClass="form-control" path="nombre"
										placeholder="Nombre" data-bv-notempty="true"
										data-bv-notempty-message="El Nombre no puede estar vacio" />
									<c:if test="${status.error}">
										<span class="text-danger">${status.errorMessage}</span>
									</c:if>
								</div>
							</div>
						</spring:bind>

						<spring:bind path="email">
							<div class="form-group ${status.error ? 'has-error' : '' }">
								<label class="control-label col-md-2" for="email">Email:</label>
								<div class="col-md-10">
									<form:input id="email" cssClass="form-control" path="email"
										placeholder="email" data-bv-emailaddress="true"
										data-bv-emailaddress-message="El email es inválido" />
									<c:if test="${status.error}">
										<span class="text-danger">${status.errorMessage}</span>
									</c:if>
								</div>
							</div>
						</spring:bind>

						<div class="form-group">
							<div class="col-md-offset-2 col-md-5">
								<a class="btn btn-primary" role="button"
									href='<c:url value="/backend/usuarios/" />' title="Volver">Volver</a>
							</div>
							<div class="col-md-5">
								<button type="submit" class="btn btn-success">Guardar</button>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</tiles:putAttribute>
	</tiles:insertDefinition>
</div>