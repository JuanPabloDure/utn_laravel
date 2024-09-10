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
        } else {
            console.log('El botón exacto no está presente o no es el único.');
        }

    } else {
        console.log("El elemento con la clase 'login-box' NO está presente.");
    }
});

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





