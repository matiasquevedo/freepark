<%@ include file="/WEB-INF/views/templates/layout/tags.jsp"%>
<%@ page session="false"%>

<div class="container panel panel-primary" style="margin-top: 50px;">
	<tiles:insertDefinition name="defaultTemplate">
		<tiles:putAttribute name="mensajes"
			value="/WEB-INF/views/templates/page/mensajes.jsp" />
		<tiles:putAttribute name="body">
			<center><h1>Administracion de Playas</h1></center>
			
			<div class="col-md-6">
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
								<label class="control-label col-md-2" for="latitud">
									Latitud: </label>
								<form:input path="latitud" />
								<c:if test="${status.error}">
									<span class="text-danger">${status.errorMessage}</span>
								</c:if>
							</div>
						</spring:bind>
						<spring:bind path="longitud">
							<div class="form-group ${status.error ? 'has-error' : '' }">
								<label class="control-label col-md-2" for="longitud">
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
				
				<div class="col-md-6 panel panel-default">
					
						<h3 class="panel">Estacionamientos</h3>
						
							<div class="row">
								
								<form:form method="POST" modelAttribute="estacionamiento" cssClass="form-horizontal">
									<div class="col-md-10">
										<spring:bind path="estado">
											<div class="col-md-6 form-group ${status.error ? 'has-error' : '' }">
												<label class="control-label col-md-6" for="estado">
													Estado: </label>
												<div class"row">
													<form:radiobutton path="estado" value="1" />Disponible
												</div>
												<div class"row">
													<form:radiobutton path="estado" value="0"/>Reservado
												</div>
												<c:if test="${status.error}">
													<span class="text-danger">${status.errorMessage}</span>
												</c:if>
											</div>
										</spring:bind>
									
										<spring:bind path="techo">
											<div class="col-md-6 form-group ${status.error ? 'has-error' : '' }">
												<label class="control-label col-md-6" for="techo">
													Techo: </label>
												<form:checkbox path="techo" />
												<c:if test="${status.error}">
													<span class="text-danger">${status.errorMessage}</span>
												</c:if>
											</div>
										</spring:bind>
									</div>
									
									<div class="col-md-2">
										<button type="submit" class="btn glyphicon glyphicon-plus"></button>
									</div>
									</form:form>
								</div>
								
								<div class="row well">
									<div class="col-md-2">ID</div>
									<div class="col-md-5">ESTADO</div>
									<div class="col-md-5">TECHO</div>
								</div>
								<c:forEach var="estacionamientos" items="${estacionamientos}">
									<div class="row well">
										<div class="col-md-2">${estacionamientos.id}</div>
										<div class="col-md-5">${estacionamientos.id}</div>
										<div class="col-md-5">${estacionamientos.id}</div>
									</div>
								</c:forEach>
							
				</div>
			
		</tiles:putAttribute>
	</tiles:insertDefinition>
</div>
