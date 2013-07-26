<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
   <xsl:output method="html" version="1.0" encoding="iso-8859-1" indent="no" media-type="text/html"/>

   <!-- This style sheet is divided into the following sections:
   
   HTML WRAPPER
   MAJOR STRUCTURES  of the text (front, div1, back)
   PAGE, COLUMN, AND LINE BREAKS
   METADATA SUMMARY ITEMS
   MSS ITEMS
   MISCELLANEOUS
   IMAGES
   NOTES
   LETTERS
   TITLES
   TYPOGRAPHY
   TABLES
   LISTS
            
-->
   <!-- HTML WRAPPER: Note that this section (between the xsl:template tags) 
places the entire contents enclosed within the text tags of your document into 
the body tags of the Web page. -->
   <xsl:template match="/">
      <html>
         <head>
            <title>
               <xsl:value-of select="//text/front/div1/head/bibl/title"/>
            </title>
            <style>
               body {
                   margin:30px;
                   background-color: #FFFFFF;
                   width: 60em;
                   font-family: Verdana, Arial, Helvetica, sans-serif;
               }
               p {
               }
               div.pagebreak {
                   margin-top: 25px;
                   margin-bottom: 0px;
                   text-align: center;
               }
               fl_right {
                   float: right;
               }
               hr {
                   color: #888833;
                   clear: right;
               }
               div#letter {
                   border: 3px groove #666666;
                   padding: 5px;
               }
               h1 {
               }
               h2 {
               }
               sup {
               }
               img {
                   margin-top: 5px;
                   margin-bottom: 5px;
               }
               .nocancel {
                   text-decoration: none;
                   color: #000000;
               }
               .cancel {
                   text-decoration: line-through;
                   color: #FF0000;
               }
               div.fl_mov_right {
                   float: right;
                   text-align: center;
                   width: 320;
                   margin: 5px 5px 5px 5px;
               }
               div.fl_aud_right {
                   float: right;
                   width: 200;
                   text-align: center;
                   margin: 5px 5px 5px 5px;
               }
               div.fl_img_right {
                   float: right;
                   text-align: center;
                   margin: 5px 5px 5px 5px;
               }
               .ProjectTitle {
                   font-family: Verdana, Arial, Helvetica, sans-serif;
                   font-size: 16pt;
                   font-style: normal;
                   font-weight: bolder;
                   line-height: 18pt;
               }
               .hang15 {
                   margin-left: 40px;
                   text-indent: -15px;
               }
               .hang25 {
                   margin-left: 40px;
                   text-indent: -25px;
               }
               .hang35 {
                   margin-left: 40px;
                   text-indent: -35px;
               }
               table {
                   text-align: right;
               }</style>
         </head>
         <body
            background="https://images.asc.ohio-state.edu/is/image/mediamanager/9/9846d5b7-ad8b-4ffa-be30-4c70ea5dac63.jpg?scale=0.4&amp;rgn=360,440,240,240&amp;op_brightness=20&amp;fmt=png">
            <p align="center"><span class="ProjectTitle">Journal of a Tour to Europe</span><br/> A
               Personal Journal of Samuel Sullivan Cox (1824-1889)</p>
            <hr/>
            <p align="center">
               <a href="http://people.cohums.ohio-state.edu/ulman1/SSCoxJournal/" target="self"
                  >Project Web Site</a> | <a
                  href="SSCoxJournal-EdIntro.html"
                  target="self"> Ed. Intro</a> || <strong>Views</strong>: Reading (current/<a
                  href="#view"
                  >about</a>) | <a
                  href="SSCoxJournal-Diplomatic.html"
                  target="self"> Diplomatic</a> | <a
                  href="SSCoxJournal-SplitView.html"
                  target="self"> MS Image/Text</a>
               <br/>
            </p>
            <hr/>

            <xsl:apply-templates select="//text/front"/>
            <xsl:apply-templates select="//text/body"/>
            <br/>
            <hr/>
            <strong>Explanatory Annotations</strong>
            <xsl:for-each select="//text//note[@id]">
               <xsl:choose>
                  <xsl:when test="position()>=100">
                     <p class="hang35"><a>
                           <xsl:attribute name="name">
                              <xsl:value-of select="@id"/>
                           </xsl:attribute>
                        </a>
                        <xsl:number count="//text//note[@id]" level="any"
                        />.&#xA0;<xsl:apply-templates/></p>
                  </xsl:when>
                  <xsl:when test="position()>=10">
                     <p class="hang25"><a>
                           <xsl:attribute name="name">
                              <xsl:value-of select="@id"/>
                           </xsl:attribute>
                        </a>
                        <xsl:number count="//text//note[@id]" level="any"
                        />.&#xA0;<xsl:apply-templates/></p>
                  </xsl:when>
                  <xsl:otherwise>
                     <p class="hang15"><a>
                           <xsl:attribute name="name">
                              <xsl:value-of select="@id"/>
                           </xsl:attribute>
                        </a>
                        <xsl:number count="//text//note[@id]" level="any"
                        />.&#xA0;<xsl:apply-templates/></p>
                  </xsl:otherwise>
               </xsl:choose>

            </xsl:for-each>
            <xsl:apply-templates select="//text/back"/>

            <hr/>
            <p>
               <strong>About this View of the Journal</strong>
            </p>
            <p><a name="view"/>The text of the journal is organized by daily entries. Line breaks in
               the manuscript are not reported; rather, lines wrap in the browser's window. Page
               breaks are not reported. Paragraph breaks follow those in the manuscript. Spelling,
               punctuation, capitalization, and abbreviations are reported as they appear in the
               manuscript. Text highlighted by Cox with an underscore is underscored in this view.
               Text canceled by Cox is suppressed. Text added by Cox between lines or in the margins
               is silently incorporated into the text. All material added by the editor is
               surrounded by square brackets: uncertain readings are enclosed in square brackets and
               followed by a question mark, and text supplied by the editor for clarity is set in
               italics and surrounded by square brackets. Gaps in the manuscript (e.g., from tears)
               are indicated by elipses enclosed by square brackets. Links to notes and external
               materials are colored and underlined. Finally, the background consists of a tiled
               detail from a page of Cox's journal.</p>
            <hr/>
            <p align="left">
               <a href="http://people.cohums.ohio-state.edu/ulman1/SSCoxJournal/SSCoxHome.cfm"
                  target="self">Home</a>
               <br/>
               <br/>
               <emph>Created: <xsl:apply-templates select="//profileDesc/creation/date"/></emph>
            </p>
            <p align="center">
               <xsl:value-of select="//availability/p[@id='CreativeCommons']"
                  disable-output-escaping="yes"/>
            </p>
         </body>
      </html>
   </xsl:template>

   <!-- MAJOR STRUCTURES: These elements include the front, body, and back
      elements of you XML documents in the result tree of your output.-->

   <xsl:template match="front">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="body">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="back">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="witList"/>

   <!-- PAGE, COLUMN, AND LINE BREAKS; Page Layout: These template rules determine how page breaks and
      line breaks will appear, or whether they will appear, in your Web page. -->

   <xsl:template match="pb"> </xsl:template>
   <xsl:template match="lb"> </xsl:template>
   <xsl:template match="seg[@type='softhyphen']"/>
   <xsl:template match="p">
      <p>
         <xsl:apply-templates/>
      </p>
   </xsl:template>

   <!-- ENTRY DATELINES, HEADS, AND ABSTRACTS: This section includes the title and extent 
      from the front section of your text in your output. -->

   <xsl:template match="div1">
      <hr/>
      <br/>
      <a>
         <xsl:attribute name="name">
            <xsl:value-of select="@id"/>
         </xsl:attribute>
      </a>
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="div1/head">
      <p>
         <xsl:apply-templates/>
      </p>
   </xsl:template>
   <xsl:template match="div1/opener/dateline">
      <strong>
         <xsl:apply-templates/>
      </strong>
   </xsl:template>

   <!-- MSS ITEMS: These rules process various tags particularly relevant to 
      transcriptions of primary handwritten materials. -->

   <xsl:template match="hand">
      <xsl:apply-templates/>
   </xsl:template>
   <!-- Hanshifts -->
   <xsl:template match="handshift"> [ <xsl:value-of select="@new"/> ] </xsl:template>
   <!-- Gaps in your transcript of the source text (tears in the page, and so on). -->
   <xsl:template match="gap">
      <xsl:apply-templates/>[ .&#xA0;.&#xA0;. ]</xsl:template>

   <!-- Critical Apparatus -->
   <xsl:template match="app">
      <xsl:apply-templates select="lem"/>
   </xsl:template>
   <xsl:template match="supplied"> [<i>
         <xsl:apply-templates/>
      </i>] </xsl:template>

   <!-- Additions by the author or another hand. -->
   <xsl:template match="add">
      <xsl:apply-templates/>
   </xsl:template>
   <!-- Recoverable deletions by the author or another hand -->
   <xsl:template match="del"/>
   <!-- Unclear passages. -->
   <xsl:template match="unclear"> [<xsl:apply-templates/>?] </xsl:template>
   <!-- 
	<xsl:template match="orig">
         <xsl:apply-templates/> 
	</xsl:template> -->
   <xsl:template match="orig">
      <xsl:value-of select="@reg"/>
   </xsl:template>
   <xsl:template match="orig[@rend='linebreak']">
      <xsl:value-of select="@reg"/>
      <br/>
   </xsl:template>
   <!-- Nonstandard or erroneous text for which you have encoded a correct 
   alternative. -->
   <xsl:template match="sic">
      <xsl:apply-templates/>
   </xsl:template>
   <!-- 	<xsl:template match="sic">
		<xsl:value-of select="@corr"/>
		</xsl:template> -->
   <xsl:template match="corr">
      <xsl:value-of select="@sic"/> [sic] </xsl:template>
   <!-- 	<xsl:template match="corr">
        	 <xsl:apply-templates/> 
		</xsl:template> -->
   <!--
   <xsl:template match="fw">
       <p>
         <xsl:apply-templates/>
       </p>
   </xsl:template>
		 -->

   <!--MISCELLANEOUS-->

   <!-- Quotes -->
   <xsl:template match="q">
      <xsl:apply-templates/>
   </xsl:template>
   <!-- Abbreviations -->
   <xsl:template match="abbr">
      <xsl:apply-templates/>
   </xsl:template>
   <!-- Passages in languages other than your document's base language. -->
   <xsl:template match="foreign">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="name[@type='binomial']">
      <i>
         <xsl:apply-templates/>
      </i>
   </xsl:template>
   <xsl:template match="name[@type='ship']">
      <i>
         <xsl:apply-templates/>
      </i>
   </xsl:template>

   <!-- IMAGES (creates a link to a Media Manager image or an image on another 
      Web site [use caution with the latter]). -->

   <xsl:template match="figure[@rend='link']"> [<a>
         <xsl:attribute name="HREF">
            <xsl:value-of select="figDesc/xref/@url"/>
         </xsl:attribute>
         <xsl:attribute name="alt">
            <xsl:value-of select="head"/>
         </xsl:attribute>
         <xsl:value-of select="figDesc/xref"/>
      </a>]. </xsl:template>

   <xsl:template match="figure[@rend='embedImg']">
      <div class="fl_img_right">
         <img>
            <xsl:attribute name="src">
               <xsl:value-of select="figDesc/xref/@url"/>
            </xsl:attribute>
            <xsl:attribute name="alt">
               <xsl:value-of select="head"/>
            </xsl:attribute>
         </img>
         <br/>
         <xsl:value-of select="head"/>
      </div>
   </xsl:template>

   <xsl:template match="figure[@rend='embedMov']">
      <div class="fl_mov_right">
         <object classid="clsid:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B"
            codebase="http://www.apple.com/qtactivex/qtplugin.cab" width="320" height="256">
            <xsl:element name="param">
               <xsl:attribute name="name">src</xsl:attribute>
               <xsl:attribute name="value">
                  <xsl:value-of select="figDesc/xref/@url"/>
               </xsl:attribute>
            </xsl:element>
            <param name="autoplay" value="false"/>
            <param name="controller" value="true"/>
            <param name="scale" value="aspect"/>
            <xsl:element name="param">
               <xsl:attribute name="name">starttime</xsl:attribute>
               <xsl:attribute name="value">
                  <xsl:value-of select="figDesc/xref/@starttime"/>
               </xsl:attribute>
            </xsl:element>
            <xsl:element name="param">
               <xsl:attribute name="name">endtime</xsl:attribute>
               <xsl:attribute name="value">
                  <xsl:value-of select="figDesc/xref/@endtime"/>
               </xsl:attribute>
            </xsl:element>
            <xsl:element name="embed">
               <xsl:attribute name="height">256</xsl:attribute>
               <xsl:attribute name="width">320</xsl:attribute>
               <xsl:attribute name="src">
                  <xsl:value-of select="figDesc/xref/@url"/>
               </xsl:attribute>
               <xsl:attribute name="pluginspace"
                  >http://www.apple.com/quicktime/download/</xsl:attribute>
               <xsl:attribute name="autoplay">false</xsl:attribute>
               <xsl:attribute name="type">video/quicktime</xsl:attribute>
               <xsl:attribute name="controller">true</xsl:attribute>
               <xsl:attribute name="scale">aspect</xsl:attribute>
               <xsl:attribute name="starttime">
                  <xsl:value-of select="figDesc/xref/@starttime"/>
               </xsl:attribute>
               <xsl:attribute name="endtime">
                  <xsl:value-of select="figDesc/xref/@endtime"/>
               </xsl:attribute>
            </xsl:element>
         </object>
         <br/>
         <xsl:value-of select="head"/>
         <br/>
      </div>
   </xsl:template>
   <xsl:template match="figure[@rend='embedAud']">
      <div class="fl_aud_right">
         <object classid="clsid:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B"
            codebase="http://www.apple.com/qtactivex/qtplugin.cab" width="200" height="24">
            <xsl:element name="param">
               <xsl:attribute name="name">src</xsl:attribute>
               <xsl:attribute name="value">
                  <xsl:value-of select="figDesc/xref/@url"/>
               </xsl:attribute>
            </xsl:element>
            <param name="autoplay" value="false"/>
            <param name="controller" value="true"/>
            <param name="scale" value="aspect"/>
            <!--<xsl:element name="param">
               <xsl:attribute name="name">starttime</xsl:attribute>
               <xsl:attribute name="value"><xsl:value-of select="lb/@starttime"/></xsl:attribute>
               </xsl:element>
               <xsl:element name="param">
               <xsl:attribute name="name">endtime</xsl:attribute>
               <xsl:attribute name="value"><xsl:value-of select="lb/@endtime"/></xsl:attribute>
               </xsl:element>-->
            <xsl:element name="embed">
               <xsl:attribute name="height">24</xsl:attribute>
               <xsl:attribute name="width">200</xsl:attribute>
               <xsl:attribute name="src">
                  <xsl:value-of select="figDesc/xref/@url"/>
               </xsl:attribute>
               <xsl:attribute name="pluginspace"
                  >http://www.apple.com/quicktime/download/</xsl:attribute>
               <xsl:attribute name="autoplay">false</xsl:attribute>
               <xsl:attribute name="type">video/quicktime</xsl:attribute>
               <xsl:attribute name="controller">true</xsl:attribute>
               <xsl:attribute name="scale">aspect</xsl:attribute>
               <!--<xsl:attribute name="starttime"><xsl:value-of select="lb/@starttime"/></xsl:attribute>
                  <xsl:attribute name="endtime"><xsl:value-of select="lb/@endtime"/></xsl:attribute>-->
            </xsl:element>
         </object>
         <br/>
         <xsl:value-of select="head"/>
         <br/>
      </div>
   </xsl:template>

   <!-- NOTES -->

   <xsl:template match="back/div1">
      <hr/>
      <xsl:apply-templates/>
      <br/>
   </xsl:template>
   <xsl:template match="back/div1/head">
      <strong>
         <xsl:apply-templates/>
      </strong>
   </xsl:template>
   <xsl:template match="back/div1/listBibl/head">
      <strong>
         <xsl:apply-templates/>
      </strong>
   </xsl:template>
   <xsl:template match="note[@target]">
      <a>
         <xsl:attribute name="href">#<xsl:value-of select="@target"/></xsl:attribute>
         <sup>
            <xsl:number level="any" count="note[@target]"/>
            <xsl:apply-templates/>
         </sup>
      </a>
   </xsl:template>
   <xsl:template match="note[@id]"/>
   <xsl:template match="xref">
      <xsl:choose>
         <xsl:when test="parent=figDesc"/>
         <xsl:otherwise>
            <a>
               <xsl:attribute name="href">
                  <xsl:value-of select="@url"/>
               </xsl:attribute>
               <xsl:apply-templates/>
            </a>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="xref[@type='collate']">
      <xsl:choose>
         <xsl:when test="parent=figDesc"/>
         <xsl:otherwise>
            <a>
               <xsl:attribute name="href">
                  <xsl:value-of select="@url"/>
               </xsl:attribute><xsl:attribute name="target"
               >_blank</xsl:attribute>[<xsl:apply-templates/>] </a>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <!-- 
   <xsl:template match="xref">
      <a>
        <xsl:attribute name="href"><xsl:value-of select="@url"/></xsl:attribute>
	<xsl:choose>
	  <xsl:when test="string-length(normalize-space(@imgref))">
	    <img>
	      <xsl:attribute name="src"><xsl:value-of select="@imgref"/></xsl:attribute>
	      <xsl:attribute name="alt"><xsl:apply-templates/></xsl:attribute>
	      <xsl:attribute name="border">0</xsl:attribute>
	      <xsl:attribute name="align">top</xsl:attribute>
	    </img>
          </xsl:when>
	  <xsl:when test="string-length(normalize-space(.)) > 0">
	      <xsl:apply-templates/>
	  </xsl:when>
          <xsl:otherwise>
	    <xsl:value-of select="@url"/>
          </xsl:otherwise>
	</xsl:choose>
      </a>
   </xsl:template>
   -->

   <!-- TITLES -->

   <xsl:template match="head/bibl/title">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="//title[@level='a']"><xsl:apply-templates/></xsl:template>
   <xsl:template match="//title[@level='m']">
      <cite>
         <xsl:apply-templates/>
      </cite>
   </xsl:template>
   <xsl:template match="//listBibl">
      <p><strong><xsl:value-of select="head"/></strong></p>
      <xsl:for-each select="bibl">
         <xsl:sort select="@n"/>
         <p class="hang25">
            <xsl:apply-templates/>
         </p>
      </xsl:for-each>
   </xsl:template>
   <xsl:template match="//listBibl/bibl/author">
      <xsl:apply-templates/>. </xsl:template>
   <xsl:template match="//listBibl/bibl/editor">
      <xsl:apply-templates/>, ed. </xsl:template>
   <xsl:template match="//listBibl/bibl/edition">
      <xsl:apply-templates/> ed. </xsl:template>
   <xsl:template match="//listBibl/bibl/pubPlace">
      <xsl:apply-templates/>: </xsl:template>
   <xsl:template match="//listBibl/bibl/publisher">
      <xsl:apply-templates/>, </xsl:template>
   <xsl:template match="//listBibl/bibl/date">
      <xsl:apply-templates/>. </xsl:template>
   <xsl:template match="//listBibl/bibl/titlePage">
      <center>
         <xsl:apply-templates/>
      </center>
   </xsl:template>
   <xsl:template match="//listBibl/bibl/biblScope[@type='URL']"> <a>
      <xsl:attribute name="href">
         <xsl:value-of select="."/>
      </xsl:attribute>
      <xsl:apply-templates/>
   </a>. </xsl:template>
   <xsl:template match="//listBibl/bibl/biblScope[@type='DateOfVisit']"> Date of visit:
      <xsl:apply-templates/>. </xsl:template>
   <xsl:template match="titlePart[@type='main']">
      <h3>
         <xsl:apply-templates/>
      </h3>
   </xsl:template>
   <xsl:template match="titlePart[@type='sub']">
      <h4>
         <xsl:apply-templates/>
      </h4>
   </xsl:template>

   <!-- TYPOGRAPHY -->

   <xsl:template match="hi">
      <i>
         <xsl:apply-templates/>
      </i>
   </xsl:template>
   <xsl:template match="hi[@rend='bold']">
      <b>
         <xsl:apply-templates/>
      </b>
   </xsl:template>
   <xsl:template match="hi[@rend='italics']">
      <I>
         <xsl:apply-templates/>
      </I>
   </xsl:template>
   <xsl:template match="hi[@rend='italic']">
      <I>
         <xsl:apply-templates/>
      </I>
   </xsl:template>
   <xsl:template match="hi[@rend='underline']">
      <U>
         <xsl:apply-templates/>
      </U>
   </xsl:template>
   <xsl:template match="hi[@rend='superscript']">
      <sup>
         <xsl:apply-templates/>
      </sup>
   </xsl:template>
   <xsl:template match="emph">
      <b>
         <xsl:apply-templates/>
      </b>
   </xsl:template>
   <xsl:template match="emph[@rend='bold']">
      <strong>
         <xsl:apply-templates/>
      </strong>
   </xsl:template>
   <xsl:template match="emph[@rend='italics']">
      <I>
         <xsl:apply-templates/>
      </I>
   </xsl:template>
   <xsl:template match="emph[@rend='italic']">
      <I>
         <xsl:apply-templates/>
      </I>
   </xsl:template>
   <xsl:template match="emph[@rend='underline']">
      <U>
         <xsl:apply-templates/>
      </U>
   </xsl:template>
   <xsl:template match="emph[@rend='sup']">
      <sup>
         <xsl:apply-templates/>
      </sup>
   </xsl:template>

   <!-- TABLES -->

   <xsl:template match="table">
      <table border="0">
         <xsl:apply-templates/>
      </table>
   </xsl:template>
   <xsl:template match="row">
      <tr wrap="nowrap">
         <xsl:apply-templates/>
      </tr>
   </xsl:template>
   <xsl:template match="cell">
      <td>
         <xsl:apply-templates/>
      </td>
   </xsl:template>
   <!-- LISTS -->
   <xsl:template match="list">
      <ul>
         <xsl:apply-templates/>
      </ul>
   </xsl:template>
   <xsl:template match="item">
      <li>
         <xsl:apply-templates/>
      </li>
      <br/>
      <br/>
   </xsl:template>
</xsl:stylesheet>
