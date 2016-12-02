<?php

// En versiones de PHP anteriores a la 4.1.0, debería utilizarse $_FILES en lugar
// de $_FILES.

$dir_subida = '/var/www/uploads/';
$fichero_subido = $dir_subida . basename($_FILES['fichero_usuario']['name']);

if (move_uploaded_file($_FILES['fichero_usuario']['tmp_name'], $fichero_subido)) {
    echo "El fichero es válido y se subió con éxito.\n";
} else {
    echo "¡Posible ataque de subida de ficheros!\n";
}

print_r($_FILES);



//tomo el valor de un elemento de tipo texto del formulario 
$cadenatexto = $_POST["cadenatexto"];
echo "Escribió en el campo de texto: " . $cadenatexto . "<br><br>";

//datos del arhivo 
$nombre_archivo = $_FILES['userfile']['name'];
$tipo_archivo = $_FILES['userfile']['type'];
$tamano_archivo = $_FILES['userfile']['size'];
//compruebo si las características del archivo son las que deseo 
if (!((strpos($tipo_archivo, "gif") || strpos($tipo_archivo, "jpeg")) && ($tamano_archivo < 1000000))) {
    echo "La extensión o el tamaño de los archivos no es correcta. <br><br><table><tr><td><li>Se permiten archivos .gif o .jpg<br><li>se permiten archivos de 100 Kb máximo.</td></tr></table>";
} else {
    if (move_uploaded_file($_FILES['userfile']['tmp_name'], $nombre_archivo)) {
        echo "El archivo ha sido cargado correctamente.";
    } else {
        echo "Ocurrió algún error al subir el fichero. No pudo guardarse.";
    }
} 