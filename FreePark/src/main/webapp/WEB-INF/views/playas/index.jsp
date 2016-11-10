<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/templates/layout/tags.jsp"%>
<%@ page session="false"%>

<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">
		<div class="container" style="margin-top: 20px; padding-top: 20px;">
			<div class="row">
				<div class="col-md-12 col-gl-12 page-header">
					<h2>Playas de Estacionamiento</h2>
				</div>
			</div>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th class="col-md-4"><strong>Nombre</strong></th>
						<th class="col-md-3"><strong>Latitud</strong></th>
						<th class="col-md-3"><strong>Longitud</strong></th>
						<th class="col-md-2"><strong>Acciones</strong></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${playas}" var="playa">
						<tr>
							<td class="col-md-4"><a
								href="<c:url value="/backend/playas/${playa.id}/editar" />"
								title="editar"><c:out value="${playa.nombre}" /></a></td>
							<td class="col-md-3"><c:out value="${playa.latitud}" /></td>
							<td class="col-md-3"><c:out value="${playa.longitud}" /></td>
							<td class="col-md-2">
								<div class="btn-group">
									<button type="button"
										class="btn btn-sm btn-default dropdown-toggle"
										data-toggle="dropdown">
										<i class="glyphicon glyphicon-cog"></i> <span class="caret"></span>
									</button>
									<ul class="dropdown-menu" role="menu">
										<li><a
											href="<c:url value="/backend/playas/${playa.id}/editar" />"><i
												class="glyphicon glyphicon-edit"></i> Editar</a></li>
										<li><a
											href="<c:url value="/backend/playas/${playa.id}/estacionamientos" />"><i
												class="glyphicon glyphicon-th"></i> Estacionamientos</a></li>
										<li><a
											href="<c:url value="/backend/playas/${playa.id}/borrar" />"><i
												class="glyphicon glyphicon-remove"></i> Borrar</a></li>
									</ul>
								</div>
							</td>
						</tr>
					</c:forEach>
					
				</tbody>
			</table>
			<div class="col-md-12 text-right">
				<a href="<c:url value="/backend/playas/nuevo" />" class="btn btn-primary"
					title="Nueva Playa">Crear nueva</a>
			</div>
		</div>
	</tiles:putAttribute>
</tiles:insertDefinition>
