const navBoutons = document.getElementById('boutons'),
      ouverture = document.getElementById('nav-toggle'),
      fermeture = document.getElementById('nav-close')


if(ouverture) {
    ouverture.addEventListener('click', () =>{
        navBoutons.classList.add('show-boutons')
    })
}

if(fermeture) {
    fermeture.addEventListener('click', () =>{
        navBoutons.classList.remove('show-boutons')
    })
}