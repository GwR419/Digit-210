<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:template match="test()">
        <xsl:analyze-string select="." regex="\[(.+?)\]" flags="s">
            <xsl:matching-substring>
               <stage> <xsl:value-of select="regex-group(1)"/></stage>
            </xsl:matching-substring>
            
            <xsl:non-matching-substring>
                <xsl:analyze-string select="." regex="(^[A-Z].+?):">
                    <xsl:matching-substring>
                        <spk><xsl:value-of select="regex-group(1)"/></spk></xsl:matching-substring>
                    
                </xsl:analyze-string>
            </xsl:non-matching-substring>
            
        </xsl:analyze-string>
    </xsl:template>
    
    <!--     <xsl:apply-templates select="." regex="(^[A-Z].+?):"/>-->
    
</xsl:stylesheet>