<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method = "text" encoding = "UTF-8"/>
	<xsl:strip-space elements="*"/>
	<xsl:variable name="single_quote"><xsl:text>'</xsl:text></xsl:variable>
	<xsl:template match="//character">
		<xsl:text>{</xsl:text>
		<xsl:variable name="lowercase" select="'abcdefghijklmnopqrstuvwxyz'" />
		<xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
		<xsl:variable name="strBonus" select="abilities/strength/bonus" />
		<xsl:variable name="dexBonus" select="abilities/dexterity/bonus" />
		<xsl:variable name="conBonus" select="abilities/constitution/bonus" />
		<xsl:variable name="intBonus" select="abilities/intelligence/bonus" />
		<xsl:variable name="wisBonus" select="abilities/wisdom/bonus" />
		<xsl:variable name="chaBonus" select="abilities/charisma/bonus" />
		<xsl:variable name="profBonus" select="profbonus" />
		<xsl:variable name="newline" select="'&#10;'"/>
		<xsl:variable name="doublequotes" select="'&#x22;'"/>
		
		<!-- Core Info -->
		<xsl:text>      &#10;        "name":"</xsl:text>			
		<xsl:value-of select="name" /><xsl:text>",</xsl:text>
		<xsl:text>      &#10;        "background":"</xsl:text>			
		<xsl:value-of select="background" /><xsl:text>",</xsl:text>
		<xsl:text>      &#10;        "race":"</xsl:text>			
		<xsl:value-of select="race" /><xsl:text>",</xsl:text>
		<xsl:text>      &#10;        "alignment":"</xsl:text>			
		<xsl:value-of select="alignment" /><xsl:text>",</xsl:text>
		<xsl:text>      &#10;        "xp":"</xsl:text>			
		<xsl:value-of select="exp" /><xsl:text>",</xsl:text>
		
		<!-- DCI No -->
		<xsl:if test="dci != ''">
			<xsl:text>      &#10;        "dciNo":"</xsl:text>
			<xsl:value-of select="dci" /><xsl:text>",</xsl:text>
		</xsl:if>
		
		<!-- Faction -->
		<xsl:if test="faction != ''">
			<xsl:text>      &#10;        "faction":"</xsl:text>			
			<xsl:value-of select="faction" /><xsl:text>",</xsl:text>
		</xsl:if>

		<!-- Class and Level -->
		<xsl:text>      &#10;        "classLevel":"</xsl:text>		
		<!-- Abbreviate if more than 1 class -->
		<xsl:if test="count(classes/*) &gt; 1">
			<xsl:for-each select="classes/*">
				<xsl:value-of select="substring(concat(name,'   '),1,4)" />(<xsl:value-of select="level" />) </xsl:for-each>				
		</xsl:if>
		<!-- otherwise show the full class name -->
		<xsl:if test="count(classes/*) &lt; 2">
			<xsl:for-each select="classes/*">
				<xsl:value-of select="name" />(<xsl:value-of select="level" />)</xsl:for-each>
		</xsl:if>
		<xsl:text>",</xsl:text>
  
		<!-- Stats -->				
		<xsl:text>      &#10;        "str":"</xsl:text>	
		<xsl:value-of select="abilities/strength/score" /><xsl:text>",</xsl:text>
		<xsl:text>      &#10;        "dex":"</xsl:text>	
		<xsl:value-of select="abilities/dexterity/score" /><xsl:text>",</xsl:text>
		<xsl:text>      &#10;        "con":"</xsl:text>	
		<xsl:value-of select="abilities/constitution/score" /><xsl:text>",</xsl:text>
		<xsl:text>      &#10;        "int":"</xsl:text>	
		<xsl:value-of select="abilities/intelligence/score" /><xsl:text>",</xsl:text>
		<xsl:text>      &#10;        "wis":"</xsl:text>	
		<xsl:value-of select="abilities/wisdom/score" /><xsl:text>",</xsl:text>
		<xsl:text>      &#10;        "cha":"</xsl:text>	
		<xsl:value-of select="abilities/charisma/score" /><xsl:text>",</xsl:text>

		<!-- Inspiration -->
		<xsl:text>      &#10;        "inspiration":"</xsl:text>
		<xsl:value-of select="inspiration" /><xsl:text>",</xsl:text>
		<!-- Proficiency Bonus -->
		<xsl:text>      &#10;        "proficiencyBonus":"</xsl:text>
		<xsl:if test="profbonus >= 0">+</xsl:if><xsl:value-of select="profbonus" /><xsl:text>",</xsl:text>
		
		<!-- Saves -->
		<xsl:text>      &#10;        "strSave":"</xsl:text>
		<xsl:if test="abilities/strength/save >= 0">+</xsl:if><xsl:value-of select="abilities/strength/save" /><xsl:text>",</xsl:text>
		<xsl:choose>
			<xsl:when test="abilities/strength/saveprof = 1" >
				<xsl:text>      &#10;        "strSaveChecked":true,</xsl:text>
			</xsl:when>
		</xsl:choose>
		
		<xsl:text>      &#10;        "dexSave":"</xsl:text>
		<xsl:if test="abilities/dexterity/save >= 0">+</xsl:if><xsl:value-of select="abilities/dexterity/save" /><xsl:text>",</xsl:text>
		<xsl:choose>
			<xsl:when test="abilities/dexterity/saveprof = 1" >
				<xsl:text>      &#10;        "dexSaveChecked":true,</xsl:text>
			</xsl:when>
		</xsl:choose>
		
		<xsl:text>      &#10;        "conSave":"</xsl:text>
		<xsl:if test="abilities/constitution/save >= 0">+</xsl:if><xsl:value-of select="abilities/constitution/save" /><xsl:text>",</xsl:text>
		<xsl:choose>
			<xsl:when test="abilities/constitution/saveprof = 1" >
				<xsl:text>      &#10;        "conSaveChecked":true,</xsl:text>
			</xsl:when>
		</xsl:choose>
		
		<xsl:text>      &#10;        "intSave":"</xsl:text>
		<xsl:if test="abilities/intelligence/save >= 0">+</xsl:if><xsl:value-of select="abilities/intelligence/save" /><xsl:text>",</xsl:text>
		<xsl:choose>
			<xsl:when test="abilities/intelligence/saveprof = 1" >
				<xsl:text>      &#10;        "intSaveChecked":true,</xsl:text>
			</xsl:when>
		</xsl:choose>
		
		<xsl:text>      &#10;        "wisSave":"</xsl:text>
		<xsl:if test="abilities/wisdom/save >= 0">+</xsl:if><xsl:value-of select="abilities/wisdom/save" /><xsl:text>",</xsl:text>
		<xsl:choose>
			<xsl:when test="abilities/wisdom/saveprof = 1" >
				<xsl:text>      &#10;        "wisSaveChecked":true,</xsl:text>
			</xsl:when>
		</xsl:choose>

		<xsl:text>      &#10;        "chaSave":"</xsl:text>
		<xsl:if test="abilities/charisma/save >= 0">+</xsl:if><xsl:value-of select="abilities/charisma/save" /><xsl:text>",</xsl:text>
		<xsl:choose>
			<xsl:when test="abilities/charisma/saveprof = 1" >
				<xsl:text>      &#10;        "chaSaveChecked":true,</xsl:text>
			</xsl:when>
		</xsl:choose>
		
		<!-- Skills -->
		<xsl:text>      &#10;        "skillAcrobatics":"</xsl:text>
		<xsl:if test="skilllist/*[name='Acrobatics']/total >= 0">+</xsl:if><xsl:value-of select="skilllist/*[name='Acrobatics']/total" />
		<xsl:text>",</xsl:text>
		<xsl:if test="skilllist/*[name='Acrobatics']/prof > 0">
			<xsl:text>      &#10;        "skillAcrobaticsChecked":true,</xsl:text>
		</xsl:if>
		
		<xsl:text>      &#10;        "skillAnimalHandling":"</xsl:text>
		<xsl:if test="skilllist/*[name='Animal Handling']/total >= 0">+</xsl:if><xsl:value-of select="skilllist/*[name='Animal Handling']/total" />
		<xsl:text>",</xsl:text>
		<xsl:if test="skilllist/*[name='Animal Handling']/prof > 0">
			<xsl:text>      &#10;        "skillAnimalHandlingChecked":true,</xsl:text>
		</xsl:if>
		
		<xsl:text>      &#10;        "skillArcana":"</xsl:text>
		<xsl:if test="skilllist/*[name='Arcana']/total >= 0">+</xsl:if><xsl:value-of select="skilllist/*[name='Arcana']/total" />
		<xsl:text>",</xsl:text>
		<xsl:if test="skilllist/*[name='Arcana']/prof > 0">
			<xsl:text>      &#10;        "skillArcanaChecked":true,</xsl:text>
		</xsl:if>
		
		<xsl:text>      &#10;        "skillAthletics":"</xsl:text>
		<xsl:if test="skilllist/*[name='Athletics']/total >= 0">+</xsl:if><xsl:value-of select="skilllist/*[name='Athletics']/total" />
		<xsl:text>",</xsl:text>
		<xsl:if test="skilllist/*[name='Athletics']/prof > 0">
			<xsl:text>      &#10;        "skillAthleticsChecked":true,</xsl:text>
		</xsl:if>
		
		<xsl:text>      &#10;        "skillDeception":"</xsl:text>
		<xsl:if test="skilllist/*[name='Deception']/total >= 0">+</xsl:if><xsl:value-of select="skilllist/*[name='Deception']/total" />
		<xsl:text>",</xsl:text>
		<xsl:if test="skilllist/*[name='Deception']/prof > 0">
			<xsl:text>      &#10;        "skillDeceptionChecked":true,</xsl:text>
		</xsl:if>
		
		<xsl:text>      &#10;        "skillHistory":"</xsl:text>
		<xsl:if test="skilllist/*[name='History']/total >= 0">+</xsl:if><xsl:value-of select="skilllist/*[name='History']/total" />
		<xsl:text>",</xsl:text>
		<xsl:if test="skilllist/*[name='History']/prof > 0">
			<xsl:text>      &#10;        "skillHistoryChecked":true,</xsl:text>
		</xsl:if>
		
		<xsl:text>      &#10;        "skillInsight":"</xsl:text>
		<xsl:if test="skilllist/*[name='Insight']/total >= 0">+</xsl:if><xsl:value-of select="skilllist/*[name='Insight']/total" />
		<xsl:text>",</xsl:text>
		<xsl:if test="skilllist/*[name='Insight']/prof > 0">
			<xsl:text>      &#10;        "skillInsightChecked":true,</xsl:text>
		</xsl:if>
		
		<xsl:text>      &#10;        "skillIntimidation":"</xsl:text>
		<xsl:if test="skilllist/*[name='Intimidation']/total >= 0">+</xsl:if><xsl:value-of select="skilllist/*[name='Intimidation']/total" />
		<xsl:text>",</xsl:text>
		<xsl:if test="skilllist/*[name='Intimidation']/prof > 0">
			<xsl:text>      &#10;        "skillIntimidationChecked":true,</xsl:text>
		</xsl:if>
		
		<xsl:text>      &#10;        "skillInvestigation":"</xsl:text>
		<xsl:if test="skilllist/*[name='Investigation']/total >= 0">+</xsl:if><xsl:value-of select="skilllist/*[name='Investigation']/total" />
		<xsl:text>",</xsl:text>
		<xsl:if test="skilllist/*[name='Investigation']/prof > 0">
			<xsl:text>      &#10;        "skillInvestigationChecked":true,</xsl:text>
		</xsl:if>
		
		<xsl:text>      &#10;        "skillMedicine":"</xsl:text>
		<xsl:if test="skilllist/*[name='Medicine']/total >= 0">+</xsl:if><xsl:value-of select="skilllist/*[name='Medicine']/total" />
		<xsl:text>",</xsl:text>
		<xsl:if test="skilllist/*[name='Medicine']/prof > 0">
			<xsl:text>      &#10;        "skillMedicineChecked":true,</xsl:text>
		</xsl:if>
		
		<xsl:text>      &#10;        "skillNature":"</xsl:text>
		<xsl:if test="skilllist/*[name='Nature']/total >= 0">+</xsl:if><xsl:value-of select="skilllist/*[name='Nature']/total" />
		<xsl:text>",</xsl:text>
		<xsl:if test="skilllist/*[name='Nature']/prof > 0">
			<xsl:text>      &#10;        "skillNatureChecked":true,</xsl:text>
		</xsl:if>
		
		<xsl:text>      &#10;        "skillPerception":"</xsl:text>
		<xsl:if test="skilllist/*[name='Perception']/total >= 0">+</xsl:if><xsl:value-of select="skilllist/*[name='Perception']/total" />
		<xsl:text>",</xsl:text>
		<xsl:if test="skilllist/*[name='Perception']/prof > 0">
			<xsl:text>      &#10;        "skillPerceptionChecked":true,</xsl:text>
		</xsl:if>
		
		<xsl:text>      &#10;        "skillPerformance":"</xsl:text>
		<xsl:if test="skilllist/*[name='Performance']/total >= 0">+</xsl:if><xsl:value-of select="skilllist/*[name='Performance']/total" />
		<xsl:text>",</xsl:text>
		<xsl:if test="skilllist/*[name='Performance']/prof > 0">
			<xsl:text>      &#10;        "skillPerformanceChecked":true,</xsl:text>
		</xsl:if>
		
		<xsl:text>      &#10;        "skillPersuasion":"</xsl:text>
		<xsl:if test="skilllist/*[name='Persuasion']/total >= 0">+</xsl:if><xsl:value-of select="skilllist/*[name='Persuasion']/total" />
		<xsl:text>",</xsl:text>
		<xsl:if test="skilllist/*[name='Persuasion']/prof > 0">
			<xsl:text>      &#10;        "skillPersuasionChecked":true,</xsl:text>
		</xsl:if>
		
		<xsl:text>      &#10;        "skillReligion":"</xsl:text>
		<xsl:if test="skilllist/*[name='Religion']/total >= 0">+</xsl:if><xsl:value-of select="skilllist/*[name='Religion']/total" />
		<xsl:text>",</xsl:text>
		<xsl:if test="skilllist/*[name='Religion']/prof > 0">
			<xsl:text>      &#10;        "skillReligionChecked":true,</xsl:text>
		</xsl:if>
		
		<xsl:text>      &#10;        "skillSlightOfHand":"</xsl:text>
		<xsl:if test="skilllist/*[name='Sleight of Hand']/total >= 0">+</xsl:if><xsl:value-of select="skilllist/*[name='Sleight of Hand']/total" />
		<xsl:text>",</xsl:text>
		<xsl:if test="skilllist/*[name='Sleight of Hand']/prof > 0">
			<xsl:text>      &#10;        "skillSlightOfHandChecked":true,</xsl:text>
		</xsl:if>
		
		<xsl:text>      &#10;        "skillStealth":"</xsl:text>
		<xsl:if test="skilllist/*[name='Stealth']/total >= 0">+</xsl:if><xsl:value-of select="skilllist/*[name='Stealth']/total" />
		<xsl:text>",</xsl:text>
		<xsl:if test="skilllist/*[name='Stealth']/prof > 0">
			<xsl:text>      &#10;        "skillStealthChecked":true,</xsl:text>
		</xsl:if>
		
		<xsl:text>      &#10;        "skillSurvival":"</xsl:text>
		<xsl:if test="skilllist/*[name='Survival']/total >= 0">+</xsl:if><xsl:value-of select="skilllist/*[name='Survival']/total" />
		<xsl:text>",</xsl:text>
		<xsl:if test="skilllist/*[name='Survival']/prof > 0">
			<xsl:text>      &#10;        "skillSurvivalChecked":true,</xsl:text>
		</xsl:if>
		
		
		<!-- Passive Perception -->
		<xsl:text>      &#10;        "perception":"</xsl:text>
		<xsl:value-of select="perception" />
		<xsl:text>",</xsl:text>
		
		<!-- AC, Initiative and Speed -->
		<xsl:text>      &#10;        "ac":"</xsl:text>
		<xsl:value-of select="defenses/ac/total" />
		<xsl:text>",</xsl:text>
		
		<xsl:text>      &#10;        "init":"</xsl:text>
		<xsl:if test="initiative/total">+</xsl:if><xsl:value-of select="initiative/total" />
		<xsl:text>",</xsl:text>
		
		<xsl:text>      &#10;        "speed":"</xsl:text>
		<xsl:value-of select="speed/total" />
		<xsl:text>",</xsl:text>
		
		<!-- HP -->
		<xsl:text>      &#10;        "maxHp":"</xsl:text>
		<xsl:value-of select="hp/total" />
		<xsl:text>",</xsl:text> 
		
		<xsl:text>      &#10;        "tempHp":"</xsl:text>
		<xsl:value-of select="hp/temporary" />
		<xsl:text>",</xsl:text> 
		
		<xsl:text>      &#10;        "hp":"</xsl:text>
		<xsl:value-of select="hp/total - hp/wounds" />
		<xsl:text>",</xsl:text> 

		<!-- Personality Traits -->
		<xsl:text>      &#10;        "personalityTraits":"</xsl:text>
		<xsl:value-of select="translate(personalitytraits, $doublequotes, $single_quote)" />
		<xsl:text>",</xsl:text> 
		
		<xsl:text>      &#10;        "ideals":"</xsl:text>
		<xsl:value-of select="translate(ideals, $doublequotes,$single_quote)" />
		<xsl:text>",</xsl:text> 
		
		<xsl:text>      &#10;        "bonds":"</xsl:text>
		<xsl:value-of select="translate(bonds, $doublequotes,$single_quote)" />
		<xsl:text>",</xsl:text> 
		
		<xsl:text>      &#10;        "flaws":"</xsl:text>
		<xsl:value-of select="translate(flaws, $doublequotes,$single_quote)" />
		<xsl:text>",</xsl:text> 
		
		<!-- Features and Traits -->
		<xsl:text>      &#10;        "featuresTraits":"</xsl:text>
		<xsl:text>Features: \n</xsl:text>
		<xsl:variable name="featureset" select="featurelist/*" />
		<xsl:variable name="featurecount" select="count($featureset)" />
		<xsl:for-each select="featurelist/*">
			<xsl:value-of select="name" />
			<xsl:if test="(position() &lt; $featurecount)">, </xsl:if>
		</xsl:for-each>
		<xsl:text>\nTraits: \n</xsl:text>
		<xsl:variable name="traitset" select="traitlist/*" />
		<xsl:variable name="traitcount" select="count($traitset)" />
		<xsl:for-each select="traitlist/*">
			<xsl:value-of select="name" /><br />
			<xsl:if test="(position() &lt; $traitcount)">, </xsl:if>
		</xsl:for-each>
		<xsl:text>",</xsl:text> 
		
		<!-- Languages -->
		<xsl:text>      &#10;        "otherProficiencies":"</xsl:text>
		<xsl:if test="count(languagelist/*) &gt; 0">Langagues:\n</xsl:if>
		<xsl:for-each select="languagelist/*">
			<xsl:if test="(position() &gt; 1)">, </xsl:if>
			<xsl:value-of select="name" />
		</xsl:for-each>
		<!-- <xsl:if test="count(languagelist/*) &gt; 0">;<xsl:text> </xsl:text></xsl:if> -->
		
		<!-- Proficiency List -->
		<xsl:if test="count(languagelist/*) &gt; 0">\n\nProficiencies:\n</xsl:if>
		<xsl:for-each select="proficiencylist/*">
			<xsl:if test="(position() &gt; 1)">\n</xsl:if>
			<xsl:value-of select="name" />
		</xsl:for-each>
		<!-- <xsl:if test="count(proficiencylist/*) &gt; 0">;<xsl:text> </xsl:text></xsl:if> -->
		<xsl:text>",</xsl:text>
		
		<!-- Weapons and Attacks -->
		<xsl:text>      &#10;        "attacksText":"</xsl:text>
		<xsl:variable name="weaponslistcount" select="count(weaponlist/*)" />
		<xsl:for-each select="weaponlist/*">		
			<!-- melee -->					
			<xsl:if test="type=0">
				<xsl:value-of select="name" />
				<xsl:if test="prof &gt; 0"> +<xsl:value-of select="sum($strBonus | $profBonus | attackbonus)" /> (<xsl:value-of select="damagelist/*[1]/dice" />+<xsl:value-of select="$strBonus" />)</xsl:if>
				<xsl:if test="prof &lt; 1"> +<xsl:value-of select="sum($strBonus | attackbonus)" /> (<xsl:value-of select="damagelist/*[1]/dice" />+<xsl:value-of select="$strBonus" />)</xsl:if>
			</xsl:if>

			<!-- ranged -->
			<xsl:if test="type=1">
				<xsl:value-of select="name" />
				<xsl:if test="prof &gt; 0"> +<xsl:value-of select="sum($dexBonus | $profBonus | attackbonus)" /> (<xsl:value-of select="damagelist/*[1]/dice" />)</xsl:if>
				<xsl:if test="prof &lt; 1"> +<xsl:value-of select="sum($dexBonus | attackbonus)" /> (<xsl:value-of select="damagelist/*[1]/dice" />)</xsl:if>
			</xsl:if>
			
			<!-- thrown -->
			<xsl:if test="type=2">
				<xsl:value-of select="name" />
				<xsl:if test="prof &gt; 0"> +<xsl:value-of select="sum($strBonus | $profBonus | attackbonus)" /> (<xsl:value-of select="damagelist/*[1]/dice" />+<xsl:value-of select="$strBonus" />)</xsl:if>
				<xsl:if test="prof &lt; 1"> +<xsl:value-of select="sum($strBonus | attackbonus)" /> (<xsl:value-of select="damagelist/*[1]/dice" />+<xsl:value-of select="$strBonus" />)</xsl:if>
			</xsl:if>
			<xsl:if test="$weaponslistcount &gt; position()">, </xsl:if>
		</xsl:for-each>
		<xsl:text>",</xsl:text> 
		
		
		
		<!-- Coins -->
		<!-- Trying to make up for various forms of coins were recorded through time in FG -->
		<xsl:choose>
			<xsl:when test="coins/*[name='CP']/amount != ''">
				<xsl:text>      &#10;        "cp":"</xsl:text>
				<xsl:value-of select="coins/*[name='CP']/amount" /><xsl:text>",</xsl:text>
			</xsl:when>
			<xsl:when test="coins/*[name='cp']/amount != ''">
				<xsl:text>      &#10;        "cp":"</xsl:text>
				<xsl:value-of select="coins/*[name='cp']/amount" /><xsl:text>",</xsl:text>
			</xsl:when>
			<xsl:when test="coins/*[name='Copper']/amount != ''">
				<xsl:text>      &#10;        "cp":"</xsl:text>
				<xsl:value-of select="coins/*[name='Copper']/amount" /><xsl:text>",</xsl:text>
			</xsl:when>
		</xsl:choose>
		
		<xsl:choose>
			<xsl:when test="coins/*[name='EP']/amount != ''">
				<xsl:text>      &#10;        "ep":"</xsl:text>
				<xsl:value-of select="coins/*[name='EP']/amount" /><xsl:text>",</xsl:text>
			</xsl:when>
			<xsl:when test="coins/*[name='ep']/amount != ''">
				<xsl:text>      &#10;        "ep":"</xsl:text>
				<xsl:value-of select="coins/*[name='ep']/amount" /><xsl:text>",</xsl:text>
			</xsl:when>
			<xsl:when test="coins/*[name='Electrum']/amount != ''">
				<xsl:text>      &#10;        "ep":"</xsl:text>
				<xsl:value-of select="coins/*[name='Electrum']/amount" /><xsl:text>",</xsl:text>
			</xsl:when>
		</xsl:choose>
		
		<xsl:choose>
			<xsl:when test="coins/*[name='GP']/amount != ''">
				<xsl:text>      &#10;        "gp":"</xsl:text>
				<xsl:value-of select="coins/*[name='GP']/amount" /><xsl:text>",</xsl:text>
			</xsl:when>
			<xsl:when test="coins/*[name='gp']/amount != ''">
				<xsl:text>      &#10;        "gp":"</xsl:text>
				<xsl:value-of select="coins/*[name='gp']/amount" /><xsl:text>",</xsl:text>
			</xsl:when>
			<xsl:when test="coins/*[name='Gold']/amount != ''">
				<xsl:text>      &#10;        "gp":"</xsl:text>
				<xsl:value-of select="coins/*[name='Gold']/amount" /><xsl:text>",</xsl:text>
			</xsl:when>
		</xsl:choose>
		
		<xsl:choose>
			<xsl:when test="coins/*[name='SP']/amount != ''">
				<xsl:text>      &#10;        "sp":"</xsl:text>
				<xsl:value-of select="coins/*[name='SP']/amount" /><xsl:text>",</xsl:text>
			</xsl:when>
			<xsl:when test="coins/*[name='sp']/amount != ''">
				<xsl:text>      &#10;        "sp":"</xsl:text>
				<xsl:value-of select="coins/*[name='sp']/amount" /><xsl:text>",</xsl:text>
			</xsl:when>
			<xsl:when test="coins/*[name='Silver']/amount != ''">
				<xsl:text>      &#10;        "cp":"</xsl:text>
				<xsl:value-of select="coins/*[name='Silver']/amount" /><xsl:text>",</xsl:text>
			</xsl:when>
		</xsl:choose>
		
		<xsl:choose>
			<xsl:when test="coins/*[name='PP']/amount != ''">
				<xsl:text>      &#10;        "pp":"</xsl:text>
				<xsl:value-of select="coins/*[name='PP']/amount" /><xsl:text>",</xsl:text>
			</xsl:when>
			<xsl:when test="coins/*[name='pp']/amount != ''">
				<xsl:text>      &#10;        "pp":"</xsl:text>
				<xsl:value-of select="coins/*[name='pp']/amount" /><xsl:text>",</xsl:text>
			</xsl:when>
			<xsl:when test="coins/*[name='Platinum']/amount != ''">
				<xsl:text>      &#10;        "pp":"</xsl:text>
				<xsl:value-of select="coins/*[name='Platinum']/amount" /><xsl:text>",</xsl:text>
			</xsl:when>
		</xsl:choose>
		
		<!-- Equipment -->
		<xsl:variable name="equipmentlistcount" select="count(inventorylist/*)" />
		<xsl:if test="$equipmentlistcount &gt; 0">
			<xsl:text>      &#10;        "equipment": "</xsl:text>
			<xsl:for-each select="inventorylist/*">
				<xsl:value-of select="name" /><xsl:if test="quantity &gt; 1">(<xsl:value-of select="count" />)</xsl:if><xsl:if test="$equipmentlistcount &gt; position()">, </xsl:if></xsl:for-each><xsl:text>",</xsl:text>
		</xsl:if>
		<!-- Spells -->
		<!-- Level 1 -->
		<xsl:text>      &#10;        "lvl1Spells": [ </xsl:text>
		<xsl:variable name="level1spellcounter" select="count(powers/*[group='Spells'][level='1'])" />
		<xsl:for-each select="powers/*[group='Spells'][level='1']">
			<xsl:text>      &#10;        	{</xsl:text>
				<xsl:text>      &#10;				</xsl:text>  	
				<xsl:text>"name":"</xsl:text><xsl:value-of select="name" />"<xsl:text>      &#10;        	}</xsl:text><xsl:if test="$level1spellcounter &gt; position()">,</xsl:if>
		</xsl:for-each>
		<xsl:text>&#10;		],</xsl:text>
		
		<!-- Level 2 -->
		<xsl:value-of select="$newline" />
		<xsl:text>        "lvl2Spells": [ </xsl:text>
		<xsl:variable name="level2spellcounter" select="count(powers/*[group='Spells'][level='2'])" />
		<xsl:for-each select="powers/*[group='Spells'][level='2']">
			<xsl:value-of select="$newline" /><xsl:text>        	{</xsl:text>
				<xsl:value-of select="$newline" /><xsl:text>				</xsl:text>  	
				<xsl:text>"name":"</xsl:text><xsl:value-of select="name" />"<xsl:value-of select="$newline" /><xsl:text>        	}</xsl:text><xsl:if test="$level2spellcounter &gt; position()">,</xsl:if>
		</xsl:for-each>
		<xsl:value-of select="$newline" /><xsl:text>		],</xsl:text>
		
		<!-- Level 3 -->
		<xsl:value-of select="$newline" />
		<xsl:text>        "lvl3Spells": [ </xsl:text>
		<xsl:variable name="level3spellcounter" select="count(powers/*[group='Spells'][level='3'])" />
		<xsl:for-each select="powers/*[group='Spells'][level='3']">
			<xsl:value-of select="$newline" /><xsl:text>        	{</xsl:text>
				<xsl:value-of select="$newline" /><xsl:text>				</xsl:text>  	
				<xsl:text>"name":"</xsl:text><xsl:value-of select="name" />"<xsl:value-of select="$newline" /><xsl:text>        	}</xsl:text><xsl:if test="$level3spellcounter &gt; position()">,</xsl:if>
		</xsl:for-each>
		<xsl:value-of select="$newline" /><xsl:text>		],</xsl:text>
		
		<!-- Level 4 -->
		<xsl:value-of select="$newline" />
		<xsl:text>        "lvl4Spells": [ </xsl:text>
		<xsl:variable name="level4spellcounter" select="count(powers/*[group='Spells'][level='4'])" />
		<xsl:for-each select="powers/*[group='Spells'][level='4']">
			<xsl:value-of select="$newline" /><xsl:text>        	{</xsl:text>
				<xsl:value-of select="$newline" /><xsl:text>				</xsl:text>  	
				<xsl:text>"name":"</xsl:text><xsl:value-of select="name" />"<xsl:value-of select="$newline" /><xsl:text>        	}</xsl:text><xsl:if test="$level4spellcounter &gt; position()">,</xsl:if>
		</xsl:for-each>
		<xsl:value-of select="$newline" /><xsl:text>		],</xsl:text>
		
		<!-- Level 5 -->
		<xsl:value-of select="$newline" />
		<xsl:text>        "lvl5Spells": [ </xsl:text>
		<xsl:variable name="level5spellcounter" select="count(powers/*[group='Spells'][level='5'])" />
		<xsl:for-each select="powers/*[group='Spells'][level='5']">
			<xsl:value-of select="$newline" /><xsl:text>        	{</xsl:text>
				<xsl:value-of select="$newline" /><xsl:text>				</xsl:text>  	
				<xsl:text>"name":"</xsl:text><xsl:value-of select="name" />"<xsl:value-of select="$newline" /><xsl:text>        	}</xsl:text><xsl:if test="$level5spellcounter &gt; position()">,</xsl:if>
		</xsl:for-each>
		<xsl:value-of select="$newline" /><xsl:text>		],</xsl:text>
		
		<!-- Level 6 -->
		<xsl:value-of select="$newline" />
		<xsl:text>        "lvl6Spells": [ </xsl:text>
		<xsl:variable name="level6spellcounter" select="count(powers/*[group='Spells'][level='6'])" />
		<xsl:for-each select="powers/*[group='Spells'][level='6']">
			<xsl:value-of select="$newline" /><xsl:text>        	{</xsl:text>
				<xsl:value-of select="$newline" /><xsl:text>				</xsl:text>  	
				<xsl:text>"name":"</xsl:text><xsl:value-of select="name" />"<xsl:value-of select="$newline" /><xsl:text>        	}</xsl:text><xsl:if test="$level6spellcounter &gt; position()">,</xsl:if>
		</xsl:for-each>
		<xsl:value-of select="$newline" /><xsl:text>		],</xsl:text>
		
		<!-- Level 7 -->
		<xsl:value-of select="$newline" />
		<xsl:text>        "lvl7Spells": [ </xsl:text>
		<xsl:variable name="level7spellcounter" select="count(powers/*[group='Spells'][level='7'])" />
		<xsl:for-each select="powers/*[group='Spells'][level='7']">
			<xsl:value-of select="$newline" /><xsl:text>        	{</xsl:text>
				<xsl:value-of select="$newline" /><xsl:text>				</xsl:text>  	
				<xsl:text>"name":"</xsl:text><xsl:value-of select="name" />"<xsl:value-of select="$newline" /><xsl:text>        	}</xsl:text><xsl:if test="$level7spellcounter &gt; position()">,</xsl:if>
		</xsl:for-each>
		<xsl:value-of select="$newline" /><xsl:text>		],</xsl:text>
		
		<!-- Level 8 -->
		<xsl:value-of select="$newline" />
		<xsl:text>        "lvl8Spells": [ </xsl:text>
		<xsl:variable name="level8spellcounter" select="count(powers/*[group='Spells'][level='8'])" />
		<xsl:for-each select="powers/*[group='Spells'][level='8']">
			<xsl:value-of select="$newline" /><xsl:text>        	{</xsl:text>
				<xsl:value-of select="$newline" /><xsl:text>				</xsl:text>  	
				<xsl:text>"name":"</xsl:text><xsl:value-of select="name" />"<xsl:value-of select="$newline" /><xsl:text>        	}</xsl:text><xsl:if test="$level8spellcounter &gt; position()">,</xsl:if>
		</xsl:for-each>
		<xsl:value-of select="$newline" /><xsl:text>		],</xsl:text>
		
		<!-- Level 9 -->
		<xsl:value-of select="$newline" />
		<xsl:text>        "lvl9Spells": [ </xsl:text>
		<xsl:variable name="level9spellcounter" select="count(powers/*[group='Spells'][level='9'])" />
		<xsl:for-each select="powers/*[group='Spells'][level='9']">
			<xsl:value-of select="$newline" /><xsl:text>        	{</xsl:text>
				<xsl:value-of select="$newline" /><xsl:text>				</xsl:text>  	
				<xsl:text>"name":"</xsl:text><xsl:value-of select="name" />"<xsl:value-of select="$newline" /><xsl:text>        	}</xsl:text><xsl:if test="$level9spellcounter &gt; position()">,</xsl:if>
		</xsl:for-each>
		<xsl:value-of select="$newline" /><xsl:text>		],</xsl:text>
		
		<!-- End Spells -->
		
		<!-- Spell Slots -->
		<xsl:choose>
			<xsl:when test="powermeta/spellslots1/max != ''">
				<xsl:value-of select="$newline" />
				<xsl:text>        "lvl1SpellSlotsTotal":"</xsl:text><xsl:value-of select="powermeta/spellslots1/max" /><xsl:text>",</xsl:text><xsl:value-of select="$newline" />
			</xsl:when>
		</xsl:choose>

		<xsl:choose>
			<xsl:when test="powermeta/spellslots2/max != ''">		
				<xsl:value-of select="$newline" />
				<xsl:text>        "lvl2SpellSlotsTotal":"</xsl:text><xsl:value-of select="powermeta/spellslots2/max" /><xsl:text>",</xsl:text><xsl:value-of select="$newline" />
			</xsl:when>
		</xsl:choose>
		
		<xsl:choose>
			<xsl:when test="powermeta/spellslots3/max != ''">
				<xsl:value-of select="$newline" />
				<xsl:text>        "lvl3SpellSlotsTotal":"</xsl:text><xsl:value-of select="powermeta/spellslots3/max" /><xsl:text>",</xsl:text><xsl:value-of select="$newline" />
			</xsl:when>
		</xsl:choose>
		
		<xsl:choose>
			<xsl:when test="powermeta/spellslots4/max != ''">
				<xsl:value-of select="$newline" />
				<xsl:text>        "lvl14pellSlotsTotal":"</xsl:text><xsl:value-of select="powermeta/spellslots4/max" /><xsl:text>",</xsl:text><xsl:value-of select="$newline" />
			</xsl:when>
		</xsl:choose>
		
		<xsl:choose>
			<xsl:when test="powermeta/spellslots5/max != ''">
				<xsl:value-of select="$newline" />
				<xsl:text>        "lvl5SpellSlotsTotal":"</xsl:text><xsl:value-of select="powermeta/spellslots5/max" /><xsl:text>",</xsl:text><xsl:value-of select="$newline" />
			</xsl:when>
		</xsl:choose>
		
		<xsl:choose>
			<xsl:when test="powermeta/spellslots6/max != ''">
				<xsl:value-of select="$newline" />
				<xsl:text>        "lvl6SpellSlotsTotal":"</xsl:text><xsl:value-of select="powermeta/spellslots6/max" /><xsl:text>",</xsl:text><xsl:value-of select="$newline" />
			</xsl:when>
		</xsl:choose>
		
		<xsl:choose>
			<xsl:when test="powermeta/spellslots7/max != ''">
				<xsl:value-of select="$newline" />
				<xsl:text>        "lvl7SpellSlotsTotal":"</xsl:text><xsl:value-of select="powermeta/spellslots7/max" /><xsl:text>",</xsl:text><xsl:value-of select="$newline" />
			</xsl:when>
		</xsl:choose>
		
		<xsl:choose>
			<xsl:when test="powermeta/spellslots8/max != ''">
				<xsl:value-of select="$newline" />
				<xsl:text>        "lvl8SpellSlotsTotal":"</xsl:text><xsl:value-of select="powermeta/spellslots8/max" /><xsl:text>",</xsl:text><xsl:value-of select="$newline" />
			</xsl:when>
		</xsl:choose>
		
		<xsl:choose>
			<xsl:when test="powermeta/spellslots9/max != ''">
				<xsl:value-of select="$newline" />
				<xsl:text>        "lvl9SpellSlotsTotal":"</xsl:text><xsl:value-of select="powermeta/spellslots9/max" /><xsl:text>",</xsl:text><xsl:value-of select="$newline" />
			</xsl:when>
		</xsl:choose>

		<!-- Age -->
		<xsl:text>      &#10;        "age":"</xsl:text>
		<xsl:value-of select="age" /><xsl:text>",</xsl:text>
		
		<!-- Height -->
		<xsl:text>      &#10;        "height":"</xsl:text>
		<xsl:call-template name="replace-string">
		  <xsl:with-param name="text" select="height"/>
		  <xsl:with-param name="replace" select="'&quot;'"/>
		  <xsl:with-param name="with" select="' inches'"/>
		</xsl:call-template><xsl:text>",</xsl:text>
		
		<!-- Weight -->
		<xsl:text>      &#10;        "weight":"</xsl:text>
		<xsl:value-of select="weight" /><xsl:text>",</xsl:text>
		
		<!-- Hit Die -->
		<xsl:text>      &#10;        "hitDiceMax":"</xsl:text>
		<xsl:for-each select="classes/*">
			<xsl:value-of select="level" /><xsl:text>-</xsl:text><xsl:value-of select="hddie" /><xsl:text>   </xsl:text>
		</xsl:for-each>
	    <xsl:text>",</xsl:text> 
		
		<xsl:text>      &#10;        "hitDice":"</xsl:text>
		<xsl:for-each select="classes/*">
			<xsl:value-of select="level - hdused" /><xsl:text>-</xsl:text><xsl:value-of select="hddie" /><xsl:text>   </xsl:text>
		</xsl:for-each>
	    <xsl:text>"</xsl:text> 
				
		<!-- End of Character -->
		
		<xsl:text>&#10;</xsl:text>
		<xsl:text>}</xsl:text>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
	
	<xsl:template name="replace-string">
		<xsl:param name="text"/>
		<xsl:param name="replace"/>
		<xsl:param name="with"/>
		<xsl:choose>
		  <xsl:when test="contains($text,$replace)">
			<xsl:value-of select="substring-before($text,$replace)"/>
			<xsl:value-of select="$with"/>
			<xsl:call-template name="replace-string">
			  <xsl:with-param name="text"
	select="substring-after($text,$replace)"/>
			  <xsl:with-param name="replace" select="$replace"/>
			  <xsl:with-param name="with" select="$with"/>
			</xsl:call-template>
		  </xsl:when>
		  <xsl:otherwise>
			<xsl:value-of select="$text"/>
		  </xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
</xsl:stylesheet>