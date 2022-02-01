<html>
<head>
<link href="SpryAssets/SpryMenuBarHorizontal.css" rel="stylesheet" type="text/css" />
<link href="css/main.css" rel="stylesheet" type="text/css" />
<script src="SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
</head>
<body><div id="head">
<ul id="MenuBar1" class="MenuBarHorizontal">
    <li><a style="color:#000; font-size:15px; font-weight:bold;" href="addInventory.jsp">Add Inventory</a></li>
    <li><a style="color:#000; font-size:15px; font-weight:bold;" href="inventoryItems.jsp">Inventory Items</a>
    </li>
    <li><a style="width: 12em; color:#000; font-size:15px; font-weight:bold;" href="deleteItems.jsp?code=">Delete Inventory Items</a>
    </li>
    <li><a style="width: 12em; color:#000; font-size:15px; font-weight:bold;" href="updateItems.jsp">Update Inventory Items</a>
    </li>
    <li><a style="width: 12em; color:#000; font-size:15px; font-weight:bold;" href="#">Order Inventory Items</a>
    </li>
    <li><a style="width: 7em; color:#000; font-size:15px; font-weight:bold;" href="#" class="MenuBarItemSubmenu">More</a>
    <ul>
        <li><a style="color:#000; font-size:15px;" href="addModuleImage.jsp">Service Order</a></li>
        <li><a style="color:#000; font-size:15px;" href="addmodule.jsp">Add Module</a></li>
        <li><a style="color:#000; font-size:15px;" href="#">Enquiry</a></li>
        <li><a style="color:#000; font-size:15px;" href="../index.jsp">Logout</a></li>
    </ul></li>
</ul></div>
<script type="text/javascript">
var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgDown:"SpryAssets/SpryMenuBarDownHover.gif", imgRight:"SpryAssets/SpryMenuBarRightHover.gif"});
</script>
</body>
</html>