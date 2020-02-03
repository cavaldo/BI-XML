<xsl:stylesheet version = '1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>

<xsl:template match="/">
    <html>
        <head>
            <meta charset="utf-8"/>
            <link href="countries.css" hreflang="cs" rel="stylesheet"></link>
        </head>
        <body>
            <header>
                <nav>
                    <a class="top-nav" href="index.html">Home</a>
                    <a class="top-nav" href="slovakia.html">Slovakia</a>
                    <a class="top-nav" href="finland.html">Finland</a>
                    <a class="top-nav" href="austria.html">Austria</a>
                    <a class="top-nav" href="hungary.html">Hungary</a>
                </nav>
            </header>

            <main>
                <div>
                    <xsl:apply-templates mode="content"></xsl:apply-templates>
                </div>
            </main>

        </body>
    </html>

</xsl:template>

 <xsl:template match="//country" mode="title">
        <title>
            <xsl:value-of select="@name"></xsl:value-of>
        </title>
</xsl:template>

<xsl:template match="//country" mode="content">
        <h1 class="card-header">
            <xsl:value-of select="@name" />
        </h1>
        <img>
            <xsl:attribute name="src">
                <xsl:value-of select="concat('../images/', @name, '-flag.gif')" />
            </xsl:attribute>
            <xsl:attribute name="alt">
                <xsl:value-of select="concat('Flag of ', @name)" />
            </xsl:attribute>
        </img>
        <img>
            <xsl:attribute name="src">
                <xsl:value-of select="concat('../images/', @name, '-map.gif')" />
            </xsl:attribute>
            <xsl:attribute name="alt">
                <xsl:value-of select="concat('Map of ', @name)" />
            </xsl:attribute>
        </img>
        <img>
            <xsl:attribute name="src">
                <xsl:value-of select="concat('../images/', @name, '-locator-map.gif')" />
            </xsl:attribute>
            <xsl:attribute name="alt">
                <xsl:value-of select="concat('Locator map of ', @name)" />
            </xsl:attribute>
        </img>

        <h2 class="navigation">Navigation</h2>
        <ul class="list-unstyled">
            <xsl:for-each select="section">
                <li>
                    <a>
                        <xsl:attribute name="href">
                            <xsl:value-of select="concat('#', @name)" />
                        </xsl:attribute>
                        <xsl:value-of select="@name" />
                    </a>
                </li>
            </xsl:for-each>
        </ul>
        <xsl:apply-templates select="section" />
    </xsl:template>

    <xsl:template match="section">
        <article>
            <h2 class="section">
                <xsl:attribute name="id">
                    <xsl:value-of select="@name" />
                </xsl:attribute>
                <xsl:value-of select="@name" />
            </h2>
            <section>
                <xsl:apply-templates select="paragraph" />
            </section>
        </article>
    </xsl:template>

    <xsl:template match="paragraph">
        <h3 class="subsection">
            <xsl:value-of select="@name" />
        </h3>
        <xsl:choose>
            <xsl:when test="text/line">
                <ul>
                    <xsl:apply-templates select="*/line" />
                </ul>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="text" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="text">
        <p>
            <xsl:value-of select="." />
        </p>
    </xsl:template>
    <xsl:template match="line">
        <li>
            <xsl:value-of select="." />
        </li>
    </xsl:template>

</xsl:stylesheet>