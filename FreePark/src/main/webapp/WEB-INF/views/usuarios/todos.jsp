<%@ include file="/WEB-INF/views/templates/layout/tags.jsp"%>
<%@ page session="false"%>
<div class="container" style="margin-top: 50px;">
	<tiles:insertDefinition name="defaultTemplate">
		<tiles:putAttribute name="mensajes"
			value="/WEB-INF/views/templates/page/mensajes.jsp" />
		<tiles:putAttribute name="body">
		<h1>Opciones de Administracion</h1>
		<div>Todos los Usuarios</div>
		<div>${usuario}</div>
	</tiles:putAttribute>
</tiles:insertDefinition>
</div>