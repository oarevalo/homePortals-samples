<!--- This page displays the default error layout --->
<cfparam name="cfcatch" type="any" default="#structNew()#">
<cfparam name="cfcatch.type" default="">
<cfparam name="cfcatch.Message" default="">
<cfparam name="cfcatch.Detail" default="">

<cfif isDefined("exception")>
	<cfset cfcatch = exception>
</cfif>

<cfoutput>
	<cfif cfcatch.Type eq "Custom">
		<div style="margin:10px;padding:10px;border:1px solid silver;background-color:##FFFF99;font-family:arial;font-size:11px;color:black;">
			<b>StartPage - Error</b>
			<br /><br />
			#cfcatch.Message#
		</div>
	<cfelse>
		<div style="margin:10px;padding:10px;border:1px solid silver;background-color:##FFFF99;font-family:arial;font-size:11px;color:black;">
			<b>StartPage</b> - The following problem was encountered during processing:
			<br /><br />
			<div style="font-family:arial;font-size:11px;color:black;">
				<b>Message:</b><br>
				#cfcatch.Message#<br><br>
				
				<b>Detail:</b><br>
				#cfcatch.Detail#<br><br>
				
				<b>Type:</b> #cfcatch.Type#<br><br>
		
				<cfif StructKeyExists(cfcatch, "tagContext")>
					<b>Tag Context:</b><br>
					<cfloop from="1" to="#arrayLen(cfcatch.tagContext)#" index="i">
						<li>#cfcatch.tagContext[i].template# [line #cfcatch.tagContext[i].line#]
					</cfloop>
				</cfif>	
			</div>
		</div>
	</cfif>
</cfoutput>
