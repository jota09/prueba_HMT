<?php
date_default_timezone_set('America/Bogota');
require_once '../modelo/conexion.php';
$conec = new Conexion();

//datos del arhivo 
$nombre_archivo = $_FILES['userfile']['name'];
$tipo_archivo = $_FILES['userfile']['type'];
$tamano_archivo = $_FILES['userfile']['size'];

// En versiones de PHP anteriores a la 4.1.0, debería utilizarse $_FILES en lugar
// de $_FILES.
$extension = str_split($_FILES['userfile']['name']);
$dir_subida = 'C:\xampp\htdocs\jesus_ramos_21-11-2016_9am\upload\Upload_';
$fichero_subido = $dir_subida . basename($_FILES['userfile']['name']);
$extension = explode(".",$_FILES['userfile']['name']);
if ($extension['1'] != "exa") {
    die( "La extensión no es correcta. <br><br><table><tr><td><li>Se permiten archivos .exa</td></tr></table>");
} else {
    if (move_uploaded_file($_FILES['userfile']['tmp_name'], $fichero_subido)) {
    } else {
        die( "Ocurrió algún error al subir el fichero. No pudo guardarse.");
    }
}
$data = array();
$i = 0;
$file = fopen($fichero_subido, "r");
while (!feof($file)){
    $fila = explode("	",fgets($file));
    $fila[1]= str_replace('/', '-', $fila[1]);
    $fila[3]= str_replace('/', '-', $fila[3]);
    $data[$i++] = $fila;
}
fclose($file);

$conec->conectar();
$conec->ejecutarQueryInsert($data);
