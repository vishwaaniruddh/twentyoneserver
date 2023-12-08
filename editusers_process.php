<?php
include 'config.php';
$id=$_POST['id'];
//echo $id; 
$fn=$_POST['fn'];
$name=$_POST['name'];
$password=$_POST['password'];
$drop=$_POST['drop'];

$sql="update LoginUsers set name='$fn',uname='".$name."',pwd='$password',permission='$drop' where id='".$id."'";
$result=mysqli_query($conn,$sql);
if($result!="")
{
  echo "1";  
}
else
{
    echo "0";
}
?>

