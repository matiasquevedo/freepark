<%@ include file="/WEB-INF/views/templates/layout/tags.jsp"%>
<%@ page session="false"%>
<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="mensajes"
		value="/WEB-INF/views/templates/page/mensajes.jsp" />
	<tiles:putAttribute name="body">
		<h1>Opciones de Administracion</h1>
		<div>Usuarios</div>
		<div><c:out value="${u}" /></div>
	</tiles:putAttribute>
</tiles:insertDefinition>
