<?php
session_start();
include 'config.php';

$SN=$_POST['SN'];
$Status=$_POST['Status'];
$Phase=$_POST['Phase'];
$Customer=$_POST['Customer'];
$Bank=$_POST['Bank'];
$ATMID=$_POST['ATMID'];
$ATMID_2=$_POST['ATMID_2'];
$ATMID_3=$_POST['ATMID_3'];
$ATMID_4=$_POST['ATMID_4'];
$SiteAddress=$_POST['siteAddress'];
$ATMShortName=$_POST['ATMShortName'];

$City=$_POST['City'];
$State=$_POST['State'];
$DVRIP=$_POST['DVRIP'];

$DVRName=$_POST['DVRName'];
$DVR_Model_num=$_POST['DVR_Model_num'];
$Router_Model_num=$_POST['Router_Model_num'];

$UserName=$_POST['UserName'];
$Password=$_POST['Password'];
$Zone=$_POST['Zone'];
$Panel_Make=$_POST['Panel_Make'];
$OldPanelID=$_POST['OldPanelID'];
$NewPanelID=$_POST['NewPanelID'];

$engname=$_POST['engname'];
$TrackerNo=$_POST['TrackerNo'];
$remark=$_POST['Remark'];
$live=$_POST['live'];
$addbysite=$_POST['addbysite'];
date_default_timezone_set('Asia/Kolkata');
$curentdt=date("Y-m-d H:i:s");
$SQ="select * from sites where SN='".$SN."'";
//echo $SQ;
$sqrun=mysqli_query($conn,$SQ);
$counts=mysqli_num_rows($sqrun);

$abc="select state from state where state_id='".$State."'";
$runabc=mysqli_query($conn,$abc);
$fetch=mysqli_fetch_array($runabc);
$gsmnum=$_POST['GSM'];

if($counts >0){
   
	$sql="update sites set Status='$Status',Phase='$Phase',Customer='$Customer',Bank='$Bank',ATMID='$ATMID',ATMID_2='$ATMID_2',ATMID_3='$ATMID_3',ATMID_4='$ATMID_4',
TrackerNo='$TrackerNo',ATMShortName='$ATMShortName',SiteAddress='$SiteAddress',City='$City',State='$fetch[0]',Zone='$Zone',Panel_Make='$Panel_Make',OldPanelID='$OldPanelID',
NewPanelID='$NewPanelID',DVRIP='$DVRIP',DVRName='$DVRName',UserName='$UserName',Password='$Password',eng_name='$engname',editby='".$_SESSION['name']."',site_remark='".$remark."',live='".$live."',DVR_Model_num='".$DVR_Model_num."',Router_Model_num='".$Router_Model_num."' where SN='$SN'";
$result=mysqli_query($conn,$sql);
$result10server=mysqli_query($cn,$sql);
if(!$result10server){
	mysqli_query($conn,"update sites set modify=2 where ATMID='$ATMID'");
}
//$resultOnline=mysqli_query($cont,$sql);


$sql3="insert into sites_log(Status,Phase,Customer,Bank,ATMID,ATMID_2,ATMID_3,ATMID_4,TrackerNo,ATMShortName,SiteAddress,City,State,Zone,Panel_Make,OldPanelID,NewPanelID,DVRIP,DVRName,UserName,Password,live,current_dt,eng_name,addedby,site_remark,site_id,editby)
values('$Status','$Phase','$Customer','$Bank','$ATMID','$ATMID_2','$ATMID_3','$ATMID_4','$TrackerNo','$ATMShortName','$SiteAddress','$City','$fetch[0]','$Zone','$Panel_Make','$OldPanelID','$NewPanelID','$DVRIP','$DVRName','$UserName','$Password','$live','$curentdt','$engname','".$addbysite."','$remark','".$SN."','".$_SESSION['name']."')";
//echo $sql3;
$result3=mysqli_query($conn,$sql3);
$result3_10Server=mysqli_query($cn,$sql3);
$result3_online=mysqli_query($cont,$sql3);


//echo $sql;

$gsm="select TwoWayNumber from esurvsites where ATM_ID='".$ATMID."'";
//echo $gsm;
$gsmrun=mysqli_query($conn,$gsm);
$gnum=mysqli_num_rows($gsmrun);

if($gnum >0){
	$gsmupdate="update esurvsites set TwoWayNumber='".$gsmnum."' where ATM_ID='".$ATMID."'";
	$gsmupdaterun=mysqli_query($conn,$gsmupdate);
	//$gsmupdaterun_10server=mysqli_query($cn,$gsmupdate);
	//$gsmupdaterun_Online=mysqli_query($cont,$gsmupdate);
	
	
}else{
	$gsmins="insert into esurvsites(ATM_ID,TwoWayNumber) values('".$ATMID."','".$gsmnum."')";
	$gsminsrun=mysqli_query($conn,$gsmins);
	//$gsminsrun_10server=mysqli_query($cn,$gsmins);
	//$gsminsrun_online=mysqli_query($cont,$gsmins);
}
}

if($result)
{
  echo "1";  
  
}
else
{
    echo "0";
}

?>