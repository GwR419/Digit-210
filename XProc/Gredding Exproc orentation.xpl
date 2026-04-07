<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" 
    xmlns:fn="http://www.w3.org/2005/xpath-functions" 
    version="3.0">
    
    <p:input port="source">
        <p:inline>
            <fn:map>
                <fn:string key="my-message">Hello XProc!</fn:string>
            </fn:map>
        </p:inline>
    </p:input>
    
    <p:output port="result"/>
    
    <p:cast-content-type content-type="application/json"/>
    
</p:declare-step>