<%@ Page masterPageFile="~/global.master" %>
<asp:Content contentPlaceHolderId="Content" runat="server">
	<h1 class="typeface-js">
		Offene Türen
	</h1>
	
	<div class="block">
		<h2>Adresse</h2>

		<a class="fancybox" title="HotFeet's Adresse" href="http://maps.google.com/maps?q=HotFeet+GmbH,+Technoparkstrasse+1,+Z%C3%BCrich,+Switzerland&amp;hl=en&amp;ved=0CBQQpQY&amp;ei=HjerTN-ePMie_gb4kuTeCg&amp;sll=47.389909,8.516049&amp;sspn=0.006295,0.006295&amp;ie=UTF8&amp;view=map&amp;cid=11797761421132798745&amp;hq=HotFeet+GmbH,+Technoparkstrasse+1,+Z%C3%BCrich,+Switzerland&amp;hnear=&amp;ll=47.39004,8.516421&amp;spn=0.008629,0.012875&amp;z=15&amp;iwloc=A&amp;output=embed">
			<img class="deco" src="http://maps.google.com/maps/api/staticmap?center=Technoparkstrasse+1,+8004+Zurich&zoom=13&size=250x209&markers=size:mid|color:blue|Technoparkstrasse+1,8005+Zurich&sensor=false" alt="Unser Standort auf der Karte"/>
		</a>

		<p>
			HotFeet GmbH<br />
			Technoparkstrasse 1<br/>
			8005 Zürich<br />
			<br />
			T +41 44 445 34 44<br />
			<br />
			<a class="links" href="mailto:info@hotfeet.ch">info@hotfeet.ch</a>			
		</p>		
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			$("a.fancybox").fancybox({
				'width'			:	'65%', 
				'height'			:	'80%', 	
				'titleShow'		:	false,			
				'transitionIn'	:	'elastic',
				'transitionOut'	:	'elastic',
				'speedIn'		:	300, 
				'speedOut'		:	200, 
				'overlayShow'	:	false,
				'type'			:	'iframe'
			});
		});
	</script>
		
	<div class="block">
		
	</div>
</asp:Content>

<asp:Content contentPlaceHolderId="SidebarBoxes" runat="server">
	<div class="sidebox">
		<h2>Unsere Koordinaten</h2>
		<a class="links" href="#">Anzeigen in Google Maps</a>
	</div>
</asp:Content>