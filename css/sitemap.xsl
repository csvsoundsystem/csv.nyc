<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
			xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9"
			xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>CSV Soundsystem sitemap</title>
				<meta charset="utf-8"/>
				<style type="text/css">
					body {
						font-family: monospace;
					}

					th {
						font-weight: normal;
						text-align: left;
					}

					a {
						text-decoration: none;
						color: #000;
					}

					a:hover {
						text-decoration: underline;
					}
				</style>
			</head>
			<body>
				<table class="sitemap">
					<thead>
						<tr>
							<th>Location</th>
							<th>Last modified</th>
							<th>Change Freq.</th>
							<th>Priority</th>
						</tr>
					</thead>
					<tbody>
						<xsl:for-each select="sitemap:urlset/sitemap:url">
							<tr>
								<td>
									<xsl:variable name="itemURL">
										<xsl:value-of select="sitemap:loc"/>
									</xsl:variable>
									<a href="{$itemURL}">
										<xsl:value-of select="sitemap:loc"/>
									</a>
								</td>
								<td>
									<xsl:value-of select="sitemap:lastmod"/>
								</td>
								<td>
									<xsl:value-of select="sitemap:priority"/>
								</td>
								<td>
									<xsl:value-of select="sitemap:changefreq"/>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>