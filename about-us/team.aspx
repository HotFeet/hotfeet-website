<%@ Page masterPageFile="~/global.master" %>
<asp:Content contentPlaceHolderId="Content" runat="server">
	<h1>Who is who?</h1>
	<div class="block">
		<div class="block">
			<h2>CEO</h2>
			<div class="person">
				<img src="~/images/team-juraj-skripsky.jpg" alt="Juraj Skripsky" runat="server" />
				<h3>Juraj Skripsky</h3>
				<span class="title">Dipl. Inf. Ing. ETH</span>
				<span class="phone"><span>T</span> +41 44 445 34 41</span>
				<a class="mail links" href="mailto:js@hotfeet.ch">js@hotfeet.ch</a>
			</div>
		</div>

		<div class="block">
			<h2>Sales &amp; Marketing</h2>
			<div class="person">
				<img src="~/images/team-paris-de-belder.jpg" alt="Paris De Belder" runat="server" />
				<h3>Paris De Belder</h3>
				<span class="title">Lic. phil. I</span>
				<span class="phone"><span>T</span> +41 44 445 34 44</span>
				<span class="phone"><span>M</span> +41 76 322 62 27</span>
				<a class="mail links" href="mailto:pdb@hotfeet.ch">pdb@hotfeet.ch</a>
			</div>
		</div>

		<div class="block">
			<h2>Project Management</h2>
			<div class="person">
				<img src="~/images/team-thomas-lozza.jpg" alt="Thomas Lozza" runat="server" />
				<h3>Thomas Lozza</h3>
				<span class="title">Dipl. Inf. Ing. ETH</span>
				<span class="phone"><span>M</span> +41 78 714 62 30</span>
				<a class="mail links" href="mailto:tl@hotfeet.ch">tl@hotfeet.ch</a>
			</div>
		</div>
	</div>
</asp:Content>


<asp:Content contentPlaceHolderId="SidebarBoxes" runat="server">
</asp:Content>