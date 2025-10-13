function afficherExercice(numero) {
    zone = document.getElementById("zoneExercice");
    menu = document.getElementById("menu");
  
    
    menu.style.display = "none";
    zone.classList.remove("cacher");
  
    
    if (numero === 1) {
      zone.innerHTML = `
        <h2>Exercice 1 : Calcul de moyenne</h2>
        <p>Entrez vos trois notes sur 20 :</p>
        <input id="note1" type="number" placeholder="Note 1">
        <input id="note2" type="number" placeholder="Note 2">
        <input id="note3" type="number" placeholder="Note 3">
        <br><br>
        <button onclick="calculerMoyenne()">Calculer la moyenne</button>
        <p id="resultat"></p>
        <button class="retour" onclick="retourMenu()">Retour au menu</button>
      `;
    } 
    else if (numero === 2) {
      zone.innerHTML = `
        <h2>Exercice 2 : Test de température</h2>
        <p>Entrez une température (°C) :</p>
        <input id="temperature" type="number" placeholder="Température">
        <br><br>
        <button onclick="testerTemperature()">Tester</button>
        <p id="resultat"></p>
        <button class="retour" onclick="retourMenu()">Retour au menu</button>
      `;
    } 
    else if (numero === 3) {
      zone.innerHTML = `
        <h2>Exercice 3 : Comparaison de deux nombres</h2>
        <p>Entrez deux nombres :</p>
        <input id="nombre1" type="number" placeholder="Nombre 1">
        <input id="nombre2" type="number" placeholder="Nombre 2">
        <br><br>
        <button onclick="comparerDeuxNombres()">Comparer</button>
        <p id="resultat"></p>
        <button class="retour" onclick="retourMenu()">Retour au menu</button>
      `;
    }
  }
  
  
  function retourMenu() {
    document.getElementById("zoneExercice").classList.add("cacher");
    document.getElementById("menu").style.display = "flex";
    document.getElementById("zoneExercice").innerHTML = "";
  }
  
  
  function calculerMoyenne() {
    note1 = document.getElementById("note1").value * 1;
    note2 = document.getElementById("note2").value * 1;
    note3 = document.getElementById("note3").value * 1;
    moyenne = (note1 + note2 + note3) / 3;
  
    message = "Moyenne : " + moyenne.toFixed(2) + " - ";
  
    if (moyenne < 10) {
      message += "Redoublant";
    } else if (moyenne < 12) {
      message += "Admis – Passable";
    } else if (moyenne < 14) {
      message += "Admis – Bien";
    } else {
      message += "Admis – Très bien";
    }
  
    document.getElementById("resultat").innerText = message;
  }
  
  
  function testerTemperature() {
    temp = document.getElementById("temperature").value * 1;
    message = "";
  
    if (temp < 10) {
      message = "Froid";
    } else if (temp <= 25) {
      message = "Normal";
    } else {
      message = "Chaud";
    }
  
    document.getElementById("resultat").innerText = "Résultat : " + message;
  }
  
  
  function comparerDeuxNombres() {
    nb1 = document.getElementById("nombre1").value * 1;
    nb2 = document.getElementById("nombre2").value * 1;
    message = "";
  
    if (nb1 > nb2) {
      message = nb1 + " est plus grand que " + nb2;
    } else if (nb1 < nb2) {
      message = nb2 + " est plus grand que " + nb1;
    } else {
      message = "Les deux nombres sont égaux.";
    }
  
    document.getElementById("resultat").innerText = message;
  }
  