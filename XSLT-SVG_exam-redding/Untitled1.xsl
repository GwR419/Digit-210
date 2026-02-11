<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:cbml="http://www.cbml.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">


        <xsl:variable name="total" select="count(//cbml:balloon[@who])"/>

        <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%">

            <text x="40" y="30" font-size="18"> These are graphs to show the Dialogue Proportions of
                each character who spoke in chapter 1 of Golden Experience Requiem. </text>

            <xsl:variable name="scale" select="550 div $total"/>


            <xsl:variable name="gap" select="20"/>

            <xsl:for-each-group select="//cbml:balloon[@who]" group-by="@who">


                <xsl:sort select="count(current-group())" order="descending"/>

                <xsl:variable name="count" select="count(current-group())"/>
                <xsl:variable name="percent" select="round(($count div $total) * 100)"/>
                <xsl:variable name="height" select="$count * $scale"/>


                <xsl:variable name="offset" select="
                        sum(
                        for $w in distinct-values(
                        preceding::cbml:balloon[@who]/@who
                        )
                        return
                            (count(//cbml:balloon[@who = $w]) * $scale) + $gap
                        )"/>

                <rect x="110" y="{80 + $offset}" width="90" height="{$height}"
                    fill="hsl({position() * 60},70%,60%)"/>


                <text x="220" y="{80 + $offset + ($height div 2)}" font-size="14"
                    dominant-baseline="middle">
                    <xsl:value-of select="@who"/> - <xsl:value-of select="$percent"/>% </text>

            </xsl:for-each-group>

        </svg>

    </xsl:template>

</xsl:stylesheet>
