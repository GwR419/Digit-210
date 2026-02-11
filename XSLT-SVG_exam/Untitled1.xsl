<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="3.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:cbml="http://www.cbml.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="/">
        
        <!-- Count all dialogue -->
        <xsl:variable name="total" select="count(//cbml:balloon)"/>
        
        <svg xmlns="http://www.w3.org/2000/svg" width="600" height="200">
            
            <text x="50" y="30" font-size="18">
                Dialogue Proportions by Character
            </text>
            
            <xsl:variable name="scale" select="500 div $total"/>
            
            <!-- Track current X position -->
            <xsl:variable name="startX" select="50"/>
            
            <xsl:for-each-group select="//cbml:balloon" group-by="@who">
                
                <xsl:variable name="count" select="count(current-group())"/>
                
                <xsl:variable name="offset"
                    select="sum(
                    for $g in preceding-sibling::cbml:balloon
                    return 1
                    )"/>
                
                <rect
                    x="{50 + sum(
                    for $w in distinct-values(preceding::cbml:balloon/@who)
                    return count(//cbml:balloon[@who = $w]) * $scale
                    )}"
                    y="60"
                    width="{$count * $scale}"
                    height="50"
                    fill="hsl({position() * 60},70%,60%)"/>
                
                <!-- Label -->
                <text
                    x="{50 + sum(
                    for $w in distinct-values(preceding::cbml:balloon/@who)
                    return count(//cbml:balloon[@who = $w]) * $scale
                    ) + 5}"
                    y="90"
                    font-size="12">
                    
                    <xsl:value-of select="@who"/>
                    (<xsl:value-of select="$count"/>)
                    
                </text>
                
            </xsl:for-each-group>
            
        </svg>
        
    </xsl:template>
    
</xsl:stylesheet>
