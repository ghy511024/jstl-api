<%--
 Copyright 2003 Sun Microsystems, Inc. All rights reserved.
 SUN PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
--%>

<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tck" uri="http://java.sun.com/jstltck/jstltck-util" %>
<%@ page import="javax.sql.*, java.util.*" %>

   <tck:test testName="negativeUpdateBodyContentTest">

   <!-- Validate the sql:update action throws a JspException
            when an invalid a SQL statement is provided
            as body content -->

   <h1>Validate sql:update action throws JspException when an invalid SQL statement
   is passed as body content </h1>

     <tck:catch var="e2" exception= "javax.servlet.jsp.JspException"
             checkRootCause='true'
              exceptionText='<%=((Properties)pageContext.getAttribute("sqlProps",PageContext.APPLICATION_SCOPE)).getProperty("Invalid_SQL_Query") %>' >

      <sql:update var="updateCount2"
                     dataSource='<%=(DataSource) pageContext.getAttribute("jstlDS", PageContext.APPLICATION_SCOPE) %>' >
           <c:out value="${sqlProps.Invalid_SQL_Query}" />
      </sql:update>
   </tck:catch>

   <c:out value="${e2}" escapeXml="false"/>


</tck:test>
