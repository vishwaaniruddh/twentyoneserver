<?php
include('config.php');
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);



$sql = mysqli_query($conn,"select * from site_circle");
while($sql_result = mysqli_fetch_assoc($sql)){


    $atmid = $sql_result['ATMID'];
    $id = $sql_result['id'];


    $sn = mysqli_fetch_assoc(mysqli_query($conn,"select SN from sites where ATMID='".$atmid."'"))['SN'];

mysqli_query($conn,"update site_circle set sn='".$sn."' where id='".$id."'");


}





return ; 
set_time_limit(-1); // Disable the script execution time limit

session_start();
include('config.php');
error_reporting(1);

require 'vendor/autoload.php';


use PhpOffice\PhpSpreadsheet\Spreadsheet;

use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

$batchSize = 110000; // Set the batch size

// Get the current batch number from the session
$currentBatch = isset($_SESSION['currentBatch']) ? $_SESSION['currentBatch'] : 1;

// Calculate the offset based on the current batch
$offset = ($currentBatch - 1) * $batchSize;


// Create a new spreadsheet
$spreadsheet = new Spreadsheet();
$sheet = $spreadsheet->getActiveSheet();

// SQL Query
$statement = "SELECT a.Customer AS 'Client Name', b.id AS 'Incident Number', a.Zone AS Region, a.ATMID,
 a.SiteAddress AS Address, a.City, a.State, b.createtime AS 'Incident Date Time',
 b.receivedtime AS 'Alarm Received Date Time', b.receivedtime AS 'Close Date Time', a.DVRIP, b.panelid, a.Bank,
(CASE WHEN LOWER(RIGHT(b.alarm,1))='R' THEN 'Non-Reactive' ELSE 'Reactive' END) AS `Reactive`,
b.closedBy AS 'Closed By', b.closedtime AS 'Closed Date', 
CONCAT(b.closedtime, '*', b.comment, '*', b.closedBy) AS Remark,
b.zone, b.alarm,
a.Panel_Make,
'' AS  `Incident Category`,
(CASE WHEN LOWER(RIGHT(b.alarm,1))='R' THEN 'Restoral' END) AS `Alarm Message`
FROM alerts b 
INNER JOIN sites a ON b.panelid = a.NewPanelID
LEFT JOIN sites c ON b.panelid = c.OldPanelID
WHERE 1 ";

// Modify the SQL query to include LIMIT and OFFSET
$statement .= " LIMIT $batchSize OFFSET $offset";

// Execute the modified SQL query
$sql = mysqli_query($conn, $statement);

$headerRow = [
    'Sr No',
    'Client Name',
    'Incident Number',
    'Region',
    'ATMID',
    'Address',
    'City',
    'State',
    'Incident Category',
    'Alarm Message',
    'Incident Date Time',
    'Alarm Received Date Time',
    'Close Date Time',
    'DVRIP',
    'Panel_make',
    'panelid',
    'Bank',
    'Reactive',
    'Closed By',
    'Closed Date',
    'Remark',
    'Zone',
    'alarm'
];


$columnIndex = 1;
foreach ($headerRow as $header) {
    $sheet->setCellValueByColumnAndRow($columnIndex, 1, $header);
    $columnIndex++;
}


$rowIndex = 2;
$srno = 1;

$rowIndex = 2; // Start from the second row (after headers)
$srno = 1; // Reset Sr No for each batch

while ($row = mysqli_fetch_assoc($sql)) {
    $columnIndex = 1; // Reset column index for each row
    

    $_panel_make = $row['Panel_Make'];
    $_zone = $row['zone'];


    if ($_panel_make == 'RASS') {
        $_b_sql = mysqli_query($conn, "select SensorName from rass WHERE ZONE like '" . $_zone . "'");
        $_b_sql_result = mysqli_fetch_assoc($_b_sql);
        $sensorname = $_b_sql_result['SensorName'];
    } elseif ($_panel_make == 'rass_sbi') {
        $_b_sql = mysqli_query($conn, "select SensorName from rass_sbi WHERE ZONE like '" . $_zone . "'");
        $_b_sql_result = mysqli_fetch_assoc($_b_sql);
        $sensorname = $_b_sql_result['SensorName'];
    } elseif ($_panel_make == 'rass_cloud') {
        $_b_sql = mysqli_query($conn, "select SensorName from rass_cloud WHERE ZONE like '" . $_zone . "'");
        $_b_sql_result = mysqli_fetch_assoc($_b_sql);
        $sensorname = $_b_sql_result['SensorName'];
    } elseif ($_panel_make == 'rass_boi') {
        $_b_sql = mysqli_query($conn, "select SensorName from rass_boi WHERE ZONE like '" . $_zone . "'");
        $_b_sql_result = mysqli_fetch_assoc($_b_sql);
        $sensorname = $_b_sql_result['SensorName'];
    } elseif ($_panel_make == 'Raxx') {
        $_b_sql = mysqli_query($conn, "select SensorsName from Raxx WHERE ZoneNumber like '" . $_zone . "'");
        $_b_sql_result = mysqli_fetch_assoc($_b_sql);
        $sensorname = $_b_sql_result['SensorsName'];
    } elseif ($_panel_make == 'sec_sbi') {
        $_b_sql = mysqli_query($conn, "select sensorname from sec_sbi WHERE zone like '" . $_zone . "'");
        $_b_sql_result = mysqli_fetch_assoc($_b_sql);
        $sensorname = $_b_sql_result['sensorname'];
    } elseif ($_panel_make == 'securico_gx4816') {
        $_b_sql = mysqli_query($conn, "select sensorname from securico_gx4816 WHERE zone like '" . $_zone . "'");
        $_b_sql_result = mysqli_fetch_assoc($_b_sql);
        $sensorname = $_b_sql_result['sensorname'];
    } elseif ($_panel_make == 'smarti_hdfc32') {
        $_b_sql = mysqli_query($conn, "select SensorName from smarti_hdfc32 WHERE ZONE like '" . $_zone . "'");
        $_b_sql_result = mysqli_fetch_assoc($_b_sql);
        $sensorname = $_b_sql_result['SensorName'];
    } elseif ($_panel_make == 'SMART-IN') {
        $_b_sql = mysqli_query($conn, "select SensorName from smartinew WHERE ZONE like '" . $_zone . "'");
        $_b_sql_result = mysqli_fetch_assoc($_b_sql);
        $sensorname = $_b_sql_result['SensorName'];
    } elseif ($_panel_make == 'SMART -I') {
        $_b_sql = mysqli_query($conn, "select SensorName from smartinew WHERE ZONE like '" . $_zone . "'");
        $_b_sql_result = mysqli_fetch_assoc($_b_sql);
        $sensorname = $_b_sql_result['SensorName'];
    } elseif ($_panel_make == 'smarti_boi') {
        $_b_sql = mysqli_query($conn, "select SensorName from smarti_boi WHERE ZONE like '" . $_zone . "'");
        $_b_sql_result = mysqli_fetch_assoc($_b_sql);
        $sensorname = $_b_sql_result['SensorName'];
    } elseif ($_panel_make == 'smarti_pnb') {
        $_b_sql = mysqli_query($conn, "select SensorName from smarti_pnb WHERE ZONE like '" . $_zone . "'");
        $_b_sql_result = mysqli_fetch_assoc($_b_sql);
        $sensorname = $_b_sql_result['SensorName'];
    }


     if (strtolower(substr($row['alarm'], -1)) == 'r') {
        $alarm_msg = $sensorname . ' Restoral';
    } else {
        $alarm_msg = $sensorname;
    }


  $sheet->setCellValueByColumnAndRow($columnIndex++, $rowIndex, $srno);
    $sheet->setCellValueByColumnAndRow($columnIndex++, $rowIndex, $row['ATMID']);
    $sheet->setCellValueByColumnAndRow($columnIndex++, $rowIndex, $row['Client Name']);
    $sheet->setCellValueByColumnAndRow($columnIndex++, $rowIndex, $row['Incident Number']);
    $sheet->setCellValueByColumnAndRow($columnIndex++, $rowIndex, $row['Region']);
    $sheet->setCellValueByColumnAndRow($columnIndex++, $rowIndex, $row['ATMID']);
    $sheet->setCellValueByColumnAndRow($columnIndex++, $rowIndex, $row['Address']);
    $sheet->setCellValueByColumnAndRow($columnIndex++, $rowIndex, $row['City']);
    $sheet->setCellValueByColumnAndRow($columnIndex++, $rowIndex, $row['State']);
    $sheet->setCellValueByColumnAndRow($columnIndex++, $rowIndex, $sensorname);
    $sheet->setCellValueByColumnAndRow($columnIndex++, $rowIndex, $alarm_msg);
    $sheet->setCellValueByColumnAndRow($columnIndex++, $rowIndex, $row['Incident Date Time']);
    $sheet->setCellValueByColumnAndRow($columnIndex++, $rowIndex, $row['Alarm Received Date Time']);
    $sheet->setCellValueByColumnAndRow($columnIndex++, $rowIndex, $row['Close Date Time']);
    $sheet->setCellValueByColumnAndRow($columnIndex++, $rowIndex, $row['DVRIP']);
    $sheet->setCellValueByColumnAndRow($columnIndex++, $rowIndex, $_panel_make);
    $sheet->setCellValueByColumnAndRow($columnIndex++, $rowIndex, $row['panelid']);
    $sheet->setCellValueByColumnAndRow($columnIndex++, $rowIndex, $row['Bank']);
    $sheet->setCellValueByColumnAndRow($columnIndex++, $rowIndex, $row['Reactive']);
    $sheet->setCellValueByColumnAndRow($columnIndex++, $rowIndex, $row['Closed By']);
    $sheet->setCellValueByColumnAndRow($columnIndex++, $rowIndex, $row['Closed Date']);
    $sheet->setCellValueByColumnAndRow($columnIndex++, $rowIndex, $row['Remark']);
    $sheet->setCellValueByColumnAndRow($columnIndex++, $rowIndex, $row['zone']);
    $sheet->setCellValueByColumnAndRow($columnIndex++, $rowIndex, $row['alarm']);

    $rowIndex++;
    $srno++;
}



if (mysqli_num_rows($sql) == 0) {
    unset($_SESSION['currentBatch']);
}

$writer = new Xlsx($spreadsheet);

$tempFile = tempnam(sys_get_temp_dir(), 'Inventory');
$writer->save($tempFile);

header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
header('Content-Disposition: attachment;filename="ExportedRecords.xlsx"');
header('Cache-Control: max-age=0');
readfile($tempFile);

mysqli_close($con);

unlink($tempFile);

