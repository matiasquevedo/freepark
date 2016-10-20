<%@ include file="/WEB-INF/views/templates/layout/tags.jsp"%>
<%@ page session="false"%>

<div class="container panel panel-primary" style="margin-top: 50px;">
	<tiles:insertDefinition name="defaultTemplate">
		<tiles:putAttribute name="mensajes"
			value="/WEB-INF/views/templates/page/mensajes.jsp" />
		<tiles:putAttribute name="body">
			<center>
				<h1>Administracion de Playas</h1>
			</center>

			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					<!-- Descripcion de Playa -->
					<form:form method="POST" modelAttribute="playa"
						cssClass="form-horizontal">
						<spring:bind path="id">
							<div class="form-group ${status.error ? 'has-error' : '' }">
								<form:hidden path="id" />
								<c:if test="${status.error}">
									<span class="text-danger">${status.errorMessage}</span>
								</c:if>
							</div>
						</spring:bind>
						<spring:bind path="nombre">
							<div class="form-group ${status.error ? 'has-error' : '' }">
								<label class="control-label" for="nombre">
									Nombre: </label>
								<form:input path="nombre" />
								<c:if test="${status.error}">
									<span class="text-danger">${status.errorMessage}</span>
								</c:if>
							</div>
						</spring:bind>
						<spring:bind path="latitud">
							<div class="form-group ${status.error ? 'has-error' : '' }">
								<label class="control-label" for="latitud">
									Latitud: </label>
								<form:input path="latitud" />
								<c:if test="${status.error}">
									<span class="text-danger">${status.errorMessage}</span>
								</c:if>
							</div>
						</spring:bind>
						<spring:bind path="longitud">
							<div class="form-group ${status.error ? 'has-error' : '' }">
								<label class="control-label" for="longitud">
									Longitud: </label>
								<form:input path="longitud" />
								<c:if test="${status.error}">
									<span class="text-danger">${status.errorMessage}</span>
								</c:if>
							</div>
						</spring:bind>
						<button type="submit" class="btn btn-success">Guardar</button>
					</form:form>
				</div>
			</div>

			<center>
				<h3>Estacionamientos</h3>
			</center>

			<div class="row">
				<form:form method="POST" modelAttribute="estacionamiento"
					cssClass="form-horizontal col-md-6 col-md-offset-3 well">
					<div class="col-md-10">
						<spring:bind path="estado">
							<div
								class="col-md-6 form-group ${status.error ? 'has-error' : '' }">
								<label class="control-label col-md-6" for="estado">
									Estado: </label>
								<div class="row">
									<form:radiobutton path="estado" value="1" />
									Disponible
								</div>
								<div class="row">
									<form:radiobutton path="estado" value="0" />
									Reservado
								</div>
								<c:if test="${status.error}">
									<span class="text-danger">${status.errorMessage}</span>
								</c:if>
							</div>
						</spring:bind>

						<spring:bind path="techo">
							<div
								class="col-md-6 form-group ${status.error ? 'has-error' : '' }">
								<label class="control-label col-md-6" for="techo">
									Techo: </label>
								<form:checkbox path="techo" />
								<c:if test="${status.error}">
									<span class="text-danger">${status.errorMessage}</span>
								</c:if>
							</div>
						</spring:bind>

						<div class="col-md-2">
							<button type="submit" class="btn glyphicon glyphicon-plus"></button>
						</div>
					</div>
				</form:form>
			</div>

			<div class="row well">
				<div class="col-md-2">ID</div>
				<div class="col-md-5">ESTADO</div>
				<div class="col-md-5">TECHO</div>
			</div>
			<c:forEach var="relEstacionamiento" items="${playa.estacionamientos}">
				<div class="row well">
					<div class="col-md-2">
						<a href="${relEstacionamiento.id}">${relEstacionamiento.referencia}</a>
					</div>
					<div class="col-md-5">${relEstacionamiento.estado}</div>
					<div class="col-md-5">${relEstacionamiento.techo}</div>
				</div>
			</c:forEach>
</div>


</tiles:putAttribute>
</tiles:insertDefinition>