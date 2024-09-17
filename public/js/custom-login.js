document.addEventListener("DOMContentLoaded", function() {
    // Verifica si existe un elemento con la clase "login-box"
    var loginBox = document.querySelector('.login-box');
    
    if (loginBox) {
        let submitButton = document.querySelector('button.btn.btn-block.btn-flat.btn-primary');
        
        console.log("El elemento con la clase 'login-box' está presente.");
        // Aquí puedes agregar cualquier lógica que desees si el div existe
        if (isExactButtonPresent()) {
            console.log('El botón exacto está presente y es el único.');
            addDomainCheckbox();
            agregarListenerDominio();
            setupSubmitButton();
            ocultarDivFooter();
        } else {
            console.log('El botón exacto no está presente o no es el único.');
        }

    } else {
        console.log("El elemento con la clase 'login-box' NO está presente.");
    }
});

function agregarListenerDominio() {

        let useDomainCheckbox = document.getElementById('use_domain');
    
        if (useDomainCheckbox) {
            // Agrega un listener para el evento 'change'
            useDomainCheckbox.addEventListener('change', function() {
                // Verifica si el checkbox está marcado o no
                let isChecked = useDomainCheckbox.checked;
                if (isChecked) {
                    ocultarDivFooter();
                } else {
                    mostrarDivFooter();
                }
                console.log('Estado del checkbox "Usar Dominio UTN FRRO":', isChecked);
            });
        } else {
            console.log('No se encontró el checkbox "use_domain".');
        }


}


function UseLdapUtn() {
    console.log('Ejecutando UseLdapUtn...');
    // Aquí va el código de la función UseLdapUtn
    enviarLogin();
}

async function enviarLogin() {
    // Datos que vamos a enviar en el POST, obteniendo los campos por name
    const datos = {
       user: document.querySelector('input[name="email"]').value,
       password: document.querySelector('input[name="password"]').value,
    };

    try {
       // Obtener el token CSRF de la meta etiqueta
       const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

       // Hacemos la solicitud POST usando fetch
       const respuesta = await fetch("/ldap-login", {
          method: 'POST', // Tipo de solicitud
          headers: {
             'Content-Type': 'application/json', // Los datos se envían como JSON
             'X-CSRF-TOKEN': csrfToken // Agregar el token CSRF dinámicamente
          },
          body: JSON.stringify(datos) // Convertir los datos en formato JSON
       });

       // Verificamos si la respuesta es exitosa
       const data = await respuesta.json(); // Procesamos la respuesta en formato JSON
       if (respuesta.ok) {
          console.log('Login correcto:', data);
          // Puedes redirigir o realizar alguna acción en caso de éxito
          window.location.href = data.url;
       } else {
          //const data = await respuesta.json(); // Procesamos la respuesta en formato JSON
          //console.error('Error en la solicitud:' + respuesta.message + respuesta.error , respuesta.status);
          alert('Error al iniciar sesión.' + respuesta.message + respuesta.error , respuesta.status );
       }
    } catch (error) {
       console.error('Error de red:' + respuesta.message + respuesta.error , respuesta.status, error);
    }
 }

function isExactButtonPresent() {
    // Selecciona todos los botones en el documento
    let buttons = document.querySelectorAll('button');

    if (buttons.length !== 1) {
        return false; // No es el único botón en el documento
    }
    
    // Recorre todos los botones para encontrar el que coincide exactamente
    for (let button of buttons) {
        // Verifica el tipo de botón
        let isCorrectType = button.getAttribute('type') === 'submit';
        
        // Verifica las clases del botón
        let hasCorrectClasses = button.classList.contains('btn') &&
                                button.classList.contains('btn-block') &&
                                button.classList.contains('btn-flat') &&
                                button.classList.contains('btn-primary');
        
        // Verifica el contenido del botón
        let icon = button.querySelector('.fas.fa-sign-in-alt');
        let hasCorrectIcon = icon !== null;
        let hasCorrectText = button.textContent.trim() === 'Acceder';
        
        // Verifica si todas las condiciones coinciden
        if (isCorrectType && hasCorrectClasses && hasCorrectIcon && hasCorrectText) {
            // Verifica si el botón es el único en el documento
            let buttonsInDocument = document.querySelectorAll('button');
            if (buttonsInDocument.length === 1) {
                return button; // El botón específico y único fue encontrado
            }
        }
    }
    
    return false; // No se encontró el botón específico y único
}

function addDomainCheckbox() {
    // Selecciona el contenedor de la fila que contiene el checkbox "Recordarme"
    let row = document.querySelector('.row');

    if (row) {
        // Crea un nuevo div para el nuevo checkbox
        let newCheckboxDiv = document.createElement('div');
        newCheckboxDiv.className = 'col-12'; // Ajusta el tamaño si es necesario

        // Crea un div contenedor para aplicar el estilo similar al checkbox "Recordarme"
        let newCheckboxContainer = document.createElement('div');
        newCheckboxContainer.className = 'icheck-primary'; // Aplica la misma clase de estilo

        // Crea el nuevo input checkbox
        let newCheckboxInput = document.createElement('input');
        newCheckboxInput.type = 'checkbox';
        newCheckboxInput.name = 'use_domain';
        newCheckboxInput.id = 'use_domain';
        newCheckboxInput.checked = true; // Marca el checkbox por defecto

        // Crea la etiqueta para el nuevo checkbox
        let newCheckboxLabel = document.createElement('label');
        newCheckboxLabel.htmlFor = 'use_domain';
        newCheckboxLabel.textContent = 'Usar Dominio UTN FRRO';

        // Añade el input y la etiqueta al contenedor
        newCheckboxContainer.appendChild(newCheckboxInput);
        newCheckboxContainer.appendChild(newCheckboxLabel);

        // Añade el contenedor al div principal
        newCheckboxDiv.appendChild(newCheckboxContainer);

        // Inserta el nuevo div después del checkbox "Recordarme"
        row.insertBefore(newCheckboxDiv, row.lastElementChild);
    } else {
        console.log('No se encontró el contenedor de la fila.');
    }
}

function setupSubmitButton() {
    // Función a ejecutar cuando el botón es clickeado

    // Función para manejar el click en el botón
    function handleButtonClick(event) {
        // Selecciona el input checkbox por su ID
        let useDomainCheckbox = document.getElementById('use_domain');
        
        if (useDomainCheckbox) {
            if (useDomainCheckbox.checked) {
                // Si use_domain es true, ejecuta UseLdapUtn y previene el envío del formulario
                event.preventDefault();
                UseLdapUtn();
            } else {
                // Si use_domain es false, el formulario se envía normalmente
                // No se hace nada adicional, el formulario se enviará automáticamente
            }
        } else {
            console.log('No se encontró el checkbox "use_domain".');
        }
    }

    // Selecciona el botón por su tipo y clase
    let submitButton = document.querySelector('button[type="submit"]');

    if (submitButton) {
        // Agrega el listener para el evento 'click'
        submitButton.addEventListener('click', handleButtonClick);
    } else {
        console.log('No se encontró el botón de envío.');
    }
}

// Función para ocultar la div .card-footer
function ocultarDivFooter() {
    let cardFooter = document.querySelector('.card-footer');
    if (cardFooter) {
      cardFooter.style.display = 'none'; // Oculta la div
    } else {
      console.log('No se encontró la div con clase "card-footer".');
    }
  }
  
  // Función para mostrar la div .card-footer
  function mostrarDivFooter() {
    let cardFooter = document.querySelector('.card-footer');
    if (cardFooter) {
      cardFooter.style.display = 'block'; // Muestra la div
    } else {
      console.log('No se encontró la div con clase "card-footer".');
    }
  }






