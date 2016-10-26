<%@ include file="/WEB-INF/views/templates/layout/tags.jsp"%>
<%@ page session="false"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript">
	jQuery(document)
			.ready(
					function() {
						$("#deleteEst").click(function(){
							eliminarEst();
						});
						
						$("#agregarest")
								.submit(
										function(event) {

											event.preventDefault();

											var estacionamiento = {
												"referencia" : $("#referencia")
														.val(),
												"estado" : $("#estado").val(),
												"techo" : $("#techo").val(),
												"playa" : {
													"id" : $("#id").val(),
													"nombre" : $("#nombre")
															.val(),
													"latitud" : $("#latitud")
															.val(),
													"longitud" : $("#longitud")
															.val()
												}
											}

											$.ajax({
														type : 'POST',
														url : '${pageContext.request.contextPath}/estacionamientos/nuevo.json',
														contentType : 'application/json; charset=utf-8',
														dataType : 'json',
														data : JSON
																.stringify(estacionamiento),
														success : function(data) {
			
															alert(data)
															ActEstacionamientos(estacionamiento);

														}
													})
										})
					})

	function ActEstacionamientos(estacionamiento) {
		$
				.ajax({
					url : '${pageContext.request.contextPath}/estacionamientos/listbyplaya.json/'
							+ estacionamiento["playa"]["id"],
					type : 'GET',
					contentType : "application/json",
					success : function(data) {

						$("table tbody").empty();
						$.each(
										data,
										function(key, value) {

											$("table tbody")
													.append(
															"<tr><td id='idEst' style='display:none'>"
																	+ value["id"]
																	+ "</td><th id='refEst' class='col-md-2'>"
																	+ value["referencia"]
																	+ "</th><td id=estadodEst' class='col-md-5'>"
																	+ value["estado"]
																	+ "</td><td id='techoEst' class='col-md-5'>"
																	+ value["techo"]
																	+ "</td><td id='deleteEst' class='col-md-1'><span class='glyphicon glyphicon-trash'></span></td></tr>")
										})

					}
				})

	}

	function eliminarEst() {
		var estacionamiento = {
			"id" : $("#id").val(),
			"referencia" : $("#refEst").val(),
			"estado" : $("#estadoEst").val(),
			"techo" : $("#techoEst").val(),
			"playa" : {
				"id" : $("#id").val(),
				"nombre" : $("#nombre").val(),
				"latitud" : $("#latitud").val(),
				"longitud" : $("#longitud").val()
				}
			}
		$.ajax({
					type : 'POST',
					url : '${pageContext.request.contextPath}/estacionamientos/eliminar.json',
					contentType : 'application/json; charset=utf-8',
					dataType : 'json',
					data : JSON.stringify(estacionamiento),
					success : function(data) {
						alert("DELETEADO")
					}
				})
	}
</script>
<div class="container" style="margin-top: 50px;">
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
								<label class="control-label" for="nombre">Nombre:</label>
								<form:input class="form-control" path="nombre" />
								<c:if test="${status.error}">
									<span class="text-danger">${status.errorMessage}</span>
								</c:if>
							</div>
						</spring:bind>
						<spring:bind path="latitud">
							<div class="form-group ${status.error ? 'has-error' : '' }">
								<label class="control-label" for="latitud"> Latitud: </label>
								<div class="input-group">
									<span class="input-group-addon">º</span>
									<form:input class="form-control" path="latitud" />
								</div>
								<c:if test="${status.error}">
									<span class="text-danger">${status.errorMessage}</span>
								</c:if>
							</div>
						</spring:bind>
						<spring:bind path="longitud">
							<div class="form-group ${status.error ? 'has-error' : '' }">
								<label class="control-label" for="longitud"> Longitud: </label>
								<div class="input-group">
									<span class="input-group-addon">º</span>
									<form:input class="form-control" path="longitud" />
								</div>
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
				<h2>Estacionamientos</h2>
			</center>

			<div class="row">
				<div class="col-md-3">
					<form:form id="agregarest" cssClass="form-horizontal">
						<div class="form-group">
							<label for="referencia" class="control-label">Referencia</label>
							<input class="form-control" id="referencia">
						</div>
						<div class="form-group">
							<label for="estado" class="control-label">Estado</label> <input
								class="form-control" id="estado">
						</div>
						<div class="form-group">
							<label for="techo" class="control-label">Techo</label> <input
								class="form-control" id="techo">
						</div>
						<button type="submit" class="btn glyphicon glyphicon-plus"></button>
					</form:form>
				</div>
			</div>

			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th class="col-md-2">REFERENCIA</th>
						<th class="col-md-5">ESTADO</th>
						<th class="col-md-5">TECHO</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="relEstacionamiento"
						items="${playa.estacionamientos}">
						<tr>
							<td id="idEst" style='display: none'>${relEstacionamiento.referencia}</td>
							<th id="refEst" class="col-md-1">${relEstacionamiento.referencia}</th>
							<td id="estadoEst" class="col-md-5">${relEstacionamiento.estado}</td>
							<td id="techoEst" class="col-md-5">${relEstacionamiento.techo}</td>
							<td id="deleteEst" class="col-md-1"><span
								class="glyphicon glyphicon-trash"></span></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</tiles:putAttribute>
	</tiles:insertDefinition>
</div>
