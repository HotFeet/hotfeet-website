<%@ Page masterPageFile="~/global.master" %>
<asp:Content contentPlaceHolderId="Content" runat="server">
	<h1>Open Source Libraries</h1>
		<p>
			This area is still under construction.
		</p>
	
	<div class="block">
		<h2>jQuery Plugins</h2>

		<h3>backgroundBorder</h3>
		<div id="BackgroundBorderDemo" class="demo">
			<div class="version">
				<span>Disabled</span>
				<div class="disabled">
					<div class="box">
						Title
						<div class="line"></div>
					</div>
				</div>
			</div>

			<div class="version">
				<span>Enabled</span>
				<div class="enabled">
					<div class="box">
						Title
						<div class="line"></div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			$("#BackgroundBorderDemo .enabled .box, #BackgroundBorderDemo .enabled .line").backgroundBorder();
		</script>

		<h3>stripeTable</h3>
		<div id="StripeTableDemo" class="demo">
			<div class="version">
				<span>Disabled</span>
				<div class="disabled">
					<table>
						<tr>
							<th />
							<th>Clients</th>
							<th>Revenue</th>
						</tr>
						<tr>
							<td>2009</td>
							<td>+11%</td>
							<td>+10%</td>
						</tr>
						<tr>
							<td>2008</td>
							<td>+13%</td>
							<td>+20%</td>
						</tr>
						<tr>
							<td>2007</td>
							<td>+26%</td>
							<td>+25%</td>
						</tr>
					</table>
				</div>
			</div>

			<div class="version">
				<span>Enabled</span>
				<div class="enabled">
					<table class="striped">
						<tr>
							<th />
							<th>Clients</th>
							<th>Revenue</th>
						</tr>
						<tr>
							<td>2009</td>
							<td>+11%</td>
							<td>+10%</td>
						</tr>
						<tr>
							<td>2008</td>
							<td>+13%</td>
							<td>+20%</td>
						</tr>
						<tr>
							<td>2007</td>
							<td>+26%</td>
							<td>+25%</td>
						</tr>
					</table>
				</div>			
			</div>
		</div>
		<script type="text/javascript">
			$("#StripeTableDemo .disabled table").decorateTable({columnIndex: true});
		</script>

		<h3>couple</h3>
		<div id="CoupleDemo" class="demo">
		</div>

		<h3>attrValueSwitch</h3>
		<div id="AttrValueDemo" class="demo">
		</div>
		
		<h3>polarCoordinates</h3>
		<div id="PolarCoordinatesDemo" class="demo">
		</div>
	</div>
</asp:Content>
