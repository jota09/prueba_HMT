<?php
date_default_timezone_set('America/Bogota');
require_once '../modelo/conexion.php';
$conec = new Conexion();
$conec->conectar();
//die(print_r($_GET));
$conec->ejecutarQueryUpdate();
