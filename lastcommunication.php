<?php session_start();

if(isset($_SESSION['login_user']) && isset($_SESSION['id']))
{
?>
<html>

    <head>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

 <script type="text/javascript">
var tableToExcel = (function() {
  var uri = 'data:application/vnd.ms-excel;base64,'
    , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>'
    , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
    , format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
  return function(table, name) {
    if (!table.nodeType) table = document.getElementById(table)
    var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
    window.location.href = uri + base64(format(template, ctx))
  }
})()
</script>


	
	
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
       
        <script>
        
            function a(strPage,perpg){
            
               var comm=document.getElementById("comm").value;
               //var from=document.getElementById("fromdate").value;
               //var to=document.getElementById("todate").value;
          
          $('#loadingmessage').show();  // show the loading message.
          
          perp='30';

var Page="";
if(strPage!="")
{
Page=strPage;
}
         
             
             $.ajax({
               
            type:'POST',    
   url:'lastcommunication_process.php',
  data:'Page='+Page+'&perpg='+perp+'&comm='+comm,



   success: function(msg){
    
     // $(".content").html(html);
            $('#loadingmessage').hide(); // hide the loading message

   document.getElementById("show").innerHTML=msg;
   
  
   
} })
            }
        </script>
        
        
        
        
        
        
</head>
      &nbsp;&nbsp;&nbsp;
        <!--<body onload="a('','')" style="background-color: #dce079">-->
            <body  style="background-color: #dce079">
		       <?php include 'menu.php';?>


	<center><h1 style="margin-top:70px; color:#fff;"  ><b>Last Communication</b></h1></center>
           
		
		

<div>
    <table border="1" style="margin-top:40px; width:90%; " align="center" >          
               
<tr style="background-color:#8cb77e">
<!--<td> panel id :<input type="text" name="panelid" id="panelid" ></td>
<td> DVRIP:<input type="text" name="DVRIP" id="DVRIP" ></td>
<td> Company:<input type="text" name="compy" id="compy" ></td>
<td> ATMID:<input type="text" name="ATMID" id="ATMID" ></td>-->

<!--<td>From Date:<input type ="date" id ="fromdate"></td>
<td>To Date:<input type ="date" id ="todate"></td>-->
<td>Communication Filter:
   <select id="comm" name="comm">
    <option value="">-- select --</option>
	<option value="0">All Communication</option>
    <!--<option value="1">Up Communication</option>-->
    <option value="2">Down Communication</option>
    <!--<option value="3">2 days Communication</option>
    <option value="4">7 days Communication</option>
    <option value="5">15 days Communication</option>-->
   </select></td>

        <td><input type="button" name="submit" onclick="a('','')"value="search"></button></td>
		<input type="button" onclick="tableToExcel('show', 'W3C Example Table')" value="Export to Excel" style="float: right;height:30px" >




<button onclick="myFunction()" style="float: right;height:30px" style="margin-top:50px" >Print this page</button>
</tr>
</table>
            </div>
            	<div id='loadingmessage' style='display:none;' >
  <img src='img/loading.gif' style="position:center;left:50%;margin-left:550px; "/>
</div>
            <div id="show"></div>
            
			
			<div><input type="button" onclick="tableToExcel('show', 'W3C Example Table')" value="Export to Excel" style="float: left;height:30px">
			<button onclick="myFunction()" style="float: left;height:30px" >Print this page</button>
</div>
			
               
<!--<input type="button" name="csv"  placeholder="csv formate" value ="csv formate" onclick="csv()">-->


<script>
function myFunction() {
    window.print();
}
</script>


</div>

</div>
			
			  
        </body>
    
</html>

<?php
}else
{ 
 header("location: index.php");
}
?>



