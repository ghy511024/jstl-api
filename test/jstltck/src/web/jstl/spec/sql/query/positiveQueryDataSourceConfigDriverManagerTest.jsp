<%--
 Copyright 2003 Sun Microsystems, Inc. All rights reserved.
 SUN PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<%@ taglib prefix="tck" uri="http://java.sun.com/jstltck/jstltck-util" %>
<%@ page import="javax.sql.*, java.util.*" %>


<tck:test testName="positiveQueryDataSourceConfigDriverManagerTest">

   <c:set var='driverInfo'
          value="${header['jstl.db.url']},${header['jstl.db.driver']},${header['jstl.db.user']},${header['jstl.db.password']}" />
  <tck:config configVar="datasource" op="set"
               value='<%= (String) pageContext.getAttribute("driverInfo", PageContext.PAGE_SCOPE) %>'/>

   <!-- Validate sql:query action  by specifying a String
       with DriverManager parameters to javax.servlet.jsp.jstl.sql.dataSource -->

   <h1>Validate sql:query by specifying a String with DriverManager
       parameters to javax.servlet.jsp.jstl.sql.dataSource </h1>
   <p>


  <c:catch var="ex4"  >
    <sql:query var="resultSet2"  >
            <c:out value="${sqlProps.Simple_Select_Query}" />
    </sql:query>
  </c:catch>

   <c:choose>
      <c:when test="${!empty ex4}">
         <H2>ERROR:</H2>
         Could not execute the query <strong><c:out value="${sqlProps.Simple_Select_Query}" />
         </strong> when using <strong><c:out value='${driverInfo}'/></strong> for
         javax.servlet.jsp.jstl.sql.dataSource! The Exception that was raised is:
         <strong><c:out value='${ex4}' escapeXml='false' /></strong>.
         <p>
      </c:when>
      <c:otherwise>
         Successfully executed the query when javax.servlet.jsp.jstl.sql.dataSource
          was provided DriverManager parameters.
         <p>
      </c:otherwise>
   </c:choose>


</tck:test>
