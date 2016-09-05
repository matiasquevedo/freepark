<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<tiles:importAttribute name="stylesheets"/>
<c:forEach var="css" items="${stylesheets}">
        <link href="<c:url value="${css}"/>" rel="stylesheet" type="text/css">
</c:forEach>