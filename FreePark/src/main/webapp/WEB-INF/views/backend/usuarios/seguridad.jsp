<%@ include file="/WEB-INF/views/templates/layout/tags.jsp"%>
<%@ page session="false"%>
<div class="container" style="margin-top: 50px;">
	<tiles:insertDefinition name="defaultTemplate">
		<tiles:putAttribute name="mensajes"
			value="/WEB-INF/views/templates/page/mensajes.jsp" />
		<tiles:putAttribute name="body">
			<h2>Seguridad - Cambio de clave</h2>
			<div class="panel panel-default">
				<div class="panel-heading">Formulario</div>
				<div class="panel-body">
					<form:form method="POST" data-toggle="validator" id="form"
						modelAttribute="seguridadForm" role="form"
						cssClass="form-horizontal" accept-charset="utf-8">
						
						<spring:bind path="username">
							<div class="form-group ${status.error ? 'has-error' : '' }">
								<label class="control-label col-md-2" for="username">Usuario:</label>
								<div class="col-md-5">
									<form:input cssClass="form-control" type="text" id="username"
										path="username" readonly="true" />
									<c:if test="${status.error}">
										<span class="text-danger">${status.errorMessage}</span>
									</c:if>
								</div>
							</div>
						</spring:bind>
						
						<spring:bind path="rol">
							<div class="form-group ${status.error ? 'has-error' : '' }">
								<label class="control-label col-md-2" for="rol">Rol:</label>
								<div class="col-md-5">
								<form:select path="rol" cssClass="form-control">
									<form:options items="${roles}" itemValue="id"
										itemLabel="nombre" />
								</form:select>
								</div>
							</div>
						</spring:bind>

						<spring:bind path="password">
							<div class="form-group ${status.error ? 'has-error' : '' }">
								<label class="control-label col-md-2" for="password">Nueva
									Clave:</label>
								<div class="col-md-5">
									<form:password id="password" cssClass="form-control"
										path="password" data-minlength="6" placeholder="Password"
										required="required" />
									<c:if test="${status.error}">
										<span class="text-danger">${status.errorMessage}</span>
									</c:if>
								</div>
							</div>
						</spring:bind>

						<spring:bind path="confirmPassword">
							<div class="form-group ${status.error ? 'has-error' : '' }">
								<label class="control-label col-md-2" for="confirmPassword">Confirmar
									Clave:</label>
								<div class="col-md-5">
									<form:password id="confirmPassword" cssClass="form-control"
										path="confirmPassword" placeholder="Confirmar Clave"
										required="required" data-minlength="6"
										data-match="#password"
										data-match-error="Las claves deben ser iguales" />
									<c:if test="${status.error}">
										<span class="text-danger">${status.errorMessage}</span>
									</c:if>
								</div>
							</div>
						</spring:bind>

						<div class="form-group">
							<div class="col-md-offset-2 col-md-2">
								<a class="btn btn-default" role="button"
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