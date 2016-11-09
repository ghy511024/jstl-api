/*
 * Copyright 2007 Sun Microsystems, Inc. All rights reserved.
 * SUN PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 */


package com.sun.ts.tests.jstl.common.wrappers;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.SQLFeatureNotSupportedException;
import javax.sql.DataSource;
import javax.servlet.ServletContext;
import java.util.logging.Logger;

/**
 * A simple class that exposes a DataSource interface,
 */

public class TckDataSourceWrapper implements DataSource {
    
    /**
     * ServletContext
     */
    private ServletContext _context;
    
    /**
     * Driver implementation class
     */
    private String _driverClassName;
    
    /**
     * JDBC Connection URL
     */
    private String _jdbcURL;
    
    /**
     * RDBMS user name
     */
    private String _userName;
    
    /**
     * RDBMS password
     */
    private String _password;
    
    /**
     * Creates a new TckDataSourceWrapper.  The returned
     * Connection will not be wrapped by an instance of
     * TCKConnectionWrapper.
     */
    public TckDataSourceWrapper() {
    }
    
    /**
     * Creates a new TckDataSourceWrapper.  The returned
     * Connection will be wrapped by an instance of 
     * TCKConnectionWrapper.
     *
     * @param ServletContext context to store "log" information
     *                       from TCKConnectionWrapper
     */
    public TckDataSourceWrapper(ServletContext context) {
        _context = context;
    }
    
/* 
 * public methods
 * ========================================================================
 */

    /**
     * Sets the driver implementation class.
     *
     * @param driverClassName driver class
     */
    public void setDriverClassName(String driverClassName) 
	throws ClassNotFoundException, InstantiationException, 
	       IllegalAccessException {

	_driverClassName = driverClassName;
        Class.forName(_driverClassName).newInstance();
    }

    /**
     * Sets the connection URL.
     *
     * @param jdbcURL connection URL
     */
    public void setJdbcURL(String jdbcURL) {
	_jdbcURL = jdbcURL;
    }

    /**
     * Sets the username.
     *
     * @param userName valid database user name
     */
    public void setUserName(String userName) {
	_userName = userName;
    }

    /**
     * Sets the password
     *
     * @param password valid password for the specified user.
     */
    public void setPassword(String password) {
	_password = password;
    }

    /**
     * Returns a Connection using the DriverManager and all
     * set properties.  If the DataSource was created with 
     * a ServletContext, the connection obtained from the
     * DriverManager will be wrapped by an instance
     * of TckConnectionWrapper.
     */
    public Connection getConnection() throws SQLException {
	Connection conn = null;
        TckConnectionWrapper tckconn = null;
        
	if (_userName != null) {
	    conn = DriverManager.getConnection(_jdbcURL, _userName, _password);
            if (_context != null) {
                tckconn = new TckConnectionWrapper(_context, conn);
                return (Connection) tckconn;
            }
	}
	else {
	    conn = DriverManager.getConnection(_jdbcURL);
            if (_context != null) {
                tckconn = new TckConnectionWrapper(_context, conn);
                return (Connection) tckconn;
            }
	}
	return conn;
    }

    /**
     * Always throws a SQLException. Username and password are set
     * in the constructor and can not be changed.
     */
    public Connection getConnection(String username, String password) 
            throws SQLException {
        throw new SQLException();
    }
    
    /**
     * Always throws a SQLException. Not supported.
     */
    public int getLoginTimeout() throws SQLException {
        throw new SQLException();
    }
    
    /**
     * Always throws a SQLException. Not supported.
     */
    public PrintWriter getLogWriter() throws SQLException {
        throw new SQLException();
    }
    
    /**
     * Always throws a SQLException. Not supported.
     */
    public void setLoginTimeout(int seconds) throws SQLException {
        throw new SQLException();
    }
    
    /**
     * Always throws a SQLException. Not supported.
     */
    public synchronized void setLogWriter(PrintWriter out) throws SQLException {
        throw new SQLException();
    }
public Logger getParentLogger() throws SQLFeatureNotSupportedException
{
        throw new SQLFeatureNotSupportedException("Not supported yet.");
}

    /**
     * Returns the relevant driver info.
     */
    public String getDSInfo() {
        return ("driver=" + _driverClassName +
        ", URL=" + _jdbcURL +
        ", user=" + _userName +
        ", password=" + _password);
    }

    public <T> T unwrap(Class<T> iface) throws SQLException {
        throw new SQLFeatureNotSupportedException("Not supported yet.");
    }

    public boolean isWrapperFor(Class<?> iface) throws SQLException {
        throw new SQLFeatureNotSupportedException("Not supported yet.");
    }

}
