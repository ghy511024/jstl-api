<%--
 Copyright 2003 Sun Microsystems, Inc. All rights reserved.
 SUN PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<%@ taglib prefix="tck" uri="http://java.sun.com/jstltck/jstltck-util" %>
<%@ page import="javax.sql.*, java.util.*" %>

<tck:test testName="positiveResultGetRowsUpperCaseTest">

  <c:set var='idNum' value='${1}' />
  <c:set var='firstName' value='Lance' />
  <c:set var='lastName' value='Andersen' />

  <!-- Validate the access to Result.getRows via a column name is case
          insensitive testing using Upper Case -->

   <h1>Validate the access to Result.getRows via a column name is case
          insensitive testing using Upper Case via RT</h1>
   <p>

   <sql:query var="resultSet2"
                 dataSource='<%=(DataSource) pageContext.getAttribute("jstlDS", PageContext.APPLICATION_SCOPE) %>'
                 sql='<%=((Properties)pageContext.getAttribute("sqlProps",PageContext.APPLICATION_SCOPE)).getProperty("Select_Jstl_Tab1_OneRow_Query") %>' />

  <c:set var='rows2'  value='${resultSet2.rows}'/>
  <c:set var='column2' value='${resultSet2.columnNames}' />

  <%-- Convert the column names to Upper Case to validate case insensitivity --%>
  <%
     String columns2 [] = (String[])pageContext.getAttribute("column2");
     pageContext.setAttribute("IDNUM2", columns2[0].toUpperCase());
     pageContext.setAttribute("FIRSTNAME2", columns2[1].toUpperCase());
     pageContext.setAttribute("LASTNAME2", columns2[2].toUpperCase());


   %>

   <c:choose>
      <c:when test="${rows2[0][IDNUM2] == idNum &&
                      rows2[0][FIRSTNAME2] == firstName &&
                      rows2[0][LASTNAME2] == lastName}">
         Successfully accessed each column value using the column name
         returned from Result.getColumnNames().
         <p>
      </c:when>
      <c:otherwise>
         <h2>Error</h2> Could not access the column values using the column
         names returned from Result.getColumnNames(). The expected values were
         <strong><c:out value='${idNum}' />, <c:out value='${firstName}' />,
         <c:out value='${lastName}' /></strong>.  The values returned were <strong>
         <c:out value='${rows2[0][column2[0]]}' />, <c:out value='${rows2[0][column2[1]]}' />,
         <c:out value='${rows2[0][column2[2]]}' /></strong>.
         <p>
      </c:otherwise>
   </c:choose>

</tck:test>
