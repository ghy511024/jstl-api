





<html>
<head><title>positiveIfVarTest</title></head>
<body>

    
    <!-- EL: If var is specified, the result of the test condition
             is stored in the specified variable name. The type of 
             the exported var is java.lang.Boolean. -->
    XPath expression will evaluate to true, exported var should evaluate to true.<br>
    Body content should be processed.<br>
    
        XPath expression evaluated to true.<br>
    
    tResult is of type java.lang.Boolean<br>
    Var is: true<br><br>

    XPath expression will evaluate to false, exported var should evaluate to false.<br>
    Body content should be not be processed.<br>
    
    fResult is of type java.lang.Boolean<br>
    Var is: false<br><br>

    <!-- An empty body is also valid for x:if.  -->
    If tag with an empty body and var is specified.<br>
    XPath expression will evaluated to true, exported var should evaluate to true.<br>
    
    etResult is of type java.lang.Boolean<br>
    Var is: true<br><br>
    
    If tag with an empty body and var is specified.<br>
    XPath expression will evaluate to false, expored var should evaluated to false.<br>
    
    efResult is of type java.lang.Boolean<br>
    Var is: false<br><br>

    <!-- RT: If var is specified, the result of the test condition
             is stored in the specified variable name. The type of 
             the exported var is java.lang.Boolean. -->
    XPath expression will evaluate to true, exported var should evaluate to true.<br>
    Body content should be processed.<br>
    
        XPath expression evaluated to true.<br>
    
    rtResult is of type java.lang.Boolean<br>
    Var is: true<br><br>

    XPath expression will evaluate to false, exported var should evaluate to false.<br>
    Body content should be not be processed.<br>
    
    rtResult is of type java.lang.Boolean<br>
    Var is: false<br><br>

    <!-- An empty body is also valid for x:if.  -->
    If tag with an empty body and var is specified.<br>
    XPath expression will evaluated to true, exported var should evaluate to true.<br>
    
    retResult is of type java.lang.Boolean<br>
    Var is: true<br><br>
    
    If tag with an empty body and var is specified.<br>
    XPath expression will evaluate to false, expored var should evaluated to false.<br>
    
    refResult is not of the expected type: java.lang.Boolean<br>Specified type: java.lang.Boolean not found!<br>java.lang.NullPointerException
    Var is: false<br><br>

</body>
</html>


