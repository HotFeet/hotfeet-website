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
				<span class="tel">
					<abbr>T</abbr>
					<span class="type">Work</span>
					<span class="value">+41 44 445 34 41</span>
				</span>
				<a class="email links" href="mailto:js@hotfeet.ch">js@hotfeet.ch</a>
			</div>
		</div>

		<div class="block vcard">
			<h2 class="title">Web Developer</h2>
			<div class="person">
				<img class="portrait photo" src="~/images/team-paris-de-belder.png" alt="Paris De Belder" runat="server" />
				<h3 class="fn">Paris De Belder</h3>
				<span class="education">Master of Arts UZH</span>
				<span class="org">HotFeet GmbH</span>
				<span class="role">Inhaber</span>
				<span class="tel">
					<abbr>T</abbr>
					<span class="type">Work</span>
					<span class="value">+41 44 445 34 44</span>
				</span>
				<span class="tel">
					<abbr>M</abbr>
					<span class="type">Cell</span>
					<span class="value">+41 76 322 62 27</span>
				</span>
				<a class="email links" href="mailto:pdb@hotfeet.ch">pdb@hotfeet.ch</a>
			</div>
		</div>

<!--
		<div class="block vcard">
			<h2 class="title">Marketing &amp; Sales Manager</h2>
			<div class="person">
				<img class="portrait photo" src="~/images/empty.gif" alt="" runat="server" />
				<!--<img class="portrait photo" src="~/images/team-azita-qadri.png" alt="Azita Qadri" runat="server" />-->
				<h3 class="fn">Azita Qadri</h3>
				<span class="education">[FIXME: education title]</span>
				<span class="org">HotFeet GmbH</span>
				<span class="tel">
					<abbr>T</abbr>
					<span class="type">Work</span>
					<span class="value">+41 44 445 34 44</span>
				</span>
				<span class="tel">
					<abbr>M</abbr>
					<span class="type">Cell</span>
					<span class="value">+41 79 628 57 93</span>
				</span>
				<a class="email links" href="mailto:aq@hotfeet.ch">aq@hotfeet.ch</a>
			</div>
		</div>
-->
	</div>
</asp:Content>