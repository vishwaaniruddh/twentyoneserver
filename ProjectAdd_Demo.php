<?php
session_start();
if(isset($_SESSION['login_user']) && isset($_SESSION['id']))
{?>
<html>
    <head>
         <link rel="stylesheet" href="css/bootstrap.css">
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


 <script>
    
    function states() {
		
		 var project = document.getElementById("project").value;
		  if(project=="1"){ var tag="AddSite_"; }else if(project=="2"){var tag="AddDVR_";}else if(project=="3"){var tag="Cloud_";}
		  
           var State=document.getElementById(tag+"State").value;
                $.ajax({
                    type:'POST',
                    url:'state_id.php',
                     data:'State='+State,
                     datatype:'json',
                    success:function(msg){
                       // alert(msg);
                       var jsr=JSON.parse(msg);
                       //alert(jsr.length);
                        var newoption=' <option value="">Select</option>' ;
                        $('#'+tag+'City').empty();
                        for(var i=0;i<jsr.length;i++)
                        {
                       //var newoption= '<option id='+ jsr[i]["ids"]+' value='+ jsr[i]["ids"]+'>'+jsr[i]["modelno"]+'</option> ';
		                   newoption+= '<option id="'+ jsr[i]["ids"]+'" value="'+ jsr[i]["stateid"]+'">'+jsr[i]["stateid"]+'</option> ';
			            }                       
                     $('#'+tag+'City').append(newoption);
 
                    }
                })
                
            }
</script>
  <script>
  var boolPnl="";
  function checkPanIP(){
	     var project = document.getElementById("project").value;
		  if(project=="1"){ var tag="AddSite_"; }else if(project=="2"){var tag="AddSite_";}else if(project=="3"){var tag="AddSite_";}
		  
	     var PanelsIP = document.getElementById(tag+"PanelsIP").value;  
     $.ajax({
                    
                    type:'POST',
                    url:'checkPanels_IP.php',
                     data:'PanelsIP='+PanelsIP, 
					 async: false,
                     success:function(msg){
                        //alert(msg);
                        if(msg>=1){
                            alert(Panels IP already exist");
                             boolPnl="0";
                        }else{
                            boolPnl="1";
                        }
                     }
  })
  
  if(boolPnl==1){
           //  alert("anans--"+boolemail)
            return true;
         }else{
             return false;
         }
 
  }
  
  
  
  
  
  
  var boolemail="";
  function checkip(){
      //alert("hello");
	   var project = document.getElementById("project").value;
		  if(project=="1"){ var tag="AddSite_"; }else if(project=="2"){var tag="AddSite_";}else if(project=="3"){var tag="AddSite_";}
		  
    var dv_ip = document.getElementById(tag+"DVRIP").value;  
     $.ajax({
                    
                    type:'POST',
                    url:'check_ip.php',
                     data:'dv_ip='+dv_ip, 
					 async: false,
                     success:function(msg){
                        //alert(msg);
                        if(msg>=1){
                            alert("DVR IP already exist");
                             boolemail="0";
                        }else{
                            boolemail="1";
                        }
                     }
  })
  
  if(boolemail==1){
            return true;
         }else{
             return false;
         }
  }
  
  
  var bool="";
  function checkpanel(){
	   var project = document.getElementById("project").value;
		  if(project=="1"){ var tag="AddSite_"; }else if(project=="2"){var tag="AddSite_";}else if(project=="3"){var tag="AddSite_";}
		  
     var NewPanelID = document.getElementById(tag+"NewPanelID").value;  
                    $.ajax({
                    type:'POST',
                    url:'check_panel.php',
                    data:'NewPanelID='+NewPanelID, 
					async: false,
                     success:function(msg){
                        //alert(msg);
                        if(msg>=1){
                            alert("NewPanel ID already exist");
                             bool="0";
                        }else{
                             bool="1";
                        }
                     }
  })
  
  if(bool==1){
            return true;
         }else{
             return false;
         }
  }
  
  var boolatm="";
  function checkAtm(){
     var project = document.getElementById("project").value;
		  if(project=="1"){ var tag="AddSite_"; }else if(project=="2"){var tag="AddSite_";}else if(project=="3"){var tag="AddSite_";}
		  
    var NewATMID = document.getElementById(tag+"ATMID").value;  
     $.ajax({
                    
                    type:'POST',
                    url:'check_Atm.php',
                    data:'NewATMID='+NewATMID, 
					async: false,
                     success:function(msg){
                        //alert(msg);
                        if(msg>=1){
                            alert("Atm Id already exist");
                             boolatm="0";
                        }else{
                            boolatm="1";
                        }
                     }
  })
  
  if(boolatm==1){
           //  alert("anans--"+boolemail)
            return true;
         }else{
             return false;
         }
  }
  
 
     function validation(){
         var a=confirm("are you sure want to submit ");
         if(a==1){
            alert("Site  added successfully");
            forms.submit();
         }else{
             alert("your form is not submited");
         }
     }
      
      function val(){
		 
		  var project = document.getElementById("project").value;
		  if(project=="1"){ var tag="AddSite_"; 
		  
		  
		  var Customer = document.getElementById(tag+"Customer").value;
		  var Bank = document.getElementById(tag+"Bank").value;
		  var ATMID = document.getElementById(tag+"ATMID").value;
		  var Panel_Make = document.getElementById(tag+"Panel_Make").value; 
          var OldPanelID = document.getElementById(tag+"OldPanelID").value;
		  var Zone = document.getElementById(tag+"Zone").value;
          var DVRName = document.getElementById(tag+"DVRName").value;
		  var DVR_Model_num = document.getElementById(tag+"DVR_Model_num").value;
		  var Router_Model_num = document.getElementById(tag+"Router_Model_num").value;
		  var DVRIP = document.getElementById(tag+"DVRIP").value;
		  var Password = document.getElementById(tag+"Password").value;
	      var State = document.getElementById(tag+"State").value;
		  var City = document.getElementById(tag+"City").value;
		  var engname = document.getElementById(tag+"engname").value;
		 
       if (Customer== "")
	{
		alert("Please select customer");
		return false;
	}
	else if(Bank==""){
       alert("Please select Bank");
		return false; 
}
else if(ATMID==""){
       alert("please fill up atm id");
		return false; 
}
else if(Panel_Make==""){
       alert("please select Panel Make");
		return false; 
}
else if(OldPanelID==""){
       alert("please fill up Old Panel ID");
		return false; 
}
else if(Zone==""){
       alert("please Select Zone");
		return false; 
}
else if(DVRName==""){
       alert("please Select DVR Name");
		return false; 
}
else if(DVR_Model_num==""){
       alert("please fill up DVR Model Number");
		return false; 
}
else if(Router_Model_num==""){
       alert("please fill up Router Model Number");
		return false; 
}

else if(DVRIP==""){
       alert("please fill up DVR IP");
		return false; 
}
else if(Password==""){
       alert("please fill up Password");
		return false; 
}
else if(State==""){
       alert("please Select State");
		return false; 
}
else if(City==""){
       alert("please Select City");
		return false; 
}
else if(engname==""){
       alert("please fill up Engineer name");
		return false; 
}else{
	return true;
      }
	 }
	 //////////////////////////////////////////////////////////////// For Add DVR  validation//////////////////////////////////
	 
	 else if(project=="2"){var tag="AddSite_";
	      var Customer = document.getElementById("Customer").value;
		  var Bank = document.getElementById("Bank").value;
		  var ATMID = document.getElementById("ATMID").value;
		  var CTSLocalBranch = document.getElementById("CTSLocalBranch").value;
		  var CTS_BM_Name = document.getElementById("CTS_BM_Name").value;
		  var CTS_BM_Number = document.getElementById("CTS_BM_Number").value;
		  var install_Status = document.getElementById("install_Status").value;
		  var Zone = document.getElementById("Zone").value;
          var Password = document.getElementById("Password").value;
	      var State = document.getElementById("State").value;
		  var City = document.getElementById("City").value;
		
       if (Customer== "")
	{
		alert("Please select customer");
		return false;
	}
	else if(Bank==""){
       alert("Please select Bank");
		return false; 
}
else if(ATMID==""){
       alert("please fill up atm id");
		return false; 
}

else if(Zone==""){
       alert("please Select Zone");
		return false; 
}
else if(State==""){
       alert("please Select State");
		return false; 
}
else if(City==""){
       alert("please Select City");
		return false; 
}
else if(CTSLocalBranch==""){
       alert("please fill up CTS Local Branch ");
		return false; 
}
else if(CTS_BM_Name==""){
       alert("please fill up CTS BM Name ");
		return false; 
}
else if(CTS_BM_Number==""){
       alert("please fill up CTS BM Number ");
		return false; 
}

else if(install_Status==""){
       alert("please select Installation Status ");
		return false; 
}
else{
	return true;
      }
	 
	 }
	 
	 /////////////////////////////////////////////////// For Cloud validation
	 
	 else if(project=="3"){
		 var tag="cloud_";
		 return true;
	 }
		 
	  }    
      
function finalval()
{
	var project = document.getElementById("project").value;
		  if(project=="1"){
			   if(checkAtm() && checkpanel() && checkPanIP() && checkip() && val() && validation())
		  }else if(project=="2"){
			  if(checkAtm() && val() && validation())
		  }else if(project=="3"){
			   if(checkAtm() && val() && validation())
		  }
	 
   
    {
       return true; 
       
    }
    else
    {
        
        return false; 
        
    }
    
   
}
  </script>
 
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
/*
$(document).ready(function(){
    $("#live").change(function(){
var a =document.getElementById('live').value;


if(a=="Y"){
    
$("#up").show();

}else{
    
     $("#up").hide();
     $("#up1").hide();
}
    });
});
*/
</script>

<script>


function ChangeSitesForm(){
	 
     var project= document.getElementById("project").value;	
	  
	  
	 if(project=="1"){
		 $("#AddSite").show();
		 $("#AddDVR").hide();
		 $("#Cloud").hide();
		 
		  $("#hd_AddSite").show();
		  $("#hd_Cloud").hide();
		   $("#hd_DVR").hide();
		 
		 
	 }else if(project=="2") {
		 $("#AddSite").hide();
	     $("#AddDVR").show();
		 $("#Cloud").hide();
		 
		  $("#hd_AddSite").hide();
		  $("#hd_Cloud").hide();
		  $("#hd_DVR").show();
		 
	 }else if(project=="3") {
		 $("#AddSite").hide();
	     $("#AddDVR").hide();
		 $("#Cloud").show();
		 
		  $("#hd_AddSite").hide();
		  $("#hd_Cloud").show();
		  $("#hd_DVR").hide();
	 }
}
 

 function BroadbandDetails(){
	var NetworkType= $("#NetworkType").val();
    if(NetworkType=="Broadband"){ $(".Broad").show(); emptyBroadbandDetails();}else{ $(".Broad").hide(); emptyBroadbandDetails();}
  }

 function emptyBroadbandDetails(){
	
 $("#ProviderName").val('');
 $("#ProviderEmail").val('');
 $("#ProviderMobile").val('');
 $("#InternetPlans").val('');
 $("#BroadbandAmount").val('');
  $("#StartInternetDate").val('');
   $("#MonthPlans").val('');
  $("#BroadbandAddress").val(''); 
 }
 

  function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode != 46 && charCode > 31
              && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;
        }
		</script>
  
<style>
 {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}

input[type=text] {
   
   
    border: 1px solid #ccc;
    border-radius: 2px;
    
}
.button {
  display: inline-block;
  border-radius: 4px;
  background-color: #283E56;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 16px;
  padding: 7px;
  width: 100px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover {

  background-color: #f4511e;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
}

.div1{margin-top:2px;padding:4px;background-color:#cfe8c7}
.div1:hover{margin-top:2px;background-color:#ccc}
.form1{padding:10px;   width:50%; margin-left:25%; test-align:left ;}
.hed{background-color:#283E56; color:#fff;}


</style>
  </head>
	
    
 
    <body style=" background-color:#dce079;">
<?php 
include 'config.php';
include 'menu.php'; ?>
 <div class="container" style="padding:20px;margin-top:90px">

 
  
 <form id="forms" action="ProjectAddProcess_Demo.php" method="POST" class="form1" enctype="multipart/form-data" onsubmit="return finalval()">

	 <div class="row hed" id="hd_AddSite" >
	 <div  class="col-md-12"><center><h2  >ADD SITE</h2></center></div>
	 </div>

	<div class="row hed" id="hd_DVR" style="display:none">
	 <div  class="col-md-12"><center><h2  >ADD DVR SITE</h2></center></div>
	</div>


	<div class="row hed" id="hd_Cloud" style="display:none" >
	 <div  class="col-md-12"><center><h2 >ADD ONLINE DVR SITE</h2></center></div>
	</div>
 
 
<div class="row div1">
      <div  class="col-md-2"></div>
      <div  class="col-md-4"><leble>Project</leble></div>
      <div  class="col-md-4"> <select name="project" id="project" onchange="ChangeSitesForm()" style="width: 180px;">
                                      
                                       <?php 
										$runQproj=mysqli_query($conn,"select * from projectsites");
										while($Qprojfetch=mysqli_fetch_array($runQproj)){
										?>
										<option value="<?php echo $Qprojfetch['id'];?>"  ><?php echo $Qprojfetch['Name'];?></option>

                                        <?php } ?>

</select>
      <div  class="col-md-2"></div>
</div></div>
 
 <div id="AddSite"> 
   


<div class="row div1">
    <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble> mail receive  Date</leble></div>
     <div  class="col-md-4"> <input type="date" name="AddSite_date" id="AddSite_date" /></div>
      <div  class="col-md-2"></div>
</div>

<div class="row div1 ">
     <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>Status</leble></div>
     <div  class="col-md-4">  <select name="AddSite_Status" id="AddSite_Status" style="width: 180px;"/>
     <option value="E-Surveillance - CSS">E-Surveillance - CSS </option></select></div>
      <div  class="col-md-2"></div>
</div>


<div class="row div1">
     <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>Phase</leble></div>
     <div  class="col-md-4">   <select name="AddSite_Phase" id="AddSite_Phase" style="width: 180px;"/>
     <option>Phase 1</option>
     <option>Phase 2</option>
     <option>Phase 3</option>
     <option>Phase 4</option>
     <option>Phase 5</option>
     <option>Phase 6</option>
     <option>Phase 7</option>
     <option>Phase 8</option>
     <option>Phase 9</option>
     <option>Phase 10</option></select></div>
      <div  class="col-md-2"></div>
</div>

<div class="row div1">
     <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>Customer</leble></div>
     <div  class="col-md-4"> <select name="AddSite_Customer" id="AddSite_Customer" style="width: 180px;"/>
     <option value="">Select</option>
    <?php 
         $cust="select name from customer";
         
         $runcust=mysqli_query($conn,$cust);
         while($rowcust = mysqli_fetch_array($runcust))
	   {  ?>
		<option value="<?php echo $rowcust['name'];?>"/><?php echo $rowcust['name']; ?></option>
               <br/>
      <?php } ?>
   
</select></div>
      <div  class="col-md-2"></div>
</div>


<div class="row div1">
     <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>Bank</leble></div>
     <div  class="col-md-4"> <select name="AddSite_Bank" id="AddSite_Bank" style="width: 180px;"/>
     <option value="">Select</option>
    <?php 
         $bank="select name from bank";
         
         $runbank=mysqli_query($conn,$bank);
         while($rowbank = mysqli_fetch_array($runbank))
	   {  ?>
		<option value="<?php echo $rowbank['name'];?>"/><?php echo $rowbank['name']; ?></option>
               <br/>
      <?php } ?>
   
</select>
     </div>
      <div  class="col-md-2"></div>
</div>

<div class="row div1">
     <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>ATM ID</leble></div>
     <div  class="col-md-4"> <input type="text" name="AddSite_ATMID" id="AddSite_ATMID" onblur="checkpanel()"/></div>
      <div  class="col-md-2"></div>
</div>

<div class="row div1">
     <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>ATMID_2</leble></div>
     <div  class="col-md-4">  <input type="text" name="AddSite_ATMID_2" id="AddSite_ATMID_2" value="-"/></div>
      <div  class="col-md-2"></div>
</div>

<div class="row div1">
    <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>ATMID_3</leble></div>
     <div  class="col-md-4"> <input type="text" name="AddSite_ATMID_3" id="AddSite_ATMID_3" value="-" /></div>
      <div  class="col-md-2"></div>
</div>

<div class="row div1">
    <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>ATMID_4</leble></div>
     <div  class="col-md-4">  <input type="text" name="AddSite_ATMID_4" id="AddSite_ATMID_4" value="-" /></div>
    <div  class="col-md-2"></div>
</div>

<div class="row div1">
     <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>Tracker No</leble></div>
     <div  class="col-md-4"> <input type="text" name="AddSite_TrackerNo" id="AddSite_TrackerNo" value="-"/></div>
      <div  class="col-md-2"></div>
</div>


<div class="row div1">
    <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>ATMShort Name</leble></div>
     <div  class="col-md-4"> <input type="text" name="AddSite_ATMShortName" id="AddSite_ATMShortName" value="-"/></div>
     <div  class="col-md-2"></div>
</div>

<div class="row div1">
    <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>Site Address</leble></div>
     <div  class="col-md-4"> <input type="text" name="AddSite_SiteAddress" id="AddSite_SiteAddress" /></div>
    <div  class="col-md-2"></div>
</div>

<div class="row div1">
    <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>State</leble></div>
     <div  class="col-md-4"> <select name="AddSite_State" id="AddSite_State" onchange="states('AddSite_')" style="width: 180px;"/>
     <option value="">Select</option>
    <?php 
         $qry="select state_id,state from state";
         
         $result=mysqli_query($conn,$qry);
         while($row = mysqli_fetch_array($result))
	   {  ?>
		<option value="<?php echo $row['state_id'];?>"/><?php echo $row['state']; ?></option>
               <br/>
      <?php } ?>
   
</select></div>
    <div  class="col-md-2"></div>
</div>

<div class="row div1">
    <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>City</leble></div>
     <div  class="col-md-4"> <select name="AddSite_City" id="AddSite_City" style="width: 180px;"/>
     <option value="">Select</option>
   
</select></div>

    <div  class="col-md-2"></div>
    
</div>



<div class="row div1">
    <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>Zone</leble></div>
     <div  class="col-md-4"> <select  name="AddSite_Zone" id="AddSite_Zone" style="width: 180px;"/>
     <option value="">Select</option>
     <option value="West">West</option>
     <option value="East">East</option>
     <option value="South">South</option>
     <option value="North">North</option></div>
     <div  class="col-md-2"></select></div>
</div>



<div class="row div1">
     <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>Panel Make</leble></div>
     <div  class="col-md-4"> <select name="AddSite_Panel_Make" id="AddSite_Panel_Make" style="width: 180px;"/>
     <option value="">Select</option>
    <?php 
         $panel="select distinct(Panel_Make) from sites";
         
         $runpanel=mysqli_query($conn,$panel);
         while($rowpanel = mysqli_fetch_array($runpanel))
	   {  ?>
		<option value="<?php echo $rowpanel['Panel_Make'];?>"/><?php echo $rowpanel['Panel_Make']; ?></option>
               <br/>
      <?php } ?>
   
</select>
     </div>
    <div  class="col-md-2"></div>
</div>

<div class="row div1">
    <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>Old Panel ID</leble></div>
     <div  class="col-md-4"><input type="text" name="AddSite_OldPanelID" id="AddSite_OldPanelID" value="-"/></div>
    <div  class="col-md-2"></div>
</div>

<?php 
$max="select max(SN) from sites";
$runmax=mysqli_query($conn,$max);
$maxfetch=mysqli_fetch_array($runmax);

$max2="select NewPanelID  from sites where SN='".$maxfetch[0]."'";
$runmax2=mysqli_query($conn,$max2);
$maxfetch2=mysqli_fetch_array($runmax2);
$np=$maxfetch2[0]+=1;
?>
<div class="row div1">
   <div  class="col-md-2"></div>
    <div  class="col-md-4"><lable>New Panel ID</lable></div>
     <div  class="col-md-4"> <input type="text" name="AddSite_NewPanelID" id="AddSite_NewPanelID" value="<?php echo "0".$np?>" readonly /></div>
     <div  class="col-md-2"></div>
</div>



<div class="row div1">
   <div  class="col-md-2"></div>
    <div  class="col-md-4"><lable>Network Type</lable></div>
     <div  class="col-md-4"> 
		 <select  id="NetworkType" name="NetworkType" onchange="BroadbandDetails()" style="width: 180px;">
		 <option value="">Select</option>
		 <option value="MPLS">MPLS</option>
		 <option value="I-Fibre">I-Fibre</option>
		 <option value="I-FibreWithTech-Route">I-Fibre with tech-route</option>
		 <option value="OpenSimCard">Open Sim Card</option>
		 <option value="Broadband">Broadband</option>
		 
		 </select>
	 </div>
     <div  class="col-md-2"></div>
</div>

<div class="row div1 Broad" style="display:none">
   <div  class="col-md-2"></div>
    <div  class="col-md-4"><lable>Provider Name</lable></div>
     <div  class="col-md-4"> <input type="text" name="ProviderName" id="ProviderName" value="" /></div>
     <div  class="col-md-2"></div>
</div>

<div class="row div1 Broad" style="display:none">
   <div  class="col-md-2"></div>
    <div  class="col-md-4"><lable>Provider Email-ID</lable></div>
     <div  class="col-md-4"> <input type="text" name="ProviderEmail" id="ProviderEmail" value="" /></div>
     <div  class="col-md-2"></div>
</div>

<div class="row div1 Broad" style="display:none">
   <div  class="col-md-2"></div>
    <div  class="col-md-4"><lable>Provider Mobile No.</lable></div>
     <div  class="col-md-4"> <input type="text" name="ProviderMobile" id="ProviderMobile" value=""  onkeypress="return isNumberKey(event)" maxlength="10"/></div>
     <div  class="col-md-2"></div>
</div>

<div class="row div1 Broad" style="display:none">
   <div  class="col-md-2"></div>
    <div  class="col-md-4"><lable>Internet Plans</lable></div>
     <div  class="col-md-4"> 
	      <select  id="InternetPlans" name="InternetPlans" style="width: 180px;">
		  <option value="">Select</option>
		 <option value="3-Mbps">3-Mbps</option>
		 <option value="5-Mbps">5-Mbps</option>
		 <option value="10-Mbps">10-Mbps</option>
		 <option value="15-Mbps">15-Mbps</option>
		 <option value="20-Mbps">20-Mbps</option>
		 <option value="25-Mbps">25-Mbps</option>
		 <option value="30-Mbps">30-Mbps</option>
		 <option value="35-Mbps">35-Mbps</option>
		 <option value="40-Mbps">40-Mbps</option>
		 </select>
	 </div>
     <div  class="col-md-2"></div>
</div>


<div class="row div1 Broad" style="display:none">
   <div  class="col-md-2"></div>
    <div  class="col-md-4"><lable>Internet month Plans</lable></div>
     <div  class="col-md-4"> 
	      <select  id="MonthPlans" name="MonthPlans" style="width: 180px;">
		  <option value="">Select</option>
		 <option value="1">1-Month</option>
		 <option value="3">3-Month</option>
		 <option value="6">6-Month</option>
		 <option value="12">12-Month</option>
		 
		 </select>
	 </div>
     <div  class="col-md-2"></div>
</div>

<div class="row div1 Broad" style="display:none">
   <div  class="col-md-2"></div>
    <div  class="col-md-4"><lable>Broadband Amount</lable></div>
     <div  class="col-md-4"> <input type="text" name="BroadbandAmount" id="BroadbandAmount" value="" /></div>
     <div  class="col-md-2"></div>
</div>


<div class="row div1 Broad" style="display:none">
   <div  class="col-md-2"></div>
    <div  class="col-md-4"><lable>Start Internet Plan</lable></div>
     <div  class="col-md-4"> <input type="date" name="StartInternetDate" id="StartInternetDate" value="" /></div>
     <div  class="col-md-2"></div>
</div>


<div class="row div1 Broad" style="display:none">
   <div  class="col-md-2"></div>
    <div  class="col-md-4"><lable>Broadband Address</lable></div>
	<div  class="col-md-4"> 
			  <input type="text" name="BroadbandAddress" id="BroadbandAddress" value="" />
       </div>
     <div  class="col-md-2"></div>
</div>

<div class="row div1">
   <div  class="col-md-2"></div>
    <div  class="col-md-4"><lable>Router IP</lable></div>
     <div  class="col-md-4"> <input type="text" name="AddSite_RouterIp" id="AddSite_RouterIp" value="" /></div>
     <div  class="col-md-2"></div>
</div>

<div class="row div1">
 <div  class="col-md-2"></div>
    <div  class="col-md-4"><lable>DVR IP</lable></div>
     <div  class="col-md-4"> <input type="text" name="AddSite_DVRIP" id="AddSite_DVRIP" onblur="checkip('AddSite_')"/></div>
 <div  class="col-md-2"></div>
</div>


<div class="row div1">
 <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>Panels IP</leble></div>
     <div  class="col-md-4"> <input type="text" name="AddSite_PanelsIP" id="AddSite_PanelsIP" onblur="checkPanIP('AddSite_')" /></div>
 <div  class="col-md-2"></div>
</div>

<div class="row div1">
    <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>DVR Name</leble></div>
     <div  class="col-md-4"><select name="AddSite_DVRName" id="AddSite_DVRName" style="width: 180px;"/>
     <option value="">Select</option>
    <?php 
         $dvr="select name from dvr_name";
         
         $rundvr=mysqli_query($conn,$dvr);
         while($rowdvr = mysqli_fetch_array($rundvr))
	   {  ?>
		<option value="<?php echo $rowdvr['name'];?>"/><?php echo $rowdvr['name']; ?></option>
               <br/>
      <?php } ?>
   
</select>
     </div>
     <div  class="col-md-2"></div>
</div>

<div class="row div1">
    <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>DVR Model Number</leble></div>
     <div  class="col-md-4"><input type="text" name="AddSite_DVR_Model_num" id="AddSite_DVR_Model_num" ></div>
     <div  class="col-md-2"></div>
</div>

<div class="row div1">
    <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>Router Model Number</leble></div>
     <div  class="col-md-4"><input type="text" name="AddSite_Router_Model_num" id="AddSite_Router_Model_num" ></div>
     <div  class="col-md-2"></div>
</div>


<div class="row div1">
    <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>UserName</leble></div>
     <div  class="col-md-4"><input type="text" name="AddSite_UserName" id="AddSite_UserName" value="admin" readonly></div>
     <div  class="col-md-2"></div>
</div>

<div class="row div1">
     <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>Password</leble></div>
     <div  class="col-md-4"><input type="text" name="AddSite_Password" maxlength=10 id="AddSite_Password" /></div>
      <div  class="col-md-2"></div>
</div>

<div class="row div1">
     <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>Engineer Name</leble></div>
     <div  class="col-md-4"><input type="text" name="AddSite_engname" id="AddSite_engname" /></div>
      <div  class="col-md-2"></div>
</div>

<div class="row div1">
     <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>GSM Number</leble></div>
     <div  class="col-md-4"><input type="text" name="AddSite_GSM" id="AddSite_GSM" onkeypress="return isNumberKey(event)" maxlength="10"/></div>
      <div  class="col-md-2"></div>
</div>

<div class="row div1">
     <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>Remark</leble></div>
     <div  class="col-md-4"><textarea rows="4" cols="25" id="AddSite_Remark" name="AddSite_Remark"></textarea></div>
      <div  class="col-md-2"></div>
</div>

<div class="row div1">
     <div  class="col-md-2"></div>
    <div  class="col-md-4" id="up1"><leble>Choosefile</leble></div>
     <div  class="col-md-4"><input type="file" name="AddSite_email_cpy" id="AddSite_email_cpy" /></div>
      <div  class="col-md-2"></div>
</div>



     </div> 

	 
	 
	 
	 
	 
	 
	 
	 <!--//////////////////////////////////////////////// Cloud ////////////////////////////////////////////////////////////-->
	 
	 
	 
<div id="Cloud" style="display:none">
  


<div class="row div1">
     <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>ATM ID</leble></div>
     <div  class="col-md-4"> <input type="text" name="Cloud_ATMID" id="Cloud_ATMID" onkeyup="checkpanel()"/></div>
      <div  class="col-md-2"></div>
</div>

<div class="row div1">
    <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>Site Address</leble></div>
     <div  class="col-md-4"> <input type="text" name="Cloud_SiteAddress" id="Cloud_SiteAddress" /></div>
    <div  class="col-md-2"></div>
</div>


<div class="row div1">
    <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>Location</leble></div>
     <div  class="col-md-4"> <input type="text" name="Cloud_Location" id="Cloud_Location" /></div>
    <div  class="col-md-2"></div>
</div>


<div class="row div1">
    <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>State</leble></div>
     <div  class="col-md-4"> <select name="Cloud_State" id="Cloud_State"  style="width: 180px;"/>
     <option value="">Select</option>
    <?php 
         $qry="select state_id,state from state";
         $result=mysqli_query($conn,$qry);
         while($row = mysqli_fetch_array($result))
	   {  ?>
		<option value="<?php echo $row['state_id'];?>"/><?php echo $row['state']; ?></option>
               <br/>
      <?php } ?>
   
</select></div>
    <div  class="col-md-2"></div>
</div>


<div class="row div1">
    <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>IPAddress</leble></div>
     <div  class="col-md-4"> <input type="text" name="Cloud_DVRIP" id="Cloud_DVRIP" /></div>
    <div  class="col-md-2"></div>
</div>


<div class="row div1">
    <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>RourtID</leble></div>
     <div  class="col-md-4"> <input type="text" name="Cloud_RourtID" id="Cloud_RourtID" /></div>
    <div  class="col-md-2"></div>
</div>





<div class="row div1" >
    <div  class="col-md-2"></div>
    <div  class="col-md-4"><lable>User Name</lable></div>
     <div  class="col-md-4"><input type="text" name="Cloud_UserName" id="Cloud_UserName" ></div>
     <div  class="col-md-2"></div>
</div>


<div class="row div1"  >
    <div  class="col-md-2"></div>
    <div  class="col-md-4"><lable>Password</lable></div>
     <div  class="col-md-4"><input type="Password" name="Cloud_Password" id="Cloud_Password" ></div>
     <div  class="col-md-2"></div>
</div>

   

<div class="row div1 ">
     <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>Status</leble></div>
     <div  class="col-md-4"> 
	 <select  name="Cloud_Status" id="Cloud_Status" style="width: 180px;"/>
     <option value="">Select</option>
     <option value="Y">Live</option>
     <option value="P">Pending</option>
     </select>
	 
	 </div>
      <div  class="col-md-2"></div>
</div>

<div class="row div1"  >
    <div  class="col-md-2"></div>
    <div  class="col-md-4"><lable>dvrname</lable></div>
     <div  class="col-md-4">
	  <select  name="Cloud_dvrname" id="Cloud_dvrname" style="width: 180px;"/>
     <option value="">Select</option>
     <option value="Hikvision">Hikvision</option>
     <option value="CPPLUS">CPPLUS</option>
     </select>
	 </div>
     <div  class="col-md-2"></div>
</div>


<div class="row div1">
     <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>Customer</leble></div>
     <div  class="col-md-4"> <select name="Cloud_Customer" id="Cloud_Customer" style="width: 180px;"/>
     <option value="">Select</option>
    <?php 
         $cust="select name from customer";
         
         $runcust=mysqli_query($conn,$cust);
         while($rowcust = mysqli_fetch_array($runcust))
	   {  ?>
		<option value="<?php echo $rowcust['name'];?>"/><?php echo $rowcust['name']; ?></option>
               <br/>
      <?php } ?>
   
</select></div>
      <div  class="col-md-2"></div>
</div>
</div>



<!--////////////////////////////////////////////////////////////////////////////////////////////////////////-->

<div id="AddDVR" style="display:none">
<div class="row div1">
    <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble> mail receive  Date</leble></div>
     <div  class="col-md-4"> <input type="date" name="AddDVR_date" id="AddDVR_date" /></div>
      <div  class="col-md-2"></div>
</div>

<div class="row div1 ">
      <div  class="col-md-2"></div>
      <div  class="col-md-4"><leble>Status</leble></div>
      <div  class="col-md-4">  <select name="AddDVR_Status" id="AddDVR_Status" style="width: 180px;"/>
      <option value="E-Surveillance - CSS">E-Surveillance - DVR</option></select></div>
      <div  class="col-md-2"></div>
</div>


<div class="row div1">
     <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>Phase</leble></div>
     <div  class="col-md-4">   <select name="AddDVR_Phase" id="AddDVR_Phase" style="width: 180px;"/>
     <option>Phase 1</option>
     <option>Phase 2</option>
     <option>Phase 3</option>
     <option>Phase 4</option>
     <option>Phase 5</option>
     <option>Phase 6</option>
     <option>Phase 7</option>
     <option>Phase 8</option>
     <option>Phase 9</option>
     <option>Phase 10</option></select></div>
      <div  class="col-md-2"></div>
</div>

<div class="row div1">
     <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>Customer</leble></div>
     <div  class="col-md-4"> <select name="AddDVR_Customer" id="AddDVR_Customer" style="width: 180px;"/>
     <option value="">Select</option>
    <?php 
         $cust="select name from customer";
         
         $runcust=mysqli_query($conn,$cust);
         while($rowcust = mysqli_fetch_array($runcust))
	   {  ?>
		<option value="<?php echo $rowcust['name'];?>"/><?php echo $rowcust['name']; ?></option>
               <br/>
      <?php } ?>
   
</select></div>
      <div  class="col-md-2"></div>
</div>


<div class="row div1">
     <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>Bank</leble></div>
     <div  class="col-md-4"> <select name="AddDVR_Bank" id="AddDVR_Bank" style="width:180px;"/>
     <option value="">Select</option>
    <?php 
         $bank="select name from bank";
         
         $runbank=mysqli_query($conn,$bank);
         while($rowbank = mysqli_fetch_array($runbank))
	   {  ?>
		<option value="<?php echo $rowbank['name'];?>"/><?php echo $rowbank['name']; ?></option>
               <br/>
      <?php } ?>
   
</select>
     </div>
      <div  class="col-md-2"></div>
</div>

<div class="row div1">
     <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>ATM ID</leble></div>
     <div  class="col-md-4"> <input type="text" name="AddDVR_ATMID" id="AddDVR_ATMID" onkeyup="checkpanel('AddDVR_')"/></div>
      <div  class="col-md-2"></div>
</div>

<div class="row div1">
     <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>ATMID_2</leble></div>
     <div  class="col-md-4">  <input type="text" name="AddDVR_ATMID_2" id="AddDVR_ATMID_2" value="-"/></div>
      <div  class="col-md-2"></div>
</div>

<div class="row div1">
    <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>ATMID_3</leble></div>
     <div  class="col-md-4"> <input type="text" name="AddDVR_ATMID_3" id="AddDVR_ATMID_3" value="-" /></div>
      <div  class="col-md-2"></div>
</div>

<div class="row div1">
    <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>ATMID_4</leble></div>
     <div  class="col-md-4">  <input type="text" name="AddDVR_ATMID_4" id="AddDVR_ATMID_4" value="-" /></div>
    <div  class="col-md-2"></div>
</div>

<div class="row div1">
     <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>Tracker No</leble></div>
     <div  class="col-md-4"> <input type="text" name="AddDVR_TrackerNo" id="AddDVR_TrackerNo" value="-"/></div>
      <div  class="col-md-2"></div>
</div>


<div class="row div1">
    <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>ATMShort Name</leble></div>
     <div  class="col-md-4"> <input type="text" name="AddDVR_ATMShortName" id="AddDVR_ATMShortName" value="-"/></div>
     <div  class="col-md-2"></div>
</div>

<div class="row div1">
    <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>Site Address</leble></div>
     <div  class="col-md-4"> <input type="text" name="AddDVR_SiteAddress" id="AddDVR_SiteAddress" /></div>
    <div  class="col-md-2"></div>
</div>

<div class="row div1">
    <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>State</leble></div>
     <div  class="col-md-4"> <select name="AddDVR_State" id="AddDVR_State" onchange="states('AddDVR_')" style="width: 180px;"/>
     <option value="">Select</option>
    <?php 
         $qry="select state_id,state from state";
         
         $result=mysqli_query($conn,$qry);
         while($row = mysqli_fetch_array($result))
	   {  ?>
		<option value="<?php echo $row['state_id'];?>"/><?php echo $row['state']; ?></option>
               <br/>
      <?php } ?>
   
</select></div>
    <div  class="col-md-2"></div>
</div>

<div class="row div1">
    <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>City</leble></div>
     <div  class="col-md-4"> <select name="AddDVR_City" id="AddDVR_City" style="width: 180px;"/>
     <option value="">Select</option>
   
</select></div>

    <div  class="col-md-2"></div>
    
</div>



<div class="row div1">
    <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>Zone</leble></div>
     <div  class="col-md-4"> 
	 <select  name="AddDVR_Zone" id="AddDVR_Zone" style="width: 180px;"/>
     <option value="">Select</option>
     <option value="West">West</option>
     <option value="East">East</option>
     <option value="South">South</option>
     <option value="North">North</option>
	 </select>
	 </div>
     <div class="col-md-2"></div>
</div>


<?php 
$max="select max(SN) from sites";
$runmax=mysqli_query($conn,$max);
$maxfetch=mysqli_fetch_array($runmax);

$max2="select NewPanelID  from sites where SN='".$maxfetch[0]."'";
$runmax2=mysqli_query($conn,$max2);
$maxfetch2=mysqli_fetch_array($runmax2);
$np=$maxfetch2[0]+=1;
?>



<div class="row div1">
    <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>CTS Local Branch</leble></div>
     <div  class="col-md-4"><input type="text" name="AddDVR_LocalBranch" id="AddDVR_LocalBranch" ></div>
     <div  class="col-md-2"></div>
</div>


<div class="row div1">
    <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>CTS BM Name</leble></div>
     <div  class="col-md-4"><input type="text" name="AddDVR_BM_Name" id="AddDVR_BM_Name" ></div>
     <div  class="col-md-2"></div>
</div>


<div class="row div1">
    <div  class="col-md-2"></div>
    <div  class="col-md-4"><leble>CTS BM Number</leble></div>
     <div  class="col-md-4"><input type="text" name="AddDVR_BM_Number" id="AddDVR_BM_Number" ></div>
     <div  class="col-md-2"></div>
</div>


<div class="row div1">
    <div  class="col-md-2"></div>
    <div  class="col-md-4"><lable>Instalation Status</lable></div>
     <div  class="col-md-4"> 
	 <select  name="AddDVR_install_Status" id="AddDVR_install_Status" style="width: 180px;"/>
     <option value="">Select</option>
     <option value="WIP">WIP</option>
     <option value="Provission">Provission</option>
     <option value="TecLive">TecLive</option>
	 </select></div>
     <div  class="col-md-2"></div>
</div>



<div class="row div1" style="display:none">
    <div  class="col-md-2"></div>
    <div  class="col-md-4"><lable>User Name</lable></div>
     <div  class="col-md-4"><input type="text" name="AddDVR_UserName" id="AddDVR_UserName" ></div>
     <div  class="col-md-2"></div>
</div>


<div class="row div1"  style="display:none">
    <div  class="col-md-2"></div>
    <div  class="col-md-4"><lable>Password</lable></div>
     <div  class="col-md-4"><input type="Password" name="AddDVR_Password" id="AddDVR_Password" ></div>
     <div  class="col-md-2"></div>
</div>


	</div> 

<div class="row" style="margin-top:30px;">
     <div  class="col-md-3"></div>
    <div  class="col-md-3"><center> <input type="submit" name="sub" value="submit" /></center></div>
     <div  class="col-md-3"></div>
</div>
       
      </form>
</center>  
</div>
    </body>
</html>

<?php
}else
{ 
 header("location: index.php");
}
?>


