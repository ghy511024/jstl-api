<%-- 
 Copyright 2003 Sun Micorsystems, Inc. All rights reserved.
 SUN PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tck" uri="http://java.sun.com/jstltck/jstltck-util" %>
<%@ page import="java.util.TimeZone,java.util.Date" %>
<tck:test testName="positiveTimezoneValueTest">
    <%
        TimeZone tz = TimeZone.getTimeZone("PST");
        pageContext.setAttribute("tz", tz);
        Date date = new Date(883192294202L);
        pageContext.setAttribute("dte", date);
    %>
    <c:set var="mtz" value="PST"/>

    <!-- Behavioral test of value attribute -->
    <!-- Timezone object -->
    <fmt:timeZone value='<%= (TimeZone) pageContext.getAttribute("tz") %>'>
        <fmt:formatDate type="both" dateStyle="full" timeStyle="full" value="${dte}"/>
    </fmt:timeZone>
    <!-- Timezone as a String -->
    <fmt:timeZone value='<%= (String) pageContext.getAttribute("mtz") %>'>
        <fmt:formatDate type="both" dateStyle="full" timeStyle="full" value="${dte}"/>
    </fmt:timeZone>
    <fmt:timeZone value="GMT-1:00">
        <fmt:formatDate type="both" dateStyle="full" timeStyle="full" value="${dte}"/>
    </fmt:timeZone>
</tck:test>
