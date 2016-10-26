<%@ include file="/WEB-INF/views/templates/layout/tags.jsp"%>
<%@ page session="false"%>
<div class="container" style="margin-top: 50px;">
	<tiles:insertDefinition name="defaultTemplate">
		<tiles:putAttribute name="mensajes"
			value="/WEB-INF/views/templates/page/mensajes.jsp" />
		<tiles:putAttribute name="body">
			<h1>Opciones de Administracion</h1>
			<h2>Playa Nuevo</h2>
			<form:form method="POST" modelAttribute="playa"
				cssClass="form-horizontal">
				<spring:bind path="nombre">
					<div class="form-group ${status.error ? 'has-error' : '' }">
						<label class="control-label col-md-2" for="nombre">
							Nombre: </label>
						<form:input path="nombre" />
						<c:if test="${status.error}">
							<span class="text-danger">${status.errorMessage}</span>
						</c:if>
					</div>
				</spring:bind>
				<spring:bind path="latitud">
					<div class="form-group ${status.error ? 'has-error' : '' }">
						<label class="control-label col-md-2" for="nombre">
							Latitud: </label>
						<form:input path="latitud" />
						<c:if test="${status.error}">
							<span class="text-danger">${status.errorMessage}</span>
						</c:if>
					</div>
				</spring:bind>
				<spring:bind path="longitud">
					<div class="form-group ${status.error ? 'has-error' : '' }">
						<label class="control-label col-md-2" for="nombre">
							Longitud: </label>
						<form:input path="longitud" />
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
