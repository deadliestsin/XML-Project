<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html><head><xsl:template name="headers"> 
  <script>
    function addDisplay (details) {
      document.write(details);
    }
  </script>
</xsl:template></head><body><TABLE border="1">
<tr>
  <th>Course No.</th>
  <th>Course Title</th>
  <th>Prof</th>
  <th>Year</th>
  <th>Days</th>
  <th>Time</th>
  <th>Location</th>
</tr>
<xsl:apply-templates select="courses/course"/>
</TABLE></body></html>
</xsl:template>

<xsl:template match="course">
  <xsl:if test="@acad_year > 2003">
  <tr>
    <td>
      <xsl:for-each select="course_num">
          <xsl:value-of select="." /> 
            <xsl:if test="position()!=last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each>
    </td> 
    <td><a>
          <xsl:attribute name="href">
          JavaScript:addDisplay('
            <xsl:value-of select="description"/>
          ');
          </xsl:attribute>
          <xsl:value-of select="title"/>
      </a></td> 
    <xsl:apply-templates select="course_head"/>
    <td><xsl:value-of select="@acad_year"/></td>
    <xsl:apply-templates select="meeting"/>
  </tr>
  </xsl:if>
</xsl:template>

<xsl:template match="meeting">
  <td><xsl:value-of select="meeting_days"/></td>
  <td><xsl:value-of select="meeting_begin"/>-<xsl:value-of select="meeting_end"/></td>
  <td><xsl:value-of select="location"/></td>
</xsl:template>

<xsl:template match="course_head">
    <td>
      <xsl:for-each select="person">
          <xsl:value-of select="person_name" /> 
            <xsl:if test="position()!=last()">
                <xsl:text>, </xsl:text>
            </xsl:if>
        </xsl:for-each>
    </td> 
</xsl:template>
</xsl:stylesheet>

