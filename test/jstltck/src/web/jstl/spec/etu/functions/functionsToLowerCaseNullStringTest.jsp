<%--
   Copyright 2003 Sun Microsystems, Inc.  All rights reserved.
   SUN PROPRIETARY/CONFIDENTIAL.  Use is subject license terms.
--%>

<%@ page contentType="text/plain" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
    <c:when test="${'' == fn:toLowerCase(null)}">
        Test PASSED
    </c:when>
    <c:otherwise>
        Test FAILED.  Expected the result of fn:toLowerCase(null) to be
        ''.  Actual result received: ${fn:toLowerCase(null)}
    </c:otherwise>
</c:choose>
