<?php
include('config.php');


require 'vendor/autoload.php';
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Style\Border;
use PhpOffice\PhpSpreadsheet\Style\Fill;


$spreadsheet = new Spreadsheet();
$sheet = $spreadsheet->getActiveSheet();

function getColumnLabel($index) {
  $base26 = '';
  if ($index >= 26) {
      $base26 .= chr(65 + ($index / 26) - 1);
  }    
  $base26 .= chr(65 + ($index % 26));
  return $base26;
}

// $exportSql = $_REQUEST['exportSql']; 
// $sql_app = mysqli_query($con, $exportSql); 

$qry = $_POST['expqry'];  // sql 
$qrydata = $_POST['expdata']; // request data

$_project_id = "1";
if(isset($_POST['project'])){
	$_project_id = $_POST['project']; 
}


// error_reporting(0);
// ini_set('max_execution_time', 0);
// set_time_limit(0);



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

if ($qrydata == "RMS") {
   $filename = "RMS_SITES.csv";
   $fp = fopen('php://output', 'w');
    $headers = array(
      'Sr No',
      'Customer',
      'Bank',
      'Tracker No',
      'ATMID',
      'OLD ATMID',
      'ATMID_2',
      'ATMID_3',
      'ATMShortName',
      'SiteAddress',
      'City',
      'State',
      'Zone',
      'CTS_LocalBranch',
      'Panel_Make',
      'OldPanelID',
      'NewPanelID',
      'PanelIP',
      'DVRIP',
      'DVRName',
      'UserName',
      'Password',
      'Live',
      'Live Date',
      'Installation Engineer Name',
      'CTS Engineer Name',
      'CTS Engineer Number',
      'CSSBM',
      'CSSBMNumber',
      'CSS BM Email',
      'BackofficerName',
      'BackofficerNumber',
      'HeadSupervisorName',
      'HeadSupervisorNumber',
      'SupervisorName',
      'Supervisornumber',
      'RA Name',
      'RA Number',
      'Police Number',
      'Police Station',
      'Fire Station Name',
      'Fire Station number',
      'Atm Officer Name',
      'Atm Officer Number',
      'ATM Officer Email',
      'Zonal Co-ordinator Name',
      'Zonal Co-ordinator Number',
      'Zonal Co-ordinator Email',
      'Bank Officer Email ID',
      'CO Owner Name',
      'CO Owner Number',
      'CO Owner Email ID',
      'Zonal Name',
      'Zonal Number',
      'Zonal Email ID',
      'Installation date',
      'Site Add By',
      'Site Edit By',
      'GSM Number',
      'DVR_Model_num',
      'Router_Model_num',
      'Remarks',
      'Router Id',
      'SIM Number',
      'SIM Owner',
      'Router Brand',
      'Camera IP',
      'Port',
      'Ip Camera',
      'Bank Officer Name',
      'Bank Officer Number' 

      
    );

    header('Content-type: application/csv');
header('Content-Disposition: attachment; filename=' . $filename);
fputcsv($fp, $headers);

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



    $site_details = mysqli_query($conn, "select * from sites_details where site_id ='" . $id . "' and project='".$_project_id."'");

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

    $array_row = array();
    array_push($array_row,$srn);
    array_push($array_row,remove_special($rowarr['Customer']));
    array_push($array_row,remove_special($rowarr['Bank']));
    array_push($array_row,remove_special($rowarr['TrackerNo']));
    array_push($array_row,remove_special($rowarr['ATMID']));
    array_push($array_row,remove_special($rowarr['old_atmid']));
    array_push($array_row,remove_special($rowarr['ATMID_2']));
    array_push($array_row,remove_special($rowarr['ATMID_3']));
    array_push($array_row,remove_special($rowarr['ATMShortName']));

    array_push($array_row,remove_special($rowarr['SiteAddress']));
    array_push($array_row,remove_special($rowarr['City']));
    array_push($array_row,remove_special($rowarr['State']));
    array_push($array_row,remove_special($rowarr['Zone']));
    array_push($array_row,remove_special($row1['CTS_LocalBranch']));
    array_push($array_row,remove_special($rowarr['Panel_Make']));
    array_push($array_row,remove_special($rowarr['OldPanelID']));
    array_push($array_row,remove_special($rowarr['NewPanelID']));

    array_push($array_row,$rowarr['PanelIP']);
    array_push($array_row,$rowarr['DVRIP']);
    array_push($array_row,remove_special($rowarr['DVRName']));
    array_push($array_row,remove_special($rowarr['UserName']));
    array_push($array_row,remove_special($rowarr['Password']));
    array_push($array_row,remove_special($rowarr['live']));
    array_push($array_row,$rowarr['live_date']);
    array_push($array_row,remove_special($rowarr['eng_name']));
    
    array_push($array_row,remove_special($row1['CTS_Engineer_Name']));
    array_push($array_row,remove_special($row1['CTS_Engineer_Number']));
    array_push($array_row,remove_special($row1['CSSBM']));
    array_push($array_row,remove_special($row1['CSSBMNumber']));
    array_push($array_row,remove_special($row1['CSSBM_Email']));
    
    array_push($array_row,remove_special($row1['BackofficerName']));
    array_push($array_row,remove_special($row1['BackofficerNumber']));
    array_push($array_row,remove_special($row1['HeadSupervisorName']));
    array_push($array_row,remove_special($row1['HeadSupervisorNumber']));
    array_push($array_row,remove_special($row1['SupervisorName']));

    array_push($array_row,remove_special($row1['Supervisornumber']));
    array_push($array_row,remove_special($row1['RA_QRT_NAME']));
    array_push($array_row,remove_special($row1['RA_QRT_NUMBER']));
    array_push($array_row,remove_special($row1['Policestation']));
    array_push($array_row,remove_special($row1['Polstnname']));

    array_push($array_row,remove_special($row1['firestation_name']));
    array_push($array_row,remove_special($row1['firestation_number']));
    array_push($array_row,remove_special($row1['atm_officer_name']));
    array_push($array_row,remove_special($row1['atm_officer_number']));
    array_push($array_row,remove_special($row1['atm_officer_email']));

    array_push($array_row,remove_special($row1['zonal_co_ordinator_name']));
    array_push($array_row,remove_special($row1['zonal_co_ordinator_number']));
    array_push($array_row,remove_special($row1['zonal_co_ordinator_email']));
    array_push($array_row,remove_special($row1['Bank_Officer_Email_ID']));
    array_push($array_row,remove_special($row1['CO_Owner_Name']));

    array_push($array_row,remove_special($row1['CO_Owner_Number']));
    array_push($array_row,remove_special($row1['CO_Owner_Email_ID']));
    array_push($array_row,remove_special($row1['Zonal_Name']));
    array_push($array_row,remove_special($row1['Zonal_Number']));
    array_push($array_row,remove_special($row1['Zonal_Email_ID']));
    
    array_push($array_row,$rowarr['current_dt']);
    array_push($array_row,remove_special($rowarr['addedby']));
    array_push($array_row,remove_special($rowarr['editby']));
    array_push($array_row,remove_special($rowarr['TwoWayNumber']));
    array_push($array_row,remove_special($rowarr['DVR_Model_num']));

    array_push($array_row,remove_special($rowarr['Router_Model_num']));
    array_push($array_row,remove_special($rowarr['site_remark']));
    array_push($array_row,$router_id);
    array_push($array_row,getsiminfo($rowarr['ATMID'], 'simnnumber'));
    array_push($array_row,getsiminfo($rowarr['ATMID'], 'simowner'));
    
    array_push($array_row,$router_brand);
    array_push($array_row,$camera_ip);
    array_push($array_row,remove_special($port));
    array_push($array_row,remove_special($cam_name));
    array_push($array_row,remove_special($row1['bank_officer_name']));
    array_push($array_row,remove_special($row1['bank_officer_number']));
    
        
    $i++;
    $serial_number++;


    $row++;
    $srn++;

     fputcsv($fp, $array_row);
  }

   // Close the database connection
  mysqli_close($con);
  exit();
} else if ($qrydata == "DVR") {

  $headerStyle = [
    'font' => [
        'bold' => true, // Make the text bold
        'color' => ['rgb' => 'FFFFFF'], // Font color (white)
    ],
    'fill' => [
        'fillType' => Fill::FILL_SOLID,
        'startColor' => ['rgb' => '0070C0'], // Background color (blue)
    ],
    'borders' => [
        'outline' => [
            'borderStyle' => Border::BORDER_THIN,
            'color' => ['argb' => 'FF000000'], // Border color (black)
        ],
    ],
];
  ini_set('display_errors', 1);
  ini_set('display_startup_errors', 1);
  error_reporting(E_ALL);

  $headerStyles = [
    'font' => [
      'bold' => true, // Make the text bold
      'color' => ['rgb' => 'FFFFFF'], // Font color (white)
    ],
    'fill' => [
      'fillType' => Fill::FILL_SOLID,
      'startColor' => ['rgb' => '0070C0'], // Background color (blue)
    ],
    'borders' => [
      'outline' => [
        'borderStyle' => Border::BORDER_THIN,
        'color' => ['argb' => 'FF000000'], // Border color (black)
      ],
    ],
  ];


  $headers = array(
    'Sr No',
    'Customer',
    'Bank',
    'Tracker No',
    'ATMID',
    'ATMID_2',
    'ATMShortName',
    'SiteAddress',
    'City',
    'State',
    'Zone',
    'PanelIP',
    'DVRIP',
    'DVRName',
    'DVR_Model_num',

    'DVR_Serial_num',
    'CTSLocalBranch',


    'CTS_BM_Name',
    'CTS_BM_Number',
    'HDD',
    'Camera1',

    'Camera2',
    'Camera3',
    'Attachment1',
    'Attachment2',
    'LiveDate',
    'Site Remark',
    'User Name',
    'Password',

    'Router Id',
    'SIM Number',
    'SIM Owner',
    'Router Brand',
    'Live Status',
    'OLD ATMID',

  );


  foreach ($headers as $index => $header) {
    $column = getColumnLabel($index);
    $sheet->setCellValue($column . '1', $header);
    $sheet->getStyle($column . '1')->applyFromArray($headerStyle);
}


  // Initialize the row counter
  $i = 2; // Start from row 2 for data
  $serial_number = 1; // Initialize the serial number




  // $objSheet->getStyle('Q')->getAlignment()->setWrapText(true);
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


    $sheet->getStyle('A' . $i . ':AW' . $i)->applyFromArray([
      'borders' => [
          'allBorders' => [
              'borderStyle' => Border::BORDER_THIN,
              'color' => ['argb' => 'FF000000'], // Border color (black)
          ],
      ],
  ]);




    $sheet->setCellValue('A' . $i, $srn);
    $sheet->setCellValue('B' . $i, $rowarr['Customer']);
    $sheet->setCellValue('C' . $i, $rowarr['Bank']);
    $sheet->setCellValue('D' . $i, $rowarr['TrackerNo']);
    $sheet->setCellValue('E' . $i, $rowarr['ATMID']);
    $sheet->setCellValue('F' . $i, $rowarr['ATMID_2']);
    $sheet->setCellValue('G' . $i, $rowarr['ATMShortName']);
    $sheet->setCellValue('H' . $i, $rowarr['SiteAddress']);
    $sheet->setCellValue('I' . $i, $rowarr['City']);
    $sheet->setCellValue('J' . $i, $rowarr['State']);
    $sheet->setCellValue('K' . $i, $rowarr['Zone']);
    $sheet->setCellValue('L' . $i, $rowarr['PanelIP']);
    $sheet->setCellValue('M' . $i, $rowarr['DVRIP']);


    $sheet->setCellValue('N' . $i, $rowarr['DVRName']);
    $sheet->setCellValue('O' . $i, $rowarr['DVR_Model_num']);
    $sheet->setCellValue('P' . $i, $rowarr['DVR_Serial_num']);
    $sheet->setCellValue('Q' . $i, $rowarr['CTSLocalBranch']);
    $sheet->setCellValue('R' . $i, $rowarr['CTS_BM_Name']);
    $sheet->setCellValue('S' . $i, $rowarr['CTS_BM_Number']);
    $sheet->setCellValue('T' . $i, $rowarr['HDD']);
    $sheet->setCellValue('U' . $i, $rowarr['Camera1']);
    $sheet->setCellValue('V' . $i, $rowarr['Camera2']);
    $sheet->setCellValue('W' . $i, $rowarr['Camera3']);
    $sheet->setCellValue('X' . $i, $rowarr['Attachment1']);
    $sheet->setCellValue('Y' . $i, $rowarr['Attachment2']);
    $sheet->setCellValue('Z' . $i, $rowarr['liveDate']);
    $sheet->setCellValue('AA' . $i, $rowarr['site_remark']);
    $sheet->setCellValue('AB' . $i, $rowarr['UserName']);
    $sheet->setCellValue('AC' . $i, $rowarr['Password']);
    $sheet->setCellValue('AD' . $i, $router_id);

    $sheet->setCellValue('AE' . $i, getsiminfo($rowarr['ATMID'], 'simnnumber'));
    $sheet->setCellValue('AF' . $i, getsiminfo($rowarr['ATMID'], 'simowner'));

    $sheet->setCellValue('AG' . $i, $router_brand);
    $sheet->setCellValue('AH' . $i, $rowarr['live']);
    $sheet->setCellValue('AI' . $i, $rowarr['old_atmid']);

    $i++;
    $serial_number++;


    $row++;
    $srn++;
  }


  // Create a writer to save the Excel file
  $writer = new Xlsx($spreadsheet);

  // Save the Excel file to a temporary location
  $tempFile = tempnam(sys_get_temp_dir(), 'Inventory');
  $writer->save($tempFile);

  // Provide the file as a download to the user
  header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
  header('Content-Disposition: attachment;filename="DVR SITES.xlsx"');
  header('Cache-Control: max-age  =0');
  readfile($tempFile);

  // Close the database connection
  mysqli_close($con);

  // Clean up and delete the temporary file
  unlink($tempFile);
} else if ($qrydata == "Cloud") {

      $headerStyle = [
        'font' => [
            'bold' => true, // Make the text bold
            'color' => ['rgb' => 'FFFFFF'], // Font color (white)
        ],
        'fill' => [
            'fillType' => Fill::FILL_SOLID,
            'startColor' => ['rgb' => '0070C0'], // Background color (blue)
        ],
        'borders' => [
            'outline' => [
                'borderStyle' => Border::BORDER_THIN,
                'color' => ['argb' => 'FF000000'], // Border color (black)
            ],
        ],
    ];
      ini_set('display_errors', 1);
      ini_set('display_startup_errors', 1);
      error_reporting(E_ALL);

      $headerStyles = [
        'font' => [
          'bold' => true, // Make the text bold
          'color' => ['rgb' => 'FFFFFF'], // Font color (white)
        ],
        'fill' => [
          'fillType' => Fill::FILL_SOLID,
          'startColor' => ['rgb' => '0070C0'], // Background color (blue)
        ],
        'borders' => [
          'outline' => [
            'borderStyle' => Border::BORDER_THIN,
            'color' => ['argb' => 'FF000000'], // Border color (black)
          ],
        ],
      ];


      $headers = array(
        'Sr No',
        'Customer',
        'Bank',
        'Tracker No',
        'ATMID',
        'ATMID_2',
        'ATMShortName',
        'SiteAddress',
        'City',
        'State',
        'Zone',
        'PanelIP',
        'DVRIP',
        'DVRName',
        'DVR_Model_num',

        'DVR_Serial_num',
        'CTSLocalBranch',


        'CTS_BM_Name',
        'CTS_BM_Number',
        'HDD',
        'Camera1',

        'Camera2',
        'Camera3',
        'Attachment1',
        'Attachment2',
        'LiveDate',
        'Site Remark',
        'User Name',
        'Password',

        'Router Id',
        'SIM Number',
        'SIM Owner',
        'Router Brand',
        'Tracker',
        'BM Name',
        'Engineer Name',
        'Status Date',
        'OLD ATMID',
        'Installation Date',
        'Status'

      );


  foreach ($headers as $index => $header) {
    $column = getColumnLabel($index);
    $sheet->setCellValue($column . '1', $header);
    $sheet->getStyle($column . '1')->applyFromArray($headerStyle);
}


  // Initialize the row counter
  $i = 2; // Start from row 2 for data
  $serial_number = 1; // Initialize the serial number




  // $objSheet->getStyle('Q')->getAlignment()->setWrapText(true);
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


    
    $sheet->getStyle('A' . $i . ':AW' . $i)->applyFromArray([
        'borders' => [
            'allBorders' => [
                'borderStyle' => Border::BORDER_THIN,
                'color' => ['argb' => 'FF000000'], // Border color (black)
            ],
        ],
    ]);




    $sheet->setCellValue('A' . $i, $srn);
    $sheet->setCellValue('B' . $i, $rowarr['customer']);
    $sheet->setCellValue('C' . $i, "NA");
    $sheet->setCellValue('D' . $i, "NA");
    $sheet->setCellValue('E' . $i, $rowarr['ATMID']);
    $sheet->setCellValue('F' . $i, "NA");
    $sheet->setCellValue('G' . $i, $rowarr['Address']);
    $sheet->setCellValue('H' . $i, $rowarr['Location']);
    $sheet->setCellValue('I' . $i, $rowarr['city']);
    $sheet->setCellValue('J' . $i, $rowarr['State']);
    $sheet->setCellValue('K' . $i, $rowarr['zone']);
    $sheet->setCellValue('L' . $i, $rowarr['IPAddress']);
    $sheet->setCellValue('M' . $i, $rowarr['IPAddress']);


    $sheet->setCellValue('N' . $i, $rowarr['dvrname']);
    $sheet->setCellValue('O' . $i, "NA");
    $sheet->setCellValue('P' . $i, "NA");
    $sheet->setCellValue('Q' . $i, "NA");
    $sheet->setCellValue('R' . $i, "NA");
    $sheet->setCellValue('S' . $i, "NA");
    $sheet->setCellValue('T' . $i, "NA");
    $sheet->setCellValue('U' . $i, "NA");
    $sheet->setCellValue('V' . $i, "NA");
    $sheet->setCellValue('W' . $i, "NA");
    $sheet->setCellValue('X' . $i, "NA");
    $sheet->setCellValue('Y' . $i, "NA");
    $sheet->setCellValue('Z' . $i, $rowarr['Live Date']);
    $sheet->setCellValue('AA' . $i, "NA");
    $sheet->setCellValue('AB' . $i, $rowarr['UserName']);
    $sheet->setCellValue('AC' . $i, $rowarr['Password']);
    $sheet->setCellValue('AD' . $i, $router_id);

    $sheet->setCellValue('AE' . $i, getsiminfo($rowarr['ATMID'], 'simnnumber'));
    $sheet->setCellValue('AF' . $i, getsiminfo($rowarr['ATMID'], 'simowner'));

    $sheet->setCellValue('AG' . $i, $router_brand);
    $sheet->setCellValue('AH' . $i, $tracker);
    $sheet->setCellValue('AI' . $i, $bmName);

    $sheet->setCellValue('AG' . $i, $engineerName);
    $sheet->setCellValue('AH' . $i, $statusDate);
    $sheet->setCellValue('AI' . $i, $rowarr['old_atm']);
    $sheet->setCellValue('AJ' . $i, $rowarr['installationDate']);
    $sheet->setCellValue('AK' . $i, $rowarr['Status']);

    $i++;
    $serial_number++;


    $row++;
    $srn++;

    
  }
  
  // Create a writer to save the Excel file
  $writer = new Xlsx($spreadsheet);

  // Save the Excel file to a temporary location
  $tempFile = tempnam(sys_get_temp_dir(), 'Inventory');
  $writer->save($tempFile);

  // Provide the file as a download to the user
  header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
  header('Content-Disposition: attachment;filename="CLOUD SITES.csv"');
  header('Cache-Control: max-age  =0');
  readfile($tempFile);

  // Close the database connection
  mysqli_close($con);

  // Clean up and delete the temporary file
  unlink($tempFile);


}
