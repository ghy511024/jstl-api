<%--
 Copyright 2003 Sun Microsystems, Inc. All rights reserved.
 SUN PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<%@ taglib prefix="tck" uri="http://java.sun.com/jstltck/jstltck-util" %>
<%@ page import="javax.sql.*, java.util.*" %>

<tck:test testName="positiveSetDataSourceQueryNoVarAttributeDataSourceTest">

   <!-- Validate sql:query and sql:setDataSource actions by specifying a
        DataSource Object for javax.servlet.jsp.jstl.sql.dataSource-->

   <h1>Validate sql:query and sql:setDataSource actions by specifying a
       DataSource object for javax.servlet.jsp.jstl.sql.dataSource </h1>
   <p>
 <c:catch var="ex3"  >
      <sql:setDataSource
          dataSource='<%=(DataSource) pageContext.getAttribute("jstlDS", PageContext.APPLICATION_SCOPE) %>'
          />
  </c:catch>

   <c:choose>
      <c:when test="${!empty ex3}">
         <H2>ERROR:</H2>
         Could not create a dataSource using  a <strong>DataSource Object
         </strong> for javax.servlet.jsp.jstl.sql.dataSource! The Exception that
         was raised is: <strong><c:out value='${ex3}'  escapeXml='false' /></strong>.
         <p>
      </c:when>
      <c:otherwise>
         Successfully created a DataSource.
         <p>
      </c:otherwise>
   </c:choose>


  <c:catch var="ex4"  >
    <sql:query var="resultSet2" >

         <c:out value="${sqlProps.Simple_Select_Query}" />
      </sql:query>

   </c:catch>

   <c:choose>
      <c:when test="${!empty ex4}">
         <H2>ERROR:</H2>
         Could not execute the query <strong><c:out value="${sqlProps.Simple_Select_Query}" />
         </strong> when using  a<strong>DataSource Object</strong> for
         javax.servlet.jsp.jstl.sql.dataSource! The Exception that was raised is:
         <strong><c:out value='${ex2}' escapeXml='false' /></strong>.
         <p>
      </c:when>
      <c:otherwise>
         Successfully executed the query when javax.servlet.jsp.jstl.sql.dataSource
         was provided a DataSource Object.
         <p>
      </c:otherwise>
   </c:choose>

</tck:test>
