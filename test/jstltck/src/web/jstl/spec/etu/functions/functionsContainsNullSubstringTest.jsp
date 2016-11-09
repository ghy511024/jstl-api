<%--
   Copyright 2003 Sun Microsystems, Inc.  All rights reserved.
   SUN PROPRIETARY/CONFIDENTIAL.  Use is subject license terms.
--%>

<%@ page contentType="text/plain" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
    <c:when test="${fn:contains('string', null)}">
        Test PASSED
    </c:when>
    <c:otherwise>
        Test FAILED.  Expected fn:contains('string', null) to return TRUE.
    </c:otherwise>
</c:choose>
