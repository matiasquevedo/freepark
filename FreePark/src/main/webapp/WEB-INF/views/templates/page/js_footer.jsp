<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<tiles:importAttribute name="javascripts"/>
<!-- javascripts -->
<c:forEach var="script" items="${javascripts}">
	<script src="<c:url value="${script}"/>"></script>
</c:forEach>