/* La siguiente función se utiliza para visualizar la imagen seleccionada en la
 * página html donde se desea "cargar" utilizando un llamado "ajax"*/
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#blah')
                    .attr('src', e.target.result)
                    .height(200);
        };
        reader.readAsDataURL(input.files[0]);
    }
}

/* La siguiente función se utiliza para activar la cantidad de elementos seleccionados
 * En el carrito de compras utilizando un llamado "ajax" */
function addCard(formulario) {
    var valor = formulario.elements["idProducto"].value; // Get the value of the hidden input field with name "idProducto"
    var url = '/carrito/agregar'; // The URL to which you want to send the form data

    $.ajax({
        url: url,
        type: 'POST',
        data: { idProducto: valor }, // Data to be sent to the server
        success: function(response) {
            // Handle the successful response from the server here
            // For example, update the content of a div with the id "resultsBlock"
            $("#resultsBlock").html(response);
        },
        error: function(xhr, status, error) {
            // Handle any errors that occur during the request
            console.error(xhr.responseText);
        }
    });
}


