<xsl:stylesheet version = '1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

<xsl:template match="/">
    <html>
        <body>
            <header>
                <nav>
                    <a href="index.html">Home</a>
                    <a href="slovakia.html">Slovakia</a>
                    <a href="finland.html">Finland</a>
                    <a href="austria.html">Austria</a>
                    <a href="hungary.html">Hungary</a>
                </nav>
            </header>
            <h1><xsl:value-of select="country/@name"/></h1>
            <xsl:for-each select="country/section">
                <h2><xsl:value-of select="@name"/></h2>
                <xsl:for-each select="paragraph">
                    <h3><xsl:value-of select="@name"/></h3>
                    <div><xsl:value-of select="text"/></div>
                </xsl:for-each>
            </xsl:for-each>
        </body>
    </html>




</xsl:template>

</xsl:stylesheet>