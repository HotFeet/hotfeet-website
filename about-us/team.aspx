<%@ Page masterPageFile="~/global.master" %>
<asp:Content contentPlaceHolderId="Content" runat="server">
	<h1>Who is who?</h1>
	<div class="block">
		<div class="block vcard">
			<h2 class="title">CEO</h2>
			<div class="person">
				<img class="portrait photo" src="~/images/team-juraj-skripsky.png" alt="Juraj Skripsky" runat="server" />
				<h3 class="fn">Juraj Skripsky</h3>
				<span class="education">Dipl. Inf. Ing. ETH</span>
				<span class="org">HotFeet GmbH</span>
				<span class="role">Inhaber</span>
				<a class="email links" href="mailto:js@hotfeet.ch">js@hotfeet.ch</a>
			</div>
		</div>

		<div class="block vcard">
			<h2 class="title">Marketing &amp; Sales Manager</h2>
			<div class="person">
				<img class="portrait photo" src="~/images/team-azita-qadri.png" alt="Azita Qadri" runat="server" />
				<h3 class="fn">Azita Qadri</h3>
				<span class="education">MBA INSEAD</span>
				<span class="org">HotFeet GmbH</span>
				<span class="tel">
					<span>(im Mutterschaftsurlaub)</span>
				</span>
				<a class="email links" href="mailto:aq@hotfeet.ch">aq@hotfeet.ch</a>
			</div>
		</div>
	</div>
</asp:Content>
