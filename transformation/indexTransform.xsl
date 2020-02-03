<xsl:stylesheet version = '1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

<xsl:template match="/">
    <html>
        <body>
            <header>
                <link href="index.css" hreflang="cs" rel="stylesheet"></link>
                <nav>
                    <a href="index.html">Home</a>
                    <a href="slovakia.html">Slovakia</a>
                    <a href="finland.html">Finland</a>
                    <a href="austria.html">Austria</a>
                    <a href="hungary.html">Hungary</a>
                </nav>
            </header>

            <h1>Homepage</h1>
            <p>Welcome to the homepage.</p>
            <p>This website was created as an assignment from BI-XML.</p>
            <p>This website contains following countries:</p>
            <xsl:for-each select="countries/country">
                <div><xsl:value-of select="@name"/></div>
            </xsl:for-each>

            <p>Every country contains these sections:</p>
            <ul>
                <li>Introduction</li>
                <li>Geography</li>
                <li>People and Society</li>
                <li>Government</li>
                <li>Economy</li>
                <li>Energy</li>
                <li>Communications</li>
                <li>Military and Security</li>
                <li>Transportation</li>
                <li>Transnational Issues</li>
            </ul>

            <footer>
                BI-XML
                autor: Tien Toan Ha
            </footer>

        </body>
    </html>

</xsl:template>

</xsl:stylesheet>