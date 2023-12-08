<?php

error_reporting(0);
ini_set('max_execution_time', 0);
set_time_limit(0);



function endsWith($haystack, $needle)
{
  $length = strlen($needle);

  return $length === 0 ||
    (substr($haystack, -$length) === $needle);
}

function clean($string)
{
  $string = str_replace('-', ' ', $string); // Replaces all spaces with hyphens.

  return preg_replace('/[^A-Za-z0-9\-]/', ' ', $string); // Removes special chars.
}

function remove_special($site_remark2)
{
  $site_remark2_arr = explode(" ", $site_remark2);

  foreach ($site_remark2_arr as $k => $v) {
    $a[] = preg_split('/\n/', $v);
  }

  $site_remark = '';
  foreach ($a as $key => $value) {
    foreach ($value as $ke => $va) {
      $site_remark .= $va . " ";
    }
  }

  return clean($site_remark);
}





include('config.php');

$qry = $_POST['expqry'];
$qrydata = $_POST['expdata'];
//echo $qry;

require_once 'Classes/PHPExcel.php';

require_once "Classes/PHPExcel/IOFactory.php";

include_once 'Classes/PHPExcel/Writer/Excel5.php';

// create new PHPExcel object
$objPHPExcel = new PHPExcel();

ini_set('memory_limit', '-1');
/*
function getsiminfo($atmid,$parameter){
  global $conn;

  $sql = mysqli_query($conn,"select $parameter from sites_siminfo where atmid='".$atmid."'");
  $sql_result = mysqli_fetch_assoc($sql);

  return $sql_result[$parameter];
}
*/

function getsiminfo($atmid, $parameter)
{
  global $conn;

  // echo "select $parameter from sites_siminfo where atmid='".$atmid."'";
  $sql = mysqli_query($conn, "select $parameter from sites_siminfo where atmid='" . $atmid . "'");
  $sql_result = mysqli_fetch_assoc($sql);
  return $sql_result[$parameter];
}


function get_livedatetime($atmid)
{
  global $conn;
  $live_date = array();
  // echo "select live_date from sites_log where ATMID='".$atmid."'";
  $sql = mysqli_query($conn, "select live_date from sites_log where ATMID='" . $atmid . "'");
  while ($sql_result = mysqli_fetch_assoc($sql)) {
    $live_date[] = $sql_result['live_date'];
  }
  return $live_date;
}



function get_sites_info($atmid, $parameter)
{
  global $conn;
  $info = array();


  $sql = mysqli_query($conn, "select $parameter from sites_info where atmid='" . $atmid . "' order by id desc");

  while ($sql_result = mysqli_fetch_assoc($sql)) {
    $info[] = $sql_result[$parameter];
  }

  return  $info;
}




//Prevent your script from timing out

// This increases the excution time from 30 secs to 3000 secs.
//set_time_limit ( 3000 ); 


// writer already created the first sheet for us, let's get it
$objSheet = $objPHPExcel->getActiveSheet();

//rename the sheet
$objSheet->setTitle('Sites details');


if ($qrydata == "RMS") {











  $contents = '';
  $contents .= "Sr No \t Customer \t Bank \t Tracker No \t ATMID \t OLD ATMID \t ATMID_2 \t ATMID_3 \t ATMShortName \t SiteAddress \t City \t State \t Zone \t CTS_LocalBranch \t Panel_Make \t OldPanelID \t NewPanelID \t PanelIP \t DVRIP \t DVRName \t UserName \t Password \t Live \t Live Date \t Installation Engineer Name \t CTS Engineer Name \t CTS Engineer Number \t CSSBM \t CSSBMNumber \t CSS BM Email \t BackofficerName \t BackofficerNumber \t HeadSupervisorName \t HeadSupervisorNumber \t SupervisorName \t Supervisornumber \t RA Name \t RA Number \t Police Number \t Police Station \t Fire Station Name \t Fire Station number \t Atm Officer Name \t Atm Officer Number \t ATM Officer Email \t Zonal Co-ordinator Name \t Zonal Co-ordinator Number \t Zonal Co-ordinator Email \t Bank Officer Email ID \t CO Owner Name \t CO Owner Number \t CO Owner Email ID \t Zonal Name \t Zonal Number \t Zonal Email ID \t Installation date \t Site Add By \t Site Edit By \t GSM Number \t DVR_Model_num \t Router_Model_num \t Remarks \t Router Id \t SIM Number \t SIM Owner \t Router Brand \t Camera IP \t Port \t Ip Camera \t Bank Officer Name \t Bank Officer Number \t ";



  $sqry = mysqli_query($conn, $qry);

  $num = mysqli_num_rows($sqry);


  $count = 0;
  $srn = 1;
  $apptotamt = 0;
  $row = 2;



  while ($rowarr = mysqli_fetch_array($sqry)) {
    $excelCount = 0;
    $id = $rowarr['SN'];
    $sql1 = "select * from esurvsites where ATM_ID='" . $rowarr["ATMID"] . "'";

    $result1 = mysqli_query($conn, $sql1);
    $row1 = mysqli_fetch_array($result1);



    $site_details = mysqli_query($conn, "select * from sites_details where site_id ='" . $id . "' and project='1'");

    if ($site_details_result = mysqli_fetch_assoc($site_details)) {

      $router_id = $site_details_result['router_id'];
      $simnumber = $site_details_result['simnumber'];
      $simowner = $site_details_result['simowner'];
      $router_brand = $site_details_result['routebrand'];
    } else {
      $router_id = '';
      $simnumber = '';
      $simowner = '';
      $router_brand = '';
    }

    $data = '';
    $camera_ip = '';
    $data = get_sites_info($rowarr["ATMID"], 'cam_ip');
    foreach ($data as $key => $value) {
      $camera_ip .=  $value . ",";
    }

    $data = '';
    $port = '';
    $data = get_sites_info($rowarr["ATMID"], 'port');
    foreach ($data as $key => $value) {
      $port .= $value . ",";
    }

    $data = '';
    $cam_name = '';
    $data = get_sites_info($rowarr["ATMID"], 'cam_name');
    foreach ($data as $key => $value) {
      $cam_name .= $value . ",";
    }




    $rowarr['Customer'];

    $contents .= "\n" . $srn . "\t";

    $contents .= trim(remove_special($rowarr['Customer'])) . "\t";
    $contents .= trim(remove_special($rowarr['Bank'])) . "\t";
    $contents .= trim(remove_special($rowarr['TrackerNo'])) . "\t";
    $contents .= trim(remove_special($rowarr['ATMID'])) . "\t";
    $contents .= trim(remove_special($rowarr['old_atmid'])) . "\t";
    $contents .= trim(remove_special($rowarr['ATMID_2'])) . "\t";
    $contents .= trim(remove_special($rowarr['ATMID_3'])) . "\t";
    $contents .= trim(remove_special($rowarr['ATMShortName'])) . "\t";
    $contents .= trim(remove_special($rowarr['SiteAddress'])) . "\t";
    $contents .= trim(remove_special($rowarr['City'])) . "\t";
    $contents .= trim(remove_special($rowarr['State'])) . "\t";
    $contents .= trim(remove_special($rowarr['Zone'])) . "\t";
    $contents .= trim(remove_special($row1['CTS_LocalBranch'])) . "\t";
    $contents .= trim(remove_special($rowarr['Panel_Make'])) . "\t";
    $contents .= trim(remove_special($rowarr['OldPanelID'])) . "\t";
    $contents .= trim(remove_special($rowarr['NewPanelID'])) . "\t";
    $contents .= $rowarr['PanelIP'] . "\t";
    $contents .= $rowarr['DVRIP'] . "\t";
    $contents .= trim(remove_special($rowarr['DVRName'])) . "\t";
    $contents .= trim(remove_special($rowarr['UserName'])) . "\t";
    $contents .= trim(remove_special($rowarr['Password'])) . "\t";
    $contents .= trim(remove_special($rowarr['live'])) . "\t";
    $contents .= $rowarr['live_date'] . "\t";
    $contents .= trim(remove_special($rowarr['eng_name'])) . "\t";
    $contents .= trim(remove_special($row1['CTS_Engineer_Name'])) . "\t";
    $contents .= trim(remove_special($row1['CTS_Engineer_Number'])) . "\t";
    $contents .= trim(remove_special($row1['CSSBM'])) . "\t";
    $contents .= trim(remove_special($row1['CSSBMNumber'])) . "\t";
    $contents .= trim(remove_special($row1['CSSBM_Email'])) . "\t";
    $contents .= trim(remove_special($row1['BackofficerName'])) . "\t";
    $contents .= trim(remove_special($row1['BackofficerNumber'])) . "\t";
    $contents .= trim(remove_special($row1['HeadSupervisorName'])) . "\t";
    $contents .= trim(remove_special($row1['HeadSupervisorNumber'])) . "\t";
    $contents .= trim(remove_special($row1['SupervisorName'])) . "\t";
    $contents .= trim(remove_special($row1['Supervisornumber'])) . "\t";
    $contents .= trim(remove_special($row1['RA_QRT_NAME'])) . "\t";
    $contents .= trim(remove_special($row1['RA_QRT_NUMBER'])) . "\t";
    $contents .= trim(remove_special($row1['Policestation'])) . "\t";
    $contents .= trim(remove_special($row1['Polstnname'])) . "\t";
    $contents .= trim(remove_special($row1['firestation_name'])) . "\t";
    $contents .= trim(remove_special($row1['firestation_number'])) . "\t";
    $contents .= trim(remove_special($row1['atm_officer_name'])) . "\t";
    $contents .= trim(remove_special($row1['atm_officer_number'])) . "\t";
    $contents .= trim(remove_special($row1['atm_officer_email'])) . "\t";
    $contents .= trim(remove_special($row1['zonal_co_ordinator_name'])) . "\t";
    $contents .= trim(remove_special($row1['zonal_co_ordinator_number'])) . "\t";
    $contents .= trim(remove_special($row1['zonal_co_ordinator_email'])) . "\t";
    $contents .= trim(remove_special($row1['Bank_Officer_Email_ID'])) . "\t";
    $contents .= trim(remove_special($row1['CO_Owner_Name'])) . "\t";
    $contents .= trim(remove_special($row1['CO_Owner_Number'])) . "\t";
    $contents .= trim(remove_special($row1['CO_Owner_Email_ID'])) . "\t";
    $contents .= trim(remove_special($row1['Zonal_Name'])) . "\t";
    $contents .= trim(remove_special($row1['Zonal_Number'])) . "\t";
    $contents .= trim(remove_special($row1['Zonal_Email_ID'])) . "\t";
    $contents .= $rowarr['current_dt'] . "\t";
    $contents .= trim(remove_special($rowarr['addedby'])) . "\t";
    $contents .= trim(remove_special($rowarr['editby'])) . "\t";
    $contents .= trim(remove_special($row1['TwoWayNumber'])) . "\t";
    $contents .= trim(remove_special($rowarr['DVR_Model_num'])) . "\t";
    $contents .= trim(remove_special($rowarr['Router_Model_num'])) . "\t";
    $contents .= trim(remove_special($rowarr['site_remark'])) . "\t";
    $contents .= trim(remove_special($router_id)) . "\t";
    $contents .= trim(remove_special(getsiminfo($rowarr['ATMID'], 'simnnumber'))) . "\t";
    $contents .= trim(remove_special(getsiminfo($rowarr['ATMID'], 'simowner'))) . "\t";
    $contents .= trim(remove_special($router_brand)) . "\t";
    $contents .= $camera_ip . "\t";
    $contents .= trim(remove_special($port)) . "\t";
    $contents .= trim(remove_special($cam_name)) . "\t";
    $contents .= trim(remove_special($row1['bank_officer_name'])) . "\t";
    $contents .= trim(remove_special($row1['bank_officer_number'])) . "\t";



    $row++;
    $srn++;
  }
  header("Content-Disposition: attachment; filename=sites.xls");
  header("Content-Type: application/vnd.ms-excel");
  print $contents;


  return;
} else if ($qrydata == "DVR") {




  $objSheet->setCellValue('A1', 'Sr No');
  $objSheet->setCellValue('B1', 'Customer');
  $objSheet->setCellValue('C1', 'Bank');
  $objSheet->setCellValue('D1', 'Tracker No');
  $objSheet->setCellValue('E1', 'ATMID');
  $objSheet->setCellValue('F1', 'ATMID_2');

  $objSheet->setCellValue('G1', 'ATMShortName');
  $objSheet->setCellValue('H1', 'SiteAddress');

  $objSheet->setCellValue('I1', 'City');
  $objSheet->setCellValue('J1', 'State');
  $objSheet->setCellValue('K1', 'Zone');
  $objSheet->setCellValue('L1', 'PanelIP');
  $objSheet->setCellValue('M1', 'DVRIP');
  $objSheet->setCellValue('N1', 'DVRName');
  $objSheet->setCellValue('O1', 'DVR_Model_num');

  $objSheet->setCellValue('P1', 'DVR_Serial_num');
  $objSheet->setCellValue('Q1', 'CTSLocalBranch');


  $objSheet->setCellValue('R1', 'CTS_BM_Name');
  $objSheet->setCellValue('S1', 'CTS_BM_Number');
  $objSheet->setCellValue('T1', 'HDD');
  $objSheet->setCellValue('U1', 'Camera1');

  $objSheet->setCellValue('V1', 'Camera2');
  $objSheet->setCellValue('W1', 'Camera3');
  $objSheet->setCellValue('X1', 'Attachment1');
  $objSheet->setCellValue('Y1', 'Attachment2');
  $objSheet->setCellValue('Z1', 'LiveDate');
  $objSheet->setCellValue('AA1', 'Site Remark');
  $objSheet->setCellValue('AB1', 'User Name');
  $objSheet->setCellValue('AC1', 'Password');

  $objSheet->setCellValue('AD1', 'Router Id');
  $objSheet->setCellValue('AE1', 'SIM Number');
  $objSheet->setCellValue('AF1', 'SIM Owner');
  $objSheet->setCellValue('AG1', 'Router Brand');
  $objSheet->setCellValue('AH1', 'Live Status');
  $objSheet->setCellValue('AI1', 'OLD ATMID');



  $objSheet->getStyle('Q')->getAlignment()->setWrapText(true);
  $sqry = mysqli_query($conn, $qry);
  $num = mysqli_num_rows($sqry);


  $count = 0;
  $srn = 1;
  $apptotamt = 0;
  $row = 2;
  while ($rowarr = mysqli_fetch_array($sqry)) {
    $sql1 = "select * from esurvsites where ATM_ID='" . $rowarr["ATMID"] . "'";

    $result1 = mysqli_query($conn, $sql1);
    $row1 = mysqli_fetch_array($result1);
    //$qsales=mysql_query("select salesmanName from salesman_login where id='".$rowarr[13]."' ");
    //$qsalesdata=mysql_fetch_array($qsales);
    $id = $rowarr['SN'];
    $site_details = mysqli_query($conn, "select * from sites_details where site_id ='" . $id . "' and project='2'");
    if ($site_details_result = mysqli_fetch_assoc($site_details)) {
      $router_id = $site_details_result['router_id'];
      $simnumber = $site_details_result['simnumber'];
      $simowner = $site_details_result['simowner'];
      $router_brand = $site_details_result['routebrand'];
    } else {
      $router_id = '';
      $simnumber = '';
      $simowner = '';
      $router_brand = '';
    }




    $objSheet->setCellValueByColumnAndRow(0, $row, $srn);
    $objSheet->setCellValueByColumnAndRow(1, $row, $rowarr['Customer']);
    $objSheet->setCellValueByColumnAndRow(2, $row, $rowarr['Bank']);
    $objSheet->setCellValueByColumnAndRow(3, $row, $rowarr['TrackerNo']);
    $objSheet->setCellValueByColumnAndRow(4, $row, $rowarr['ATMID']);
    $objSheet->setCellValueByColumnAndRow(5, $row, $rowarr['ATMID_2']);
    $objSheet->setCellValueByColumnAndRow(6, $row, $rowarr['ATMShortName']);
    $objSheet->setCellValueByColumnAndRow(7, $row, $rowarr['SiteAddress']);
    $objSheet->setCellValueByColumnAndRow(8, $row, $rowarr['City']);
    $objSheet->setCellValueByColumnAndRow(9, $row, $rowarr['State']);
    $objSheet->setCellValueByColumnAndRow(10, $row, $rowarr['Zone']);
    $objSheet->setCellValueByColumnAndRow(11, $row, $rowarr['PanelIP']);
    $objSheet->setCellValueByColumnAndRow(12, $row, $rowarr['DVRIP']);


    $objSheet->setCellValueByColumnAndRow(13, $row, $rowarr['DVRName']);
    $objSheet->setCellValueByColumnAndRow(14, $row, $rowarr['DVR_Model_num']);
    $objSheet->setCellValueByColumnAndRow(15, $row, $rowarr['DVR_Serial_num']);
    $objSheet->setCellValueByColumnAndRow(16, $row, $rowarr['CTSLocalBranch']);
    $objSheet->setCellValueByColumnAndRow(17, $row, $rowarr['CTS_BM_Name']);
    $objSheet->setCellValueByColumnAndRow(18, $row, $rowarr['CTS_BM_Number']);
    $objSheet->setCellValueByColumnAndRow(19, $row, $rowarr['HDD']);
    $objSheet->setCellValueByColumnAndRow(20, $row, $rowarr['Camera1']);

    $objSheet->setCellValueByColumnAndRow(21, $row, $rowarr['Camera2']);
    $objSheet->setCellValueByColumnAndRow(22, $row, $rowarr['Camera3']);
    $objSheet->setCellValueByColumnAndRow(23, $row, $rowarr['Attachment1']);
    $objSheet->setCellValueByColumnAndRow(24, $row, $rowarr['Attachment2']);
    $objSheet->setCellValueByColumnAndRow(25, $row, $rowarr['liveDate']);
    $objSheet->setCellValueByColumnAndRow(26, $row, $rowarr['site_remark']);
    $objSheet->setCellValueByColumnAndRow(27, $row, $rowarr['UserName']);
    $objSheet->setCellValueByColumnAndRow(28, $row, $rowarr['Password']);

    $objSheet->setCellValueByColumnAndRow(29, $row, $router_id);

    $objSheet->setCellValueByColumnAndRow(30, $row, getsiminfo($rowarr['ATMID'], 'simnnumber'));
    $objSheet->setCellValueByColumnAndRow(31, $row, getsiminfo($rowarr['ATMID'], 'simowner'));

    $objSheet->setCellValueByColumnAndRow(32, $row, $router_brand);
    $objSheet->setCellValueByColumnAndRow(33, $row, $rowarr['live']);
    $objSheet->setCellValueByColumnAndRow(34, $row, $rowarr['old_atmid']);

    $row++;
    $srn++;
  }
} else if ($qrydata == "Cloud") {

  $objSheet->setCellValue('A1', 'Sr No');
  $objSheet->setCellValue('B1', 'Customer');
  $objSheet->setCellValue('C1', 'Bank');
  $objSheet->setCellValue('D1', 'Tracker No');
  $objSheet->setCellValue('E1', 'ATMID');
  $objSheet->setCellValue('F1', 'ATMID_2');
  $objSheet->setCellValue('G1', 'ATMShortName');
  $objSheet->setCellValue('H1', 'SiteAddress');
  $objSheet->setCellValue('I1', 'City');
  $objSheet->setCellValue('J1', 'State');
  $objSheet->setCellValue('K1', 'Zone');
  $objSheet->setCellValue('L1', 'PanelIP');
  $objSheet->setCellValue('M1', 'DVRIP');
  $objSheet->setCellValue('N1', 'DVRName');
  $objSheet->setCellValue('O1', 'DVR_Model_num');
  $objSheet->setCellValue('P1', 'DVR_Serial_num');
  $objSheet->setCellValue('Q1', 'CTSLocalBranch');
  $objSheet->setCellValue('R1', 'CTS_BM_Name');
  $objSheet->setCellValue('S1', 'CTS_BM_Number');
  $objSheet->setCellValue('T1', 'HDD');
  $objSheet->setCellValue('U1', 'Camera1');
  $objSheet->setCellValue('V1', 'Camera2');
  $objSheet->setCellValue('W1', 'Camera3');
  $objSheet->setCellValue('X1', 'Attachment1');
  $objSheet->setCellValue('Y1', 'Attachment2');
  $objSheet->setCellValue('Z1', 'LiveDate');
  $objSheet->setCellValue('AA1', 'Site Remark');
  $objSheet->setCellValue('AB1', 'User Name');
  $objSheet->setCellValue('AC1', 'Password');
  $objSheet->setCellValue('AD1', 'Router Id');
  $objSheet->setCellValue('AE1', 'SIM Number');
  $objSheet->setCellValue('AF1', 'SIM Owner');
  $objSheet->setCellValue('AG1', 'Router Brand');
  $objSheet->setCellValue('AH1', 'Tracker');
  $objSheet->setCellValue('AI1', 'BM Name');
  $objSheet->setCellValue('AJ1', 'Engineer Name');
  $objSheet->setCellValue('AK1', 'Status Date');

  $objSheet->setCellValue('AL1', 'OLD ATMID');
  $objSheet->setCellValue('AM1', 'Installation Date');
  $objSheet->setCellValue('AN1', 'Status');






  $objSheet->getStyle('Q')->getAlignment()->setWrapText(true);
  $sqry = mysqli_query($conn, $qry);
  $num = mysqli_num_rows($sqry);


  $count = 0;
  $srn = 1;
  $apptotamt = 0;
  $row = 2;
  while ($rowarr = mysqli_fetch_array($sqry)) {
    $sql1 = "select * from esurvsites where ATM_ID='" . $rowarr["ATMID"] . "'";

    $result1 = mysqli_query($conn, $sql1);
    $row1 = mysqli_fetch_array($result1);

    $id = $rowarr['id'];
    $site_details = mysqli_query($conn, "select * from sites_details where site_id ='" . $id . "' and project='3'");
    if ($site_details_result = mysqli_fetch_assoc($site_details)) {
      $router_id = $site_details_result['router_id'];
      $simnumber = $site_details_result['simnumber'];
      $simowner = $site_details_result['simowner'];
      $router_brand = $site_details_result['routebrand'];
    } else {
      $router_id = '';
      $simnumber = '';
      $simowner = '';
      $router_brand = '';
    }




    $dvronline_details = mysqli_query($conn, "select * from dvronline_details where dvrid='" . $id . "' order by id desc");
    $dvronline_details_result = mysqli_fetch_assoc($dvronline_details);

    $tracker = $dvronline_details_result['tracker'];
    $bmName = $dvronline_details_result['bmName'];
    $engineerName = $dvronline_details_result['engineerName'];
    $statusDate = $dvronline_details_result['statusDate'];




    $objSheet->setCellValueByColumnAndRow(0, $row, $srn);
    $objSheet->setCellValueByColumnAndRow(1, $row, $rowarr['customer']);
    $objSheet->setCellValueByColumnAndRow(2, $row, "NA");
    $objSheet->setCellValueByColumnAndRow(3, $row, "NA");
    $objSheet->setCellValueByColumnAndRow(4, $row, $rowarr['ATMID']);
    $objSheet->setCellValueByColumnAndRow(5, $row, "NA");
    $objSheet->setCellValueByColumnAndRow(6, $row, $rowarr['Address']);
    $objSheet->setCellValueByColumnAndRow(7, $row, $rowarr['Location']);
    $objSheet->setCellValueByColumnAndRow(8, $row, $rowarr['city']);
    $objSheet->setCellValueByColumnAndRow(9, $row, $rowarr['State']);
    $objSheet->setCellValueByColumnAndRow(10, $row, $rowarr['zone']);
    $objSheet->setCellValueByColumnAndRow(11, $row, $rowarr['IPAddress']);

    $objSheet->setCellValueByColumnAndRow(12, $row, $rowarr['IPAddress']);
    $objSheet->setCellValueByColumnAndRow(13, $row, $rowarr['dvrname']);
    $objSheet->setCellValueByColumnAndRow(14, $row, "NA");
    $objSheet->setCellValueByColumnAndRow(15, $row, "NA");
    $objSheet->setCellValueByColumnAndRow(16, $row, "NA");
    $objSheet->setCellValueByColumnAndRow(17, $row, "NA");
    $objSheet->setCellValueByColumnAndRow(18, $row, "NA");
    $objSheet->setCellValueByColumnAndRow(19, $row, "NA");
    $objSheet->setCellValueByColumnAndRow(20, $row, "NA");

    $objSheet->setCellValueByColumnAndRow(21, $row, "NA");
    $objSheet->setCellValueByColumnAndRow(22, $row, "NA");
    $objSheet->setCellValueByColumnAndRow(23, $row, "NA");
    $objSheet->setCellValueByColumnAndRow(24, $row, "NA");
    $objSheet->setCellValueByColumnAndRow(25, $row, $rowarr['Live Date']);
    $objSheet->setCellValueByColumnAndRow(26, $row, "NA");
    $objSheet->setCellValueByColumnAndRow(27, $row, $rowarr['UserName']);
    $objSheet->setCellValueByColumnAndRow(28, $row, $rowarr['Password']);


    $objSheet->setCellValueByColumnAndRow(29, $row, $router_id);

    $objSheet->setCellValueByColumnAndRow(30, $row, getsiminfo($rowarr['ATMID'], 'simnnumber'));
    $objSheet->setCellValueByColumnAndRow(31, $row, getsiminfo($rowarr['ATMID'], 'simowner'));

    $objSheet->setCellValueByColumnAndRow(32, $row, $router_brand);


    $objSheet->setCellValueByColumnAndRow(33, $row, $tracker);
    $objSheet->setCellValueByColumnAndRow(34, $row, $bmName);
    $objSheet->setCellValueByColumnAndRow(35, $row, $engineerName);
    $objSheet->setCellValueByColumnAndRow(36, $row, $statusDate);

    $objSheet->setCellValueByColumnAndRow(37, $row, $rowarr['old_atm']);
    $objSheet->setCellValueByColumnAndRow(38, $row, $rowarr['installationDate']);
    $objSheet->setCellValueByColumnAndRow(39, $row, $rowarr['Status']);
    
    


    $row++;
    $srn++;
  }
}



$contents = strip_tags($contents);














$lastrow = intval($srn) + intval(1);

//$objSheet->getStyle('A1:AD1')->getFont()->setBold(true)->setSize(12);
$highestRow = $objSheet->getHighestRow();
$objSheet->setCellValueByColumnAndRow(19, $lastrow, $apptotamt);

header("Content-Disposition: attachment; filename=sites.xls");
header("Content-Type: application/vnd.ms-excel");

$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
$objWriter->save("php://output");
