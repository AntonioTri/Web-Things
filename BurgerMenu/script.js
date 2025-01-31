// Selezioniamo gli elementi del menu
const burgerMenu = document.getElementById('burger-menu');
const sideMenu = document.getElementById('side-menu');

// Aggiungiamo un evento di clic per togglare il menu
burgerMenu.addEventListener('click', () => {
    // Toggle per aggiungere o rimuovere la classe active
    sideMenu.classList.toggle('active');

    // Animazione per l'icona hamburger (opzionale)
    burgerMenu.classList.toggle('open');
});


