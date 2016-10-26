<%@ include file="/WEB-INF/views/templates/layout/tags.jsp"%>
<%@ page session="false"%>
<div class="container" style="margin-top: 50px;">
	<tiles:insertDefinition name="defaultTemplate">
		<tiles:putAttribute name="mensajes"
			value="/WEB-INF/views/templates/page/mensajes.jsp" />
		<tiles:putAttribute name="body">
		<h1>Opciones de Administracion</h1>
		<div>Usuario Nuevo</div>
		<div class="container">
		<form:form method="POST" id="form" data-toggle="validator" commandName="usuario"
				role="form" cssClass="form-horizontal">
				<spring:bind path="login">
					<div class="form-group ${status.error ? 'has-error' : '' }">
						<label class="control-label col-md-2" for="login">Usuario:</label>
						<div class="col-md-10">
							<form:input id="login" cssClass="form-control" path="login"
								placeholder="Usuario" required="required" />
							<c:if test="${status.error}">
								<span class="text-danger">${status.errorMessage}</span>
							</c:if>
						</div>
					</div>
				</spring:bind>
				
				<spring:bind path="password">
					<div class="form-group ${status.error ? 'has-error' : '' }">
						<label class="control-label col-md-2" for="password">Contraseña:</label>
						<div class="col-md-10">
							<form:input id="password" cssClass="form-control" path="password"
								placeholder="Contraseña" required="required"
								 />
							<c:if test="${status.error}">
								<span class="text-danger">${status.errorMessage}</span>
							</c:if>
						</div>
					</div>
				</spring:bind>
				
			<div class="form-group">
				<div class="col-md-offset-2 col-md-5">
				 	<a class="btn btn-primary" role="button" href='<c:url value="/usuarios/" />' title="Volver">Volver</a>
				</div>
				<div class="col-md-5">
					<button type="submit" class="btn btn-success">Guardar</button>
				</div>
			</div>
				
		</form:form>

	</div>
	</tiles:putAttribute>
</tiles:insertDefinition>
</div>
