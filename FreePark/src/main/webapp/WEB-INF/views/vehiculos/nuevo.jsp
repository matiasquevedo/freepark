<%@ include file="/WEB-INF/views/templates/layout/tags.jsp"%>
<%@ page session="false"%>
<div class="container" style="margin-top: 50px;">
	<tiles:insertDefinition name="defaultTemplate">
		<tiles:putAttribute name="mensajes"
			value="/WEB-INF/views/templates/page/mensajes.jsp" />
		<tiles:putAttribute name="body">
			<h1>Opciones de Administracion</h1>
			<h2>Vehiculo Nuevo</h2>
			<form:form method="POST" modelAttribute="vehiculo"
				cssClass="form-horizontal">
				<spring:bind path="patente">
					<div class="form-group ${status.error ? 'has-error' : '' }">
						<label class="control-label col-md-2" for="patente">
							Patente: </label>
						<form:input path="patente" />
						<c:if test="${status.error}">
							<span class="text-danger">${status.errorMessage}</span>
						</c:if>
					</div>
				</spring:bind>
				<spring:bind path="marca">
					<div class="form-group ${status.error ? 'has-error' : '' }">
						<label class="control-label col-md-2" for="marca">
							Marca: </label>
						<form:input path="marca" />
						<c:if test="${status.error}">
							<span class="text-danger">${status.errorMessage}</span>
						</c:if>
					</div>
				</spring:bind>
				<spring:bind path="modelo">
					<div class="form-group ${status.error ? 'has-error' : '' }">
						<label class="control-label col-md-2" for="modelo">
							Modelo: </label>
						<form:input path="modelo" />
						<c:if test="${status.error}">
							<span class="text-danger">${status.errorMessage}</span>
						</c:if>
					</div>
				</spring:bind>
				<button type="submit" class="btn btn-success">Guardar</button>
			</form:form>
		</tiles:putAttribute>
	</tiles:insertDefinition>
</div>
