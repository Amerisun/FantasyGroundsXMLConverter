<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" version="2.0">
	<xsl:output method = "text" encoding = "iso-8859-1"/>
	<xsl:strip-space elements="*"/>
   
	<xsl:template match="/">
		<xsl:text>{&#10;</xsl:text>
		<xsl:for-each select="//character">
			<xsl:variable name="lowercase" select="'abcdefghijklmnopqrstuvwxyz'" />
			<xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
			<xsl:variable name="strBonus" select="abilities/strength/bonus" />
			<xsl:variable name="dexBonus" select="abilities/dexterity/bonus" />
			<xsl:variable name="conBonus" select="abilities/constitution/bonus" />
			<xsl:variable name="intBonus" select="abilities/intelligence/bonus" />
			<xsl:variable name="wisBonus" select="abilities/wisdom/bonus" />
			<xsl:variable name="chaBonus" select="abilities/charisma/bonus" />
			<xsl:variable name="profBonus" select="profbonus" />
			
			<!-- Core Info -->
			<xsl:text>      &#10;        "playerName":"</xsl:text>			
			<xsl:value-of select="name" /><xsl:text>"</xsl:text>
			<xsl:text>      &#10;        "background":"</xsl:text>			
			<xsl:value-of select="background" /><xsl:text>"</xsl:text>
			<xsl:text>      &#10;        "faction":"</xsl:text>			
			<xsl:value-of select="faction" /><xsl:text>"</xsl:text>
			<xsl:text>      &#10;        "race":"</xsl:text>			
			<xsl:value-of select="race" /><xsl:text>"</xsl:text>
			<xsl:text>      &#10;        "alignment":"</xsl:text>			
			<xsl:value-of select="alignment" /><xsl:text>"</xsl:text>
			<xsl:text>      &#10;        "xp":"</xsl:text>			
			<xsl:value-of select="exp" /><xsl:text>"</xsl:text>
			<xsl:text>      &#10;        "dciNo":"</xsl:text>			
			<xsl:value-of select="dci" /><xsl:text>"</xsl:text>
			<xsl:text>      &#10;        "classLevel":"</xsl:text>	

			<!-- Class and Level -->
				
			<!-- Abbreviate if more than 1 class -->
			<xsl:if test="count(classes/*) &gt; 1">
				<xsl:for-each select="classes/*">
					<xsl:value-of select="substring(concat(name,'   '),1,3)" />(<xsl:value-of select="level" />) </xsl:for-each>				
			</xsl:if>
			<!-- otherwise show the full class name -->
			<xsl:if test="count(classes/*) &lt; 2">
				<xsl:for-each select="classes/*">
					<xsl:value-of select="name" />(<xsl:value-of select="level" />)</xsl:for-each>
			</xsl:if>
			<xsl:text>"</xsl:text>
      
			<!-- Stats -->				
			<xsl:text>      &#10;        "str":"</xsl:text>	
			<xsl:value-of select="abilities/strength/score" /><xsl:text>"</xsl:text>
			<xsl:text>      &#10;        "dex":"</xsl:text>	
			<xsl:value-of select="abilities/dexterity/score" /><xsl:text>"</xsl:text>
			<xsl:text>      &#10;        "con":"</xsl:text>	
			<xsl:value-of select="abilities/constitution/score" /><xsl:text>"</xsl:text>
			<xsl:text>      &#10;        "int":"</xsl:text>	
			<xsl:value-of select="abilities/intelligence/score" /><xsl:text>"</xsl:text>
			<xsl:text>      &#10;        "wis":"</xsl:text>	
			<xsl:value-of select="abilities/wisdom/score" /><xsl:text>"</xsl:text>
			<xsl:text>      &#10;        "cha":"</xsl:text>	
			<xsl:value-of select="abilities/charisma/score" /><xsl:text>"</xsl:text>

			<!-- Inspiration -->
		    <xsl:text>      &#10;        "inspiration":"</xsl:text>
			<xsl:value-of select="inspiration" /><xsl:text>"</xsl:text>
		    <!-- Proficiency Bonus -->
		    <xsl:text>      &#10;        "proficiencyBonus":"</xsl:text>
		    <xsl:if test="profbonus >= 0">+</xsl:if><xsl:value-of select="profbonus" /><xsl:text>"</xsl:text>
			
			<!-- Saves -->
			<xsl:text>      &#10;        "strSave":"</xsl:text>
			<xsl:if test="abilities/strength/save >= 0">+</xsl:if><xsl:value-of select="abilities/strength/save" /><xsl:text>"</xsl:text>
			<xsl:choose>
				<xsl:when test="abilities/strength/saveprof = 1" >
					<xsl:text>      &#10;        "strSaveChecked":true</xsl:text>
				</xsl:when>
			</xsl:choose>
			
			<xsl:text>      &#10;        "dexSave":"</xsl:text>
			<xsl:if test="abilities/dexterity/save >= 0">+</xsl:if><xsl:value-of select="abilities/dexterity/save" /><xsl:text>"</xsl:text>
			<xsl:choose>
				<xsl:when test="abilities/dexterity/saveprof = 1" >
					<xsl:text>      &#10;        "dexSaveChecked":true</xsl:text>
				</xsl:when>
			</xsl:choose>
			
			<xsl:text>      &#10;        "conSave":"</xsl:text>
			<xsl:if test="abilities/constitution/save >= 0">+</xsl:if><xsl:value-of select="abilities/constitution/save" /><xsl:text>"</xsl:text>
			<xsl:choose>
				<xsl:when test="abilities/constitution/saveprof = 1" >
					<xsl:text>      &#10;        "conSaveChecked":true</xsl:text>
				</xsl:when>
			</xsl:choose>
			
			<xsl:text>      &#10;        "intSave":"</xsl:text>
			<xsl:if test="abilities/intelligence/save >= 0">+</xsl:if><xsl:value-of select="abilities/intelligence/save" /><xsl:text>"</xsl:text>
			<xsl:choose>
				<xsl:when test="abilities/intelligence/saveprof = 1" >
					<xsl:text>      &#10;        "intSaveChecked":true</xsl:text>
				</xsl:when>
			</xsl:choose>
			
			<xsl:text>      &#10;        "wisSave":"</xsl:text>
			<xsl:if test="abilities/wisdom/save >= 0">+</xsl:if><xsl:value-of select="abilities/wisdom/save" /><xsl:text>"</xsl:text>
			<xsl:choose>
				<xsl:when test="abilities/wisdom/saveprof = 1" >
					<xsl:text>      &#10;        "wisSaveChecked":true</xsl:text>
				</xsl:when>
			</xsl:choose>

			<xsl:text>      &#10;        "chaSave":"</xsl:text>
			<xsl:if test="abilities/charisma/save >= 0">+</xsl:if><xsl:value-of select="abilities/charisma/save" /><xsl:text>"</xsl:text>
			<xsl:choose>
				<xsl:when test="abilities/charisma/saveprof = 1" >
					<xsl:text>      &#10;        "chaSaveChecked":true</xsl:text>
				</xsl:when>
			</xsl:choose>
			
			<!-- Skills -->
			<xsl:text>      &#10;        "skillAcrobatics":"</xsl:text>
			<xsl:if test="skilllist/*[name='Acrobatics']/total >= 0">+</xsl:if><xsl:value-of select="skilllist/*[name='Acrobatics']/total" />
			<xsl:if test="skilllist/*[name='Animal Handling']/total >= 0">+</xsl:if><xsl:value-of select="skilllist/*[name='Animal Handling']/total" />
			<xsl:if test="skilllist/*[name='Arcana']/total >= 0">+</xsl:if><xsl:value-of select="skilllist/*[name='Arcana']/total" />
			<xsl:if test="skilllist/*[name='Athletics']/total >= 0">+</xsl:if><xsl:value-of select="skilllist/*[name='Athletics']/total" />
			<xsl:if test="skilllist/*[name='Deception']/total >= 0">+</xsl:if><xsl:value-of select="skilllist/*[name='Deception']/total" />
			<xsl:if test="skilllist/*[name='History']/total >= 0">+</xsl:if><xsl:value-of select="skilllist/*[name='History']/total" />
			<xsl:if test="skilllist/*[name='Insight']/total >= 0">+</xsl:if><xsl:value-of select="skilllist/*[name='Insight']/total" />
			<xsl:if test="skilllist/*[name='Intimidation']/total >= 0">+</xsl:if><xsl:value-of select="skilllist/*[name='Intimidation']/total" />
			<xsl:if test="skilllist/*[name='Investigation']/total >= 0">+</xsl:if><xsl:value-of select="skilllist/*[name='Investigation']/total" />
			<xsl:if test="skilllist/*[name='Medicine']/total >= 0">+</xsl:if><xsl:value-of select="skilllist/*[name='Medicine']/total" />
			<xsl:if test="skilllist/*[name='Nature']/total >= 0">+</xsl:if><xsl:value-of select="skilllist/*[name='Nature']/total" />
			<xsl:if test="skilllist/*[name='Perception']/total >= 0">+</xsl:if><xsl:value-of select="skilllist/*[name='Perception']/total" />
			<xsl:if test="skilllist/*[name='Performance']/total >= 0">+</xsl:if><xsl:value-of select="skilllist/*[name='Performance']/total" />
			<xsl:if test="skilllist/*[name='Persuasion']/total >= 0">+</xsl:if><xsl:value-of select="skilllist/*[name='Persuasion']/total" />
			<xsl:if test="skilllist/*[name='Religion']/total >= 0">+</xsl:if><xsl:value-of select="skilllist/*[name='Religion']/total" />
			<xsl:if test="skilllist/*[name='Sleight of Hand']/total >= 0">+</xsl:if><xsl:value-of select="skilllist/*[name='Sleight of Hand']/total" />
			<xsl:if test="skilllist/*[name='Stealth']/total >= 0">+</xsl:if><xsl:value-of select="skilllist/*[name='Stealth']/total" />
			<xsl:if test="skilllist/*[name='Survival']/total >= 0">+</xsl:if><xsl:value-of select="skilllist/*[name='Survival']/total" />
			
			<!-- Passive Perception -->
			<xsl:value-of select="perception" />
			
			<!-- AC, Initiative and Speed -->
			<xsl:value-of select="defenses/ac/total" />
			<xsl:if test="initiative/total">+</xsl:if><xsl:value-of select="initiative/total" />
			<xsl:value-of select="speed/total" />
			
			<!-- HP -->
			<xsl:value-of select="hp/total" />
			
			
			
			<!-- Hit Die -->
			
			<xsl:for-each select="classes/*">
				<xsl:call-template name="checkboxes">
					<xsl:with-param name="index" select="1" />
					<xsl:with-param name="total" select="level" />
				</xsl:call-template>
				<xsl:value-of select="hddie" />
				<xsl:text> </xsl:text>
			</xsl:for-each>
			
			
			<!-- Personality Traits -->
			<xsl:value-of select="personalitytraits" />
			<xsl:value-of select="ideals" />
			<xsl:value-of select="bonds" />
			<xsl:value-of select="flaws" />
			
			<!-- Features and Traits -->
			
			<xsl:for-each select="featurelist/*">
				<xsl:value-of select="name" /><br />
			</xsl:for-each>
			<xsl:for-each select="traitlist/*">
				<xsl:value-of select="name" /><br />
			</xsl:for-each>
			
			
			
			<!-- Languages and Proficiencies -->
			
			<!-- languages -->
			<xsl:if test="count(languagelist/*) &gt; 0">
				Langagues. 
			</xsl:if>
			<xsl:for-each select="languagelist/*">
				<xsl:if test="(position() &gt; 1)">, </xsl:if>
				<xsl:value-of select="name" />
			</xsl:for-each>
			<xsl:if test="count(languagelist/*) &gt; 0">;<xsl:text> </xsl:text></xsl:if>
			<!-- Proficiency List -->
			<xsl:if test="count(languagelist/*) &gt; 0">
				<br />Proficiencies: 
			</xsl:if>
			<xsl:for-each select="proficiencylist/*">
				<xsl:if test="(position() &gt; 1)">, </xsl:if>
				<xsl:value-of select="name" />
			</xsl:for-each>
			<xsl:if test="count(proficiencylist/*) &gt; 0">;<xsl:text> </xsl:text></xsl:if>
			
			
			<!-- Weapons and Attacks -->
			<xsl:for-each select="weaponlist/*">
				<xsl:value-of select="name" />
				<!-- melee -->					
				<xsl:if test="type=0">
					<xsl:if test="prof &gt; 0">
						+<xsl:value-of select="$strBonus + $profBonus + attackbonus" /><xsl:value-of select="damagelist/*[1]/dice" />+<xsl:value-of select="$strBonus" />
					</xsl:if>
					<xsl:if test="prof &lt; 1">
						+<xsl:value-of select="$strBonus + attackbonus" /><xsl:value-of select="damagelist/*[1]/dice" />+<xsl:value-of select="$strBonus" />
					</xsl:if>
				</xsl:if>

				<!-- ranged -->
				<xsl:if test="type=1">
					<xsl:if test="prof &gt; 0">
						+<xsl:value-of select="$dexBonus + $profBonus + attackbonus" /><xsl:value-of select="damagelist/*[1]/dice" />
					</xsl:if>
					<xsl:if test="prof &lt; 1">
						+<xsl:value-of select="$dexBonus + attackbonus" /><xsl:value-of select="damagelist/*[1]/dice" />
					</xsl:if>					
				</xsl:if>
				
				<!-- thrown -->
				<xsl:if test="type=2">
					<xsl:if test="prof &gt; 0">
						+<xsl:value-of select="$strBonus + $profBonus + attackbonus" /><xsl:value-of select="damagelist/*[1]/dice" />+<xsl:value-of select="$strBonus" />
					</xsl:if>
					<xsl:if test="prof &lt; 1">
						+<xsl:value-of select="$strBonus + attackbonus" /><xsl:value-of select="damagelist/*[1]/dice" />+<xsl:value-of select="$strBonus" />
					</xsl:if>
				</xsl:if>
				
			</xsl:for-each>
				
			<!-- Equipment -->
			
			<xsl:for-each select="inventorylist/*">
				<xsl:value-of select="name" /><xsl:if test="quantity &gt; 1">(<xsl:value-of select="count" />)</xsl:if>, 
			</xsl:for-each>
			
			<!-- Coins -->
			
			<xsl:value-of select="coins/*[name='cp']/amount" />
			
			<xsl:value-of select="coins/*[name='sp']/amount" />
			
			<xsl:value-of select="coins/*[name='ep']/amount" />
			
			<xsl:value-of select="coins/*[name='gp']/amount" />
			
			<xsl:value-of select="coins/*[name='pp']/amount" />
			
			<!-- End of Character -->
		</xsl:for-each>
	</xsl:template>


  <xsl:template name="checkboxes">
    <xsl:param name="index" />
    <xsl:param name="total" />
    <!-- Loop processing. Wish we could use XSLT 2.0 -->
    <xsl:if test="not($index = $total)">
      <xsl:call-template name="checkboxes">
        <xsl:with-param name="index" select="$index + 1" />
        <xsl:with-param name="total" select="$total" />
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>