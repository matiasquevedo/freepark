<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/templates/layout/tags.jsp"%>
<%@ page session="false"%>
<tiles:insertDefinition name="formulario">
	<tiles:putAttribute name="body">
		<div class="container" style="margin-top: 60px;">
			<h1>
				<c:out value="${playa.nombre}"></c:out>
			</h1>
			<div class="panel panel-default">
				<div class="panel-heading">Estacionamientos</div>
				<div class="panel-body">
					<table class="table table-hover">
						<thead>
							<tr>
								<th class="col-md-3">Referencia</th>
								<th class="col-md-4">Estado</th>
								<th class="col-md-4">Techo</th>
								<th class="col-md-1"></th>
							</tr>
						</thead>
						<tbody>

							<c:forEach var="estacionamiento"
								items="${playa.estacionamientos}">
								<tr>
									<td><c:out value="${estacionamiento.referencia}"></c:out></td>
									<td><c:out value="${estacionamiento.estado}"></c:out></td>
									<td><c:out value="${estacionamiento.techo}"></c:out></td>
									<td><a
										href="<c:url value="/estacionamientos/${estacionamiento.id}/borrar" />"><i
											class="glyphicon glyphicon-remove"></i> </a></td>
								</tr>
							</c:forEach>

							<form:form method="POST" id="form"
								modelAttribute="estacionamiento" role="form"
								cssClass="form-horizontal">
								<tr>
									<td><spring:bind path="referencia">
											<div class="form-group ${status.error ? 'has-error' : '' }">
												<div>
													<form:input cssClass="form-control" path="referencia"
														placeholder="Referencia" data-bv-notempty="true"
														data-bv-notempty-message="La referencia no puede estar vacia" />
													<c:if test="${status.error}">
														<span class="text-danger">${status.errorMessage}</span>
													</c:if>
												</div>
											</div>
										</spring:bind></td>
									<td><spring:bind path="estado">
											<div class="form-group ${status.error ? 'has-error' : '' }">
												<div>
													<form:input placeholder="Estado" cssClass="form-control"
														path="estado" />
													<c:if test="${status.error}">
														<span class="text-danger">${status.errorMessage}</span>
													</c:if>
												</div>
											</div>
										</spring:bind></td>
									<td><spring:bind path="techo">
											<div class="form-group ${status.error ? 'has-error' : '' }">
												<div>
													<form:input placeholder="Techo" cssClass="form-control"
														path="techo" />
													<c:if test="${status.error}">
														<span class="text-danger">${status.errorMessage}</span>
													</c:if>
												</div>
											</div>
										</spring:bind></td>
									<td><button type="submit" class="btn btn-success"
											aria-label="Left Align">
											<span class="glyphicon glyphicon-plus"
												aria-hidden="true"></span>
										</button></td>

								</tr>
							</form:form>
						</tbody>

					</table>

				</div>
			</div>
		</div>
	</tiles:putAttribute>
</tiles:insertDefinition>
