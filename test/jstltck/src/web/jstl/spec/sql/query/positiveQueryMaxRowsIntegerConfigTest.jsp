<%--
 Copyright 2003 Sun Microsystems, Inc. All rights reserved.
 SUN PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<%@ taglib prefix="tck" uri="http://java.sun.com/jstltck/jstltck-util" %>
<%@ page import="javax.sql.*, java.util.*" %>

<tck:test testName="positiveQueryMaxRowsIntegerConfigTest">

   <%
      pageContext.setAttribute("configMaxRowsLimit", new Integer("5"));
       pageContext.setAttribute("configNoMaxRowsLimit", new Integer("-1"));
      pageContext.setAttribute("maxRowsLimit", new Integer("2"));
   %>

   <%-- configure javax.servlet.jsp.jstl.sql.maxRows to using an Integer configMaxRowsLimit--%>
   <tck:config configVar="maxrows" op="set"
               value='<%= (Integer) pageContext.getAttribute("configMaxRowsLimit", PageContext.PAGE_SCOPE) %>'/>

   <h1>Validating sql:query action and javax.servlet.jsp.jstl.sql.maxRows config
   variable passed as an Integer </h1>
   <p>

   <!-- Validate that a sql:query action will return
            the number of rows specified by the javax.servlet.jsp.jstl.sql.maxRows
            config variable  when specified as an Integer  -->

     <%-- configure javax.servlet.jsp.jstl.sql.maxRows to using an Integer configMaxRowsLimit--%>
   <tck:config configVar="maxrows" op="set"
               value='<%= (Integer) pageContext.getAttribute("configMaxRowsLimit", PageContext.PAGE_SCOPE) %>'/>


   <sql:query var="resultSet4"
                 dataSource='<%=(DataSource) pageContext.getAttribute("jstlDS", PageContext.APPLICATION_SCOPE) %>'  >
       <%=((Properties)pageContext.getAttribute("sqlProps",PageContext.APPLICATION_SCOPE)).getProperty("Simple_Select_Query") %>
   </sql:query>

   <c:choose>
      <c:when test="${resultSet4.rowCount != configMaxRowsLimit}">
         <H2>ERROR:</H2>
         The <strong>javax.servlet.jsp.jstl.sql.maxRows</strong> config variable
         was set to <strong><c:out value="${configMaxRowsLimit}" /></strong>.
         The actual number of rows returned was
          <strong>"<c:out value="${resultSet4.rowCount}" />"</strong>.
         <p>
      </c:when>
      <c:otherwise>
         The <strong>javax.servlet.jsp.jstl.sql.maxRows</strong> config
         variable was set to <strong><c:out value="${configMaxRowsLimit}" />
         </strong> and a Result object that contained this row count was
         returned as expected.
         <p>
      </c:otherwise>
   </c:choose>

   <%-- Validate that maxRows Attribute overrides the config value for maxRows --%>

   <sql:query var="resultSet5"
                 dataSource='<%=(DataSource) pageContext.getAttribute("jstlDS", PageContext.APPLICATION_SCOPE) %>'
                 maxRows='<%=((Integer) pageContext.getAttribute("maxRowsLimit")).intValue() %>' >
      <%=((Properties)pageContext.getAttribute("sqlProps",PageContext.APPLICATION_SCOPE)).getProperty("Simple_Select_Query") %>
   </sql:query>


   <c:choose>
      <c:when test="${resultSet5.rowCount != maxRowsLimit}">
         <H2>ERROR:</H2>
         The <strong>maxRows</strong> attribute was set to <strong>
         <c:out value="${maxRowsLimit}" /></strong> and did not overide
         the config value for javax.servlet.jsp.jstl.sql.maxRows which was set to
         <strong> <c:out value="${configMaxRowsLimit}" /></strong>.
         The actual number of rows returned was
          <strong>"<c:out value="${resultSet5.rowCount}" />"</strong>.
         <p>
      </c:when>
      <c:otherwise>
         The maxRows attribute <strong>did override</strong> the config value for <strong>
         javax.servlet.jsp.jstl.sql.maxRows</strong> and a Result object that
         contained  <strong>"<c:out value="${resultSet5.rowCount}" />"</strong>
         rows was returned as expected.
         <p>
      </c:otherwise>
   </c:choose>

    <%-- configure javax.servlet.jsp.jstl.sql.maxRows to have no limit--%>
   <tck:config configVar="maxrows" op="set"
               value='<%= (Integer) pageContext.getAttribute("configNoMaxRowsLimit", PageContext.PAGE_SCOPE) %>'/>

    <sql:query var="resultSet6"
                 dataSource='<%=(DataSource) pageContext.getAttribute("jstlDS", PageContext.APPLICATION_SCOPE) %>'  >
       <%=((Properties)pageContext.getAttribute("sqlProps",PageContext.APPLICATION_SCOPE)).getProperty("Simple_Select_Query") %>
   </sql:query>

   <c:choose>
      <c:when test="${resultSet6.rowCount != JSTL_TAB1_ROWS}">
         <H2>ERROR:</H2>
         The config parameter <strong>javax.servlet.jsp.sql.maxRows</strong>
         was set to <strong><c:out value="${configNoMaxRowsLimit}" /></strong>.
         The expected number of rows <strong>
         "<c:out value="${JSTL_TAB1_ROWS}" />" </strong> was not
         returned. The actual number of rows returned was
         <strong>"<c:out value="${resultSet6.rowCount}" />"</strong>.
         <p>
      </c:when>
      <c:otherwise>
         The config parameter <strong>javax.servlet.jsp.sql.maxRows</strong>
         was set to <strong><c:out value="${configNoMaxRowsLimit}" /></strong>.
         A Result object that contained <strong>
         <c:out value="${JSTL_TAB1_ROWS}" /></strong> rows was returned as
         expected.
         <p>
      </c:otherwise>
   </c:choose>

   <%-- Clear out our  maxRows config variable --%>
   <tck:config configVar="maxrows" op="remove" />

</tck:test>
