<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/templates/layout/tags.jsp"%>
<%@ page session="false"%>
<tiles:insertDefinition name="formularioGMaps">
	<tiles:putAttribute name="body">
		<div class="container" style="margin-top: 60px;">
			<h1>Nueva Playa</h1>
			<div class="panel panel-default">
				<div class="panel-heading">Formulario</div>
				<div class="panel-body">
					<form:form method="POST" id="form" modelAttribute="playa"
						role="form" cssClass="form-horizontal">
						<spring:bind path="nombre">
							<div class="form-group ${status.error ? 'has-error' : '' }">
								<label class="control-label col-md-2" for="nombre">Nombre:</label>
								<div class="col-md-10">
									<form:input id="nombre" cssClass="form-control" path="nombre"
										placeholder="Nombre" data-bv-notempty="true"
										data-bv-notempty-message="El nombre no puede estar vacio" />
									<c:if test="${status.error}">
										<span class="text-danger">${status.errorMessage}</span>
									</c:if>
								</div>
							</div>
						</spring:bind>
						<spring:bind path="latitud">
							<div class="form-group ${status.error ? 'has-error' : '' }">
								<label class="control-label col-md-2" for="latitud">Latitud:</label>
								<div class="col-md-10">
									<form:input id="latitud" cssClass="form-control" path="latitud"
										placeholder="Latitud" data-bv-notempty="true"
										data-bv-notempty-message="Latitud no puede estar vacia" />
									<c:if test="${status.error}">
										<span class="text-danger">${status.errorMessage}</span>
									</c:if>
								</div>
							</div>
						</spring:bind>
						<spring:bind path="longitud">
							<div class="form-group ${status.error ? 'has-error' : '' }">
								<label class="control-label col-md-2" for="nombre">Longitud:</label>
								<div class="col-md-10">
									<form:input id="longitud" cssClass="form-control"
										path="longitud" placeholder="Longitud" data-bv-notempty="true"
										data-bv-notempty-message="Latitud no puede estar vacia" />
									<c:if test="${status.error}">
										<span class="text-danger">${status.errorMessage}</span>
									</c:if>
								</div>
							</div>
						</spring:bind>

						<div class="form-group">
							<div class="col-md-offset-2 col-md-5">
								<a class="btn btn-primary" role="button"
									href='<c:url value="/backend/playas/" />' title="Volver">Volver</a>
							</div>
							<div class="col-md-5">
								<button type="submit" class="btn btn-success">Guardar</button>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</tiles:putAttribute>
</tiles:insertDefinition>
