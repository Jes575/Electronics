
    
<%@page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/main.css" rel="stylesheet" type="text/css" />
<title>Untitled Document</title>
</head>

<body>
    <div style="width: 80%;margin: 0px auto; "><%@include file="adminheader.jsp" %></div>
    <div ><p>&nbsp;</p><p>&nbsp;</p><form action="../Insert" name="myForm" id="myform" method="post" enctype="multipart/form-data">
    
  <table width="37%" cellspacing="3" align="center">
  <tr style=" background-color: #eee;"><td></td><td style="font-size:22px;font-weight:bold;padding: 2% 0%;font-family: comic sans ms, sans-serif;">Add Inventory</td></tr>
       <tr>
          <td id="names" width="40%">Product Code :</td>
          <td id="fields" width="60%">
          <input type="text" name="code" size="30" required="required" /></td>
       </tr>
       <tr style=" background-color: #eee; border-right: 2px solid #eee;">
          <td id="names">Product Name :</td>
          <td id="fields">
          <input name="pname" type="text" required size="30"/></td>
       </tr>
       <tr>
          <td id="names">Date :</td>
          <td id="fields">
           <input type="date" name="date" required="required" /></td>
       </tr>
       <tr style=" background-color: #eee;">
          <td id="names">Quantity :</td>
          <td id="fields">
           <input type="text" name="pqty" size="30" required /></td>
       </tr>
        <tr>
          <td id="names">Product Description :</td>
          <td id="fields">
          <textarea name="pdesc" required  rows="3" cols="32"></textarea></td>
       </tr>
       <tr style=" background-color: #eee;">
          <td id="names">Product Image Name :</td>
          <td id="fields"><input name="pimage" required type="file" /></td>
       </tr>
       <tr>
          <td id="names">Price :</td>
          <td id="fields">
            <input type="text" name="price" size="30" required /></td>
       </tr>
        <tr style=" background-color: #eee;">
          <td id="names">Product Type :</td>
                 <td id="fields"><select name="type">
               <option value="Sensors">Sensors</option>
               <option value="Development">Development </option>
               <option value="Robo">Robo</option>
               <option value="Modules">Modules</option>
               <option value="Components">Components</option>
               </select>
               </td>
       </tr>
       <tr>
          <td>&nbsp;</td>
          <td id="fields" style="padding:8px;" ><input  type="submit" name="submit"value="Add This Item"/></td>
       </tr>
  </table>
</form>
    </div>
</body>
</html>