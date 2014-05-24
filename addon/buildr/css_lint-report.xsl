<?xml version="1.0"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <html>
      <head>
        <title>CssLint Violations</title>
      </head>
      <body bgcolor="#FFFFEF">
        <p>
          <b>Coding Style Check Results</b>
        </p>
        <table border="1" cellspacing="0" cellpadding="2">
          <tr bgcolor="#CC9966">
            <th colspan="2">
              <b>Summary</b>
            </th>
          </tr>
          <tr bgcolor="#F3F3E1">
            <td>Files with errors</td>
            <td>
              <xsl:number level="any" value="count(descendant::file)"/>
            </td>
          </tr>
          <tr bgcolor="#CCF3D0">
            <td>Total errors</td>
            <td>
              <xsl:number level="any" value="count(descendant::issue)"/>
            </td>
          </tr>
        </table>
        <hr align="left" width="95%" size="1"/>
        <p>The following are violations of the ScssLint Rules:</p>
        <p/>
        <xsl:apply-templates/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="file[issue]">
    <table bgcolor="#AFFFFF" width="95%" border="1" cellspacing="0" cellpadding="2">
      <tr>
        <th>File:</th>
        <td>
          <xsl:value-of select="@name"/>
        </td>
      </tr>
    </table>
    <table bgcolor="#DFFFFF" width="95%" border="1" cellspacing="0" cellpadding="2">
      <tr>
        <th style="width: 4em; padding: 0; margin: 0;">Line</th>
        <th style="width: 4em; padding: 0; margin: 0;">Column</th>
        <th style="width: 7em; padding: 0; margin: 0;">Severity</th>
        <th>Reason</th>
        <th>Evidence</th>
      </tr>
      <xsl:apply-templates select="issue"/>
    </table>
    <p/>
  </xsl:template>

  <xsl:template match="issue">
    <tr>
      <td>
        <xsl:value-of select="@line"/>
      </td>
      <td>
        <xsl:value-of select="@char"/>
      </td>
      <td>
        <xsl:value-of select="@severity"/>
      </td>
      <td>
        <xsl:value-of select="@reason"/>
      </td>
      <td>
        <xsl:value-of select="@evidence"/>
      </td>
    </tr>
  </xsl:template>

</xsl:stylesheet>
