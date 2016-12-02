<?php

class Conexion {

    protected $respuesta = array();

    function conectar() {
        $link = mysql_connect('localhost', 'usr_admin_bd_2', 'usr_admin_bd_2');
        if (!$link) {
            $respuesta = array('respuesta' => 'No se pudo conectar: ' . mysql_error());
        }

        mysql_select_db('examen_ingreso_2');
// 'Connected successfully';
    }

    function ejecutarQueryInsert($registros) {

        for ($i = 0; $i < sizeof($registros); $i++) {
            for ($j = 0; $j < sizeof($registros[$i]);) {
                // Validar que el registro es del 2016
                $tabla = explode('-', $registros[$i][3]);
                if ($tabla[0] !== '2016') {
//                    die($tabla[0]);
                    break;
                }
                // Valida de que el proceso exista
                $query = "SELECT * FROM procesos WHERE Cod_Proceso='" . $registros[$i][0] . "';";
                $result = mysql_query($query);
                while ($line = mysql_fetch_array($result, MYSQL_ASSOC)) {
                    $respuesta1 = $line;
                }
//                                die(print_r($respuesta1));
                if (!$result) {
                    $respuesta = array('respuesta' => 'Consulta fallida: ' . mysql_error());
                }
                // Valida de que el estado de dicho resgistro se encuentre almacenado
                $query0 = "SELECT * FROM estados WHERE Estado='" . $registros[$i][4] . "';";
                $result0 = mysql_query($query0);
                while ($line = mysql_fetch_array($result0, MYSQL_ASSOC)) {
                    $respuesta0 = $line;
                }
                if (empty($respuesta0)) {
                    break;
                }

                if (!empty($respuesta1)) {
                    $query1 = "UPDATE procesos SET Fecha_Ini='" . $registros[$i][1] . "' WHERE Cod_Proceso='" . $registros[$i][0] . "';";
                    $tabla = explode('-', $registros[$i][3]);
                    $query = "SELECT * FROM reporte_" . $tabla[1] . "_" . $tabla[0] . " WHERE No_cuenta='" . $registros[$i][2] . "';";
                    $result = mysql_query($query);
                    while ($line = mysql_fetch_array($result, MYSQL_ASSOC)) {
                        $respuesta2 = $line;
                    }
//                    die(print_r($respuesta2));
                    if (!$result) {
                        $respuesta = array('respuesta' => 'Consulta fallida: ' . mysql_error());
                    }
                    // Valida si se encuentra la cuenta para actualizar o insertar segun sea el caso
                    if (!empty($respuesta2)) {
                        $query2 = "UPDATE reporte_" . $tabla[1] . "_" . $tabla[0] . "  SET Fecha_Ini='" . $registros[$i][3] . "',Estado='" . $registros[$i][4] . "' WHERE No_cuenta='" . $registros[$i][2] . "'";
                    } else {
                        $query2 = "INSERT INTO reporte_" . $tabla[1] . "_" . $tabla[0] . " (No_cuenta,Fecha_Reporte,Estado)
                VALUES ('" . $registros[$i][2] . "','" . $registros[$i][3] . "','" . $registros[$i][4] . "');";
//                        die($query2);
                    }
                    break;
                } else {
                    break;
                }
            }
            // Ejecuta ambas Query! de actualizacion de proceso y de insert o update de cuentas
//                die($query2);
            if (!empty($query1) && !empty($query2)) {
                $result1 = mysql_query($query1);
                $result2 = mysql_query($query2);
            }
            if (!$result1 && !$result2) {
                $respuesta = array('respuesta' => 'Consulta fallida: ' . mysql_error());
            } else {
                $respuesta = array('respuesta' => $result);
            }
        }
        header("Location:http://localhost/jesus_ramos_21-11-2016_9am/vista/index.html");
    }

    function ejecutarQuerySelect($id) {
        $mes = 0;
        for ($i = 12; $i > 0; $i--) {
            $mes = $i;
            if($mes<10){
                $mes = '0'.$mes;
            }
            $queryCuenta = "SELECT * FROM reporte_" . $mes . "_2016 WHERE No_Cuenta='" . $id . "' ORDER BY reporte_" . $mes . "_2016.Fecha_Reporte DESC LIMIT 0, 1;";
//            die($queryCuenta);
            $resultCuenta = mysql_query($queryCuenta);
            while ($lineCuenta = mysql_fetch_array($resultCuenta, MYSQL_ASSOC)) {
                $respuestaCuenta = $lineCuenta;
            }
            if (!empty($respuestaCuenta)) {
                die(json_encode($respuestaCuenta));
            }
        }        
        die('1');
    }
    function ejecutarQuerySelectEstado() {
        
            $queryEstado = "SELECT DISTINCT(Estado) FROM `estados` ";
//            die($queryEstado);
            $resultEstado = mysql_query($queryEstado);
            $respuestaEstado = array() ;
            $i=0;
            while ($lineEstado = mysql_fetch_array($resultEstado, MYSQL_ASSOC)) {
                $respuestaEstado[$i++] = $lineEstado['Estado'];
            }
//            die(print_r($respuestaEstado));
            if (!$result) {
                $respuesta1 = array('respuesta' => 'Consulta fallida: ' . mysql_error());
            }
            if (!empty($respuestaEstado)) {
                die(json_encode($respuestaEstado));
            }
            die('1');

    }

    function ejecutarQueryUpdate() {
        $fecha = explode('-', $_GET['fecha_reporte']);
        $query = "UPDATE reporte_" . $fecha[1] . "_" . $fecha[0] . " SET Estado='" . $_GET['estado'] . "' WHERE No_Cuenta='" . $_GET['numero_cuenta'] . "';";
//        die(print_r($query));
        $result = mysql_query($query);
        die(json_encode($respuesta));
    }

    function ejecutarQueryDelete($id) {
        $query = "DELETE FROM contacto WHERE id='" . $id . "';";

        $result = mysql_query($query);
        if (!$result) {
            $respuesta = array('respuesta' => 'Consulta fallida: ' . mysql_error());
        } else {
            $respuesta = array('respuesta' => $result);
        }
        die(json_encode($respuesta));
    }

}
