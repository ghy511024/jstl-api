<%-- 
 Copyright 2003 Sun Micorsystems, Inc. All rights reserved.
 SUN PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fmt_rt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="tck" uri="http://java.sun.com/jstltck/jstltck-util" %>
<tck:test testName="positivePDValueTest">
    <c:set var="dte" value="Nov 21, 2000"/>
    <fmt:setLocale value="en_US"/>
    <fmt:setTimeZone value="EST"/>
    <!-- EL: Validate the the action can properly parse a date
             provided as a dynamic or static value. -->
    <fmt:parseDate value="${dte}" var="e1"/>
    <fmt:parseDate value="Nov 21, 2000" var="e2"/>
    <fmt:formatDate value="${e1}"/><br>
    <fmt:formatDate value="${e2}"/><br>

    <!-- RT: Validate the the action can properly parse a date
             provided as a dynamic or static value. -->
    <fmt_rt:parseDate value='<%= (String) pageContext.getAttribute("dte") %>' var="r1"/>
    <fmt_rt:parseDate value="Nov 21, 2000" var="r2"/>
    <fmt:formatDate value="${r1}"/>
    <fmt:formatDate value="${r2}"/>
</tck:test>
