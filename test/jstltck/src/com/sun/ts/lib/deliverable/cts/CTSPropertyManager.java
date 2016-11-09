/*
 * Copyright 2007 Sun Microsystems, Inc. All rights reserved.
 * SUN PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 */

/*
 * $Id: CTSPropertyManager.java 53195 2007-04-11 22:41:57Z nrodin $
 */


package  com.sun.ts.lib.deliverable.cts;

import  com.sun.ts.lib.deliverable.*;
import  com.sun.ts.lib.util.*;
import  com.sun.javatest.*;
import  java.util.*;
import  java.io.*;


/**
 * This class serves as a well known place for harness, util, and porting
 * classes to retrieve property values.
 *
 * @author	Kyle Grucci
 */
public class CTSPropertyManager extends AbstractPropertyManager {
    //uninitialized singleton instance
    private static CTSPropertyManager jteMgr = new CTSPropertyManager();
    private String sDeployClass1;
    private String sDeployClass2;
    private String sLoginClass1;
    private String sLoginClass2;
    private String sURLClass1;
    private String sURLClass2;
    private String sJMSClass1;
    private String sJMSClass2;
    private String sNamingServiceHost2;
    private String sNamingServicePort2;
    private String sNamingServiceHost1;
    private String sNamingServicePort1;
    private String sDeployHost1;
    private String sDeployHost2;
    private String sWebServerHost;
    private String sWebServerPort;
    private String sWebServerHost2;
    private String sWebServerPort2;
    private String sSecuredWebServicePort;
    private String sSecuredWebServicePort2;
    private String sEJBServer1TxInteropEnabled;
    private String sEJBServer2TxInteropEnabled;
    private String sHttpsURLConnectionClass1;
    private String sHttpsURLConnectionClass2;
    private String sWSDLRepository1;
    private String sWSDLRepository2;
    private String user1;
    private String password1;
    private String user2;
    private String password2;

    //JSR-88 
	private String deployManagerJarFile1;
    private String deployManageruri1;
    private String deployManageruname1;
    private String deployManagerpasswd1;
    private String deployManagerJarFile2;
    private String deployManageruri2;
    private String deployManageruname2;
    private String deployManagerpasswd2;
        
    private CTSPropertyManager() {}

    /**
     * This method returns
     * the singleton instance of TSPropertyManager which provides access
     * to all ts.jte properties.  This is only called once by the test harness.
     *
     * @param	env - TestEnvironment object from JavaTest
     * @return	TSPropertyManager - singleton property manager object
     */
    public final static CTSPropertyManager getCTSPropertyManager (TestEnvironment env)
	throws PropertyNotSetException {
        jteMgr.setTestEnvironment(env);
	jteMgr.initInteropProperties();  //TODO: why init interop only here?
        return  jteMgr;
    }

    /**
     * This method returns
     * the singleton instance of CTSPropertyManager which provides access
     * to all ts.jte properties.  This is only called by the init()
     * method in ManualDeployment.java
     *
     * @param	p - Properties object from JavaTest
     * @return	CTSPropertyManager - singleton property manager object
     */
    public final static CTSPropertyManager getCTSPropertyManager (Properties p)
	throws PropertyNotSetException {
        jteMgr.setJteProperties(p);
        return  jteMgr;
    }

    public final static CTSPropertyManager getCTSPropertyManager ()
	throws PropertyNotSetException {
        return  jteMgr;
    }

    private void initInteropProperties () {
	user1 = getProperty("user1", null);
	password1 = getProperty("password1", null);
	user2 = getProperty("user2", null);
	password2 = getProperty("password2", null);
        sDeployClass1 = getProperty("porting.ts.deploy.class.1", null);
        sDeployClass2 = getProperty("porting.ts.deploy.class.2", null);
        sLoginClass1 = getProperty("porting.ts.login.class.1", null);
        sLoginClass2 = getProperty("porting.ts.login.class.2", null);
        sURLClass1 = getProperty("porting.ts.url.class.1", null);
        sURLClass2 = getProperty("porting.ts.url.class.2", null);
        sJMSClass1 = getProperty("porting.ts.jms.class.1", null);
        sJMSClass2 = getProperty("porting.ts.jms.class.2", null);
        sNamingServiceHost2 = getProperty("namingServiceHost2", null);
        sNamingServicePort2 = getProperty("namingServicePort2", null);
        sNamingServiceHost1 = getProperty("namingServiceHost1", null);
        sNamingServicePort1 = getProperty("namingServicePort1", null);
        sDeployHost1 = getProperty("deployment_host.1", null);
        sDeployHost2 = getProperty("deployment_host.2", null);
        sWebServerHost = getProperty("webServerHost", null);
        sWebServerPort = getProperty("webServerPort", null);
        sWebServerHost2 = getProperty("webServerHost.2", null);
        sWebServerPort2 = getProperty("webServerPort.2", null);
        sSecuredWebServicePort = getProperty("securedWebServicePort", null);
        sSecuredWebServicePort2 = getProperty("securedWebServicePort.2", null);
        sEJBServer1TxInteropEnabled = getProperty("EJBServer1TxInteropEnabled", null);
        sEJBServer2TxInteropEnabled = getProperty("EJBServer2TxInteropEnabled", null);
        sHttpsURLConnectionClass1 = getProperty("porting.ts.HttpsURLConnection.class.1", null);
        sHttpsURLConnectionClass2 = getProperty("porting.ts.HttpsURLConnection.class.2", null);
        sWSDLRepository1 = getProperty("wsdlRepository1", null);
        sWSDLRepository2 = getProperty("wsdlRepository2", null);
		
		//JSR-88
		deployManagerJarFile1 = getProperty("deployManagerJarFile.1", null);
        deployManageruri1 = getProperty("deployManageruri.1", null);
        deployManageruname1 = getProperty("deployManageruname.1", null);
        deployManagerpasswd1 = getProperty("deployManagerpasswd.1", null);
        deployManagerJarFile2 = getProperty("deployManagerJarFile.2", null);
        deployManageruri2 = getProperty("deployManageruri.2", null);
        deployManageruname2 = getProperty("deployManageruname.2", null);
        deployManagerpasswd2 = getProperty("deployManagerpasswd.2", null);
    
    }

    public void forwardValues () {
        //reverse all interop props
        setProperty("user1", user1);
        setProperty("password1", password1);
        setProperty("user2", user2);
        setProperty("password2", password2);

        setProperty("porting.ts.deploy.class.1", sDeployClass1);
        setProperty("porting.ts.deploy.class.2", sDeployClass2);
        setProperty("porting.ts.login.class.1", sLoginClass1);
        setProperty("porting.ts.login.class.2", sLoginClass2);
        setProperty("porting.ts.url.class.1", sURLClass1);
        setProperty("porting.ts.url.class.2", sURLClass2);
        setProperty("porting.ts.jms.class.1", sJMSClass1);
        setProperty("porting.ts.jms.class.2", sJMSClass2);
        setProperty("namingServiceHost2", sNamingServiceHost2);
        setProperty("namingServicePort2", sNamingServicePort2);
        setProperty("namingServiceHost1", sNamingServiceHost1);
        setProperty("namingServicePort1", sNamingServicePort1);
        setProperty("deployment_host.1", sDeployHost1);
        setProperty("deployment_host.2", sDeployHost2);
        setProperty("webServerHost", sWebServerHost);
        setProperty("webServerHost.2", sWebServerHost2);
        setProperty("webServerPort", sWebServerPort);
        setProperty("webServerPort.2", sWebServerPort2);
        setProperty("securedWebServicePort", sSecuredWebServicePort);
        setProperty("securedWebServicePort.2", sSecuredWebServicePort2);
        setProperty("EJBServer1TxInteropEnabled", sEJBServer1TxInteropEnabled);
        setProperty("EJBServer2TxInteropEnabled", sEJBServer2TxInteropEnabled);
        setProperty("porting.ts.HttpsURLConnection.class.1", sHttpsURLConnectionClass1);
        setProperty("porting.ts.HttpsURLConnection.class.2", sHttpsURLConnectionClass2);
        setProperty("wsdlRepository1", sWSDLRepository1);
        setProperty("wsdlRepository2", sWSDLRepository2);
		
		//JSR-88
		setProperty("deployManagerJarFile.1", deployManagerJarFile1);
        setProperty("deployManageruri.1", deployManageruri1);
        setProperty("deployManageruname.1", deployManageruname1);
        setProperty("deployManagerpasswd.1", deployManagerpasswd1);
        setProperty("deployManagerJarFile.2", deployManagerJarFile2);
        setProperty("deployManageruri.2", deployManageruri2);
        setProperty("deployManageruname.2", deployManageruname2);
        setProperty("deployManagerpasswd.2", deployManagerpasswd2);
		
        super.forwardValues();
    }

    public void reverseValues () {
        //reverse all interop props
        setProperty("user1", user2);
        setProperty("password1", password2);
        setProperty("user2", user1);
        setProperty("password2", password1);

        setProperty("porting.ts.deploy.class.1", sDeployClass2);
        setProperty("porting.ts.deploy.class.2", sDeployClass1);
        setProperty("porting.ts.login.class.1", sLoginClass2);
        setProperty("porting.ts.login.class.2", sLoginClass1);
        setProperty("porting.ts.url.class.1", sURLClass2);
        setProperty("porting.ts.url.class.2", sURLClass1);
        setProperty("porting.ts.jms.class.1", sJMSClass2);
        setProperty("porting.ts.jms.class.2", sJMSClass1);
        setProperty("namingServiceHost2", sNamingServiceHost1);
        setProperty("namingServicePort2", sNamingServicePort1);
        setProperty("namingServiceHost1", sNamingServiceHost2);
        setProperty("namingServicePort1", sNamingServicePort2);
        setProperty("deployment_host.1", sDeployHost2);
        setProperty("deployment_host.2", sDeployHost1);
        setProperty("webServerHost", sWebServerHost2);
        setProperty("webServerHost.2", sWebServerHost);
        setProperty("webServerPort", sWebServerPort2);
        setProperty("webServerPort.2", sWebServerPort);
        setProperty("securedWebServicePort", sSecuredWebServicePort2);
        setProperty("securedWebServicePort.2", sSecuredWebServicePort);
        setProperty("EJBServer1TxInteropEnabled", sEJBServer2TxInteropEnabled);
        setProperty("EJBServer2TxInteropEnabled", sEJBServer1TxInteropEnabled);
        setProperty("porting.ts.HttpsURLConnection.class.1", sHttpsURLConnectionClass2);
        setProperty("porting.ts.HttpsURLConnection.class.2", sHttpsURLConnectionClass1);
        setProperty("wsdlRepository1", sWSDLRepository2);
        setProperty("wsdlRepository2", sWSDLRepository1);
		
		//JSR-88
		setProperty("deployManagerJarFile.1", deployManagerJarFile2);
        setProperty("deployManageruri.1", deployManageruri2);
        setProperty("deployManageruname.1", deployManageruname2);
        setProperty("deployManagerpasswd.1", deployManagerpasswd2);
        setProperty("deployManagerJarFile.2", deployManagerJarFile1);
        setProperty("deployManageruri.2", deployManageruri1);
        setProperty("deployManageruname.2", deployManageruname1);
        setProperty("deployManagerpasswd.2", deployManagerpasswd1);
		
        super.reverseValues();
    }

    /**
     * This method is called by the test harness to retrieve all properties
     * needed by a particular test.
     *
     * @param	sPropKeys - Properties to retrieve
     * @return	Properties - property/value pairs
     */
    public Properties getTestSpecificProperties (String[] sPropKeys) throws PropertyNotSetException {
        Properties pTestProps = super.getTestSpecificProperties(sPropKeys);
        
        //if the abstract propertymanager already loaded all props, just return 
        if(pTestProps.getProperty("all.props").equalsIgnoreCase("true"))
        {
            return pTestProps; 
        }
 
        String sJtePropVal = "";
        //add all porting class props so the factories can work in the server
        pTestProps.put("porting.ts.deploy.class.1", getProperty("porting.ts.deploy.class.1"));
        pTestProps.put("porting.ts.deploy.class.2", getProperty("porting.ts.deploy.class.2"));
        pTestProps.put("porting.ts.login.class.1", getProperty("porting.ts.login.class.1"));
        pTestProps.put("porting.ts.login.class.2", getProperty("porting.ts.login.class.2"));
        pTestProps.put("porting.ts.HttpsURLConnection.class.1", getProperty("porting.ts.HttpsURLConnection.class.1"));
        pTestProps.put("porting.ts.HttpsURLConnection.class.2", getProperty("porting.ts.HttpsURLConnection.class.2"));
        pTestProps.put("porting.ts.url.class.1", getProperty("porting.ts.url.class.1"));
        pTestProps.put("porting.ts.url.class.2", getProperty("porting.ts.url.class.2"));
        pTestProps.put("porting.ts.jms.class.1", getProperty("porting.ts.jms.class.1"));
        pTestProps.put("porting.ts.jms.class.2", getProperty("porting.ts.jms.class.2"));
        pTestProps.put("namingServiceHost2", getProperty("namingServiceHost2"));
        pTestProps.put("namingServicePort2", getProperty("namingServicePort2"));
        pTestProps.put("namingServiceHost1", getProperty("namingServiceHost1"));
        pTestProps.put("namingServicePort1", getProperty("namingServicePort1"));
        pTestProps.put("wsdlRepository1", getProperty("wsdlRepository1"));
        pTestProps.put("wsdlRepository2", getProperty("wsdlRepository2"));
		
		//props needed when using the JSR-88 APIs
		pTestProps.put("deployManagerJarFile.1", getProperty("deployManagerJarFile.1"));
		pTestProps.put("deployManageruri.1", getProperty("deployManageruri.1"));

        pTestProps.put("deployManageruname.1", getProperty("deployManageruname.1"));
        pTestProps.put("deployManagerpasswd.1", getProperty("deployManagerpasswd.1"));
        pTestProps.put("deployManagerJarFile.2", getProperty("deployManagerJarFile.2"));
		pTestProps.put("deployManageruri.2", getProperty("deployManageruri.2"));

        pTestProps.put("deployManageruname.2", getProperty("deployManageruname.2"));
        pTestProps.put("deployManagerpasswd.2", getProperty("deployManagerpasswd.2"));
        pTestProps.put("porting.ts.deploy2.class.1", getProperty("porting.ts.deploy2.class.1"));
        pTestProps.put("porting.ts.deploy2.class.2", getProperty("porting.ts.deploy2.class.2"));

	pTestProps.put("variable.mapper", getProperty("variable.mapper"));
        return  pTestProps;
    }
}



