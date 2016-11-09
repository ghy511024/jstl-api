<%--
   Copyright 2003 Sun Microsystems, Inc.  All rights reserved.
   SUN PROPRIETARY/CONFIDENTIAL.  Use is subject license terms.
--%>

<%@ page contentType="text/plain" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
    <c:when test="${'' == fn:substringBefore(null, 'sub')}">
        Test PASSED
    </c:when>
    <c:otherwise>
        Test FAILED.  Expected fn:substringBefore(null, 'sub') to return
        ''.  Actual return value: ${fn:substringBefore(null, 'sub')}
    </c:otherwise>
</c:choose>
