<?php session_start();

unset($_SESSION['login_user']);
unset($_SESSION['id']);
header("location: index.php");
?>