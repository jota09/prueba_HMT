window.onload = function () {

};
$(document).ready(function () {

});
function buscar_cuenta() {
    location.href = 'busqueda.html';
}
function desbloquear() {
    $('#actualizar').removeAttr('disabled');
}
function cargar_index() {
    location.href = 'index.html';
}

function consultar_codigo() {
    var bandera = $('#form_consulta').validationEngine('validate');

    if (bandera) {
        var formData = $("#form_consulta").serialize();
        $.ajax({
            url: '../accion/consultarCodigo.php',
            type: "GET",
            dataType: "json",
            data: formData,
            beforeSend: function () {
                $('#boton_formulario').attr('disabled', 'disabled');
                $('#codigo').attr('readonly', 'readonly');

            }
        }).done(function (result) {
            $('#boton_formulario').removeAttr('disabled');
            $('#codigo').removeAttr('readonly');
            if (result != 1) {
                $.ajax({
                    url: '../accion/CargarEstados.php',
                    type: "GET",
                    dataType: "json"

                }).done(function (result2) {
                    $('#formulario_buscar').remove();
                    var tabla_cuenta = '';

                    tabla_cuenta += '<div class="form-group">' +
                            '<label class="col-sm-3 text-left">Numero de cuenta:</label><input class="form-control validate[required]" type="text" name="numero_cuenta" id="numero_cuenta" readonly="readonly" value="' + result.No_Cuenta + '"></div>' +
                            '<label class="col-sm-3 text-left">Fecha de Resgistro:</label><input class="form-control validate[required]" type="text" name="fecha_reporte" id="fecha_reporte" readonly="readonly" value="' + result.Fecha_Reporte + '"></div>';
                    tabla_cuenta += '<label class="col-sm-3 text-left">Estado:</label><div class=""><select class="form-control validate[required]" id="estado" name="estado" onchange="desbloquear();">';

                    $.each(result2, function (k, v) {
                        tabla_cuenta += '<option value="' + v + '"';
                        if (v === result.Estado) {
                            tabla_cuenta += 'selected';
                        }
                        tabla_cuenta += '>' + v + '</option>';
                    });
                    tabla_cuenta += '</select></div><div class="col-lg-3 col-lg-offset-3"><button id="actualizar" class="btn boton_formulario" data-cuenta="' + result.No_Cuenta + '" data-fecha="' + result.Fecha_Reporte + '" class="btn" onclick="traerData(this);" style="margin-top: 30px;" type="button" disable>ACTUALIZAR</button></div>' +
                            '<div class="col-lg-3 col-lg-offset-1"><button class="btn boton_formulario" class="btn" onclick="buscar_cuenta();" style="margin-top: 30px;" type="button">CONSULTAR DE NUEVO</button></div>';

                    $("#form_listar").html(tabla_cuenta);
                    $('#actualizar').attr('disabled', 'disabled');

                });
            }
            else {
                bootbox.alert("Verifique que la Cuenta sea valida");
            }
        });
    }
}
function traerData(obj) {
    console.log(obj);
    var formData = $("#form_listar").serialize();
    $.ajax({
        url: '../accion/ActualizarEstado.php',
        type: "GET",
        dataType: "json",
        data: formData
    }).done(function (result) {
        var cuenta = 'cuenta=' + $(obj).attr('data-cuenta');
        $.ajax({
            url: '../accion/traerData.php',
            type: "GET",
            dataType: "json",
            data: cuenta,
        }).done(function (result) {
            $.ajax({
                url: '../accion/CargarEstados.php',
                type: "GET",
                dataType: "json"

            }).done(function (result2) {
                $('#formulario_buscar').remove();
                var tabla_cuenta = '';
                                   tabla_cuenta += '<div class="form-group">' +
                            '<label class="col-sm-3 text-left">Numero de cuenta:</label><input class="form-control validate[required]" type="text" name="numero_cuenta" id="numero_cuenta" readonly="readonly" value="' + result.No_Cuenta + '"></div>' +
                            '<label class="col-sm-3 text-left">Fecha de Resgistro:</label><input class="form-control validate[required]" type="text" name="fecha_reporte" id="fecha_reporte" readonly="readonly" value="' + result.Fecha_Reporte + '"></div>';
                    tabla_cuenta += '<label class="col-sm-3 text-left">Estado:</label><div class=""><select class="form-control validate[required]" id="estado" name="estado" onchange="desbloquear();">';

                    $.each(result2, function (k, v) {
                        tabla_cuenta += '<option value="' + v + '"';
                        if (v === result.Estado) {
                            tabla_cuenta += 'selected';
                        }
                        tabla_cuenta += '>' + v + '</option>';
                    });
                    tabla_cuenta += '</select></div><div class="col-lg-3 col-lg-offset-3"><button id="actualizar" class="btn boton_formulario" data-cuenta="' + result.No_Cuenta + '" data-fecha="' + result.Fecha_Reporte + '" class="btn" onclick="traerData(this);" style="margin-top: 30px;" type="button" disable>ACTUALIZAR</button></div>' +
                            '<div class="col-lg-3 col-lg-offset-1"><button class="btn boton_formulario" class="btn" onclick="buscar_cuenta();" style="margin-top: 30px;" type="button">CONSULTAR DE NUEVO</button></div>';

                    $("#form_listar").html(tabla_cuenta);
                    $('#actualizar').attr('disabled', 'disabled');
            });
        });
    });
}

