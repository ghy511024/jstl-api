<%-- 
 Copyright 2003 Sun Micorsystems, Inc. All rights reserved.
 SUN PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tck" uri="http://java.sun.com/jstltck/jstltck-util" %>
<tck:test testName="positiveDefaultEncodingTest">
    <c:remove var="javax.servlet.jsp.jstl.fmt.request.charset"/>

   <!-- No content-type and no scoped variable, so the default
             of iso-8859-1 will be used -->
    <fmt:requestEncoding/>
    <%= request.getCharacterEncoding().toLowerCase() %>
    
</tck:test>
