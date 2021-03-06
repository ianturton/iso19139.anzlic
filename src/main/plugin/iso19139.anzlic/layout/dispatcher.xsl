<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gts="http://www.isotc211.org/2005/gts"
  xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gmx="http://www.isotc211.org/2005/gmx"
  xmlns:srv="http://www.isotc211.org/2005/srv" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:gml="http://www.opengis.net/gml" xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:gn="http://www.fao.org/geonetwork"
  xmlns:gn-fn-metadata="http://geonetwork-opensource.org/xsl/functions/metadata"
  xmlns:gn-fn-iso19139="http://geonetwork-opensource.org/xsl/functions/profiles/iso19139"
  xmlns:saxon="http://saxon.sf.net/" extension-element-prefixes="saxon"
  exclude-result-prefixes="#all">
  
  <xsl:include href="layout.xsl"/>

  <!-- Load the schema configuration for the editor -->
  <xsl:template name="get-iso19139.anzlic-configuration">
    <xsl:copy-of select="document('config-editor.xml')"/>
  </xsl:template>


  <!-- Dispatch to the current profile mode -->
  <xsl:template name="dispatch-iso19139.anzlic">
    <xsl:param name="base" as="node()"/>
		<xsl:param name="overrideLabel" as="xs:string" required="no" select="''"/>

    <!-- process in iso19139 mode - but we can override any templates
         defined for iso19139 by importing that stylesheet into our
         anzlic stylesheet - that way the iso19139 templates will have
         a lower priority than ours -->
    <xsl:apply-templates mode="mode-iso19139" select="$base">
      <xsl:with-param name="overrideLabel" select="$overrideLabel"/>
      <xsl:with-param name="schema" select="$schema"/>
      <xsl:with-param name="labels" select="$iso19139.anzliclabels"/>
    </xsl:apply-templates>
  </xsl:template>


  <!-- The following templates usually delegates all to iso19139. -->
  <xsl:template name="evaluate-iso19139.anzlic">
    <xsl:param name="base" as="node()"/>
    <xsl:param name="in"/>
    
    <xsl:call-template name="evaluate-iso19139">
      <xsl:with-param name="base" select="$base"/>
      <xsl:with-param name="in" select="$in"/>
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="evaluate-iso19139.anzlic-boolean">
    <xsl:param name="base" as="node()"/>
    <xsl:param name="in"/>

    <xsl:call-template name="evaluate-iso19139-boolean">
      <xsl:with-param name="base" select="$base"/>
      <xsl:with-param name="in" select="$in"/>
    </xsl:call-template>
  </xsl:template>


</xsl:stylesheet>
