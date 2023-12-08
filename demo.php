<?php 
return ; 
include('config.php');

$datetime = date('Y-m-d H:i:s');
$closedDate = date('Y-m-d H:i:s');

$sql = mysqli_query($conn,"select * from dvrsite where ATMID in('RB190003')");

while($sql_result = mysqli_fetch_assoc($sql)){

$id = $sql_result['SN'];

$updatedvr = "update dvrsite set live='N' where SN='".$id."'";
if(mysqli_query($conn,$updatedvr)){
    $siteDetailSql = mysqli_query($conn,"select * from sites_details where site_id='".$id."' and project=2 order by id desc");

    if($siteDetailSqlResult = mysqli_fetch_assoc($siteDetailSql)){

        $routebrand = $siteDetailSqlResult['routebrand'];
        $router_id = $siteDetailSqlResult['router_id'];
        $simnumber = $siteDetailSqlResult['simnumber'];
        $simowner = $siteDetailSqlResult['simowner'];

        $siteDetailSqlOne = "insert into sites_details(site_id,project,routebrand, router_id, simnumber, simowner, status, created_at, closedDate) values('".$id."',2,'".$routebrand."', '".$router_id."', '".$simnumber."', '".$simowner."', '1', '".$datetime."', '".$closedDate."')";
    }else{
        $siteDetailSqlOne = "insert into sites_details(site_id,project,routebrand, router_id, simnumber, simowner, status, created_at, closedDate) values('".$id."',2,'', '', '', '', '1', '".$datetime."', '".$closedDate."')";
    }
    echo $siteDetailSqlOne ; 
    mysqli_query($conn,$siteDetailSqlOne);

}

}

 ?>