document.getElementById('dateJour').innerText = new Date().toLocaleDateString();

function ajouterLigne() {
    var nouveauNoeud = document.getElementById("modeleLigne").cloneNode(true);
    
    var inputs = nouveauNoeud.getElementsByTagName('input');
    for(var i=0; i<inputs.length; i++) {
        if (!inputs[i].readOnly) {
           if(inputs[i].type == "number") inputs[i].value = 0;
           else inputs[i].value = "";
        } else {
            inputs[i].value = "0.00";
        }
    }
    
    nouveauNoeud.id = ""; 

    var pere = document.getElementById("corpsTableau");
    var reference = document.getElementById("lastLigne");
    
    pere.insertBefore(nouveauNoeud, reference);
}

function remplir() {
    const tabDesc = new Array("Portable Dell", "Ecran 24 pouces", "RAM 8Go", "Clé USB 32Go", "Souris sans fil", "Clavier mécanique", "Disque Dur SSD");
    
    var listeDesc = document.getElementsByClassName("desc");
    var listeQte = document.getElementsByClassName("qte");
    var listePrix = document.getElementsByClassName("prix");

    for (var i = 0; i < listeDesc.length; i++) {
        var randomDescIndex = Math.floor(Math.random() * tabDesc.length);
        listeDesc[i].value = tabDesc[randomDescIndex];

        listeQte[i].value = Math.floor(10 * Math.random() + 1);

        listePrix[i].value = Math.floor(100 * Math.random() + 1);
    }
    
    calculate();
}

function calculate() {
    var listePrix = document.getElementsByClassName("prix");
    var listeQte = document.getElementsByClassName("qte");
    var listeTotalLigne = document.getElementsByClassName("totalLigne");
    
    var sousTotal = 0;

    for (var i = 0; i < listePrix.length; i++) {
        var qte = parseFloat(listeQte[i].value) || 0;
        var prix = parseFloat(listePrix[i].value) || 0;
        
        var totalLigne = qte * prix;
        
        listeTotalLigne[i].value = totalLigne.toFixed(2);
        
        sousTotal += totalLigne;
    }

    document.getElementById("sousTotal").value = sousTotal.toFixed(2);

    var remisePercent = parseFloat(document.getElementById("remise").value) || 0;
    var tauxImpot = parseFloat(document.getElementById("tauxImpot").value) || 0;
    var fraisExp = parseFloat(document.getElementById("fraisExp").value) || 0;

    var montantRemise = sousTotal * (remisePercent / 100);
    var sousTotalRemise = sousTotal - montantRemise;
    
    var montantTaxe = sousTotal * (tauxImpot / 100);

    var solde = sousTotalRemise + montantTaxe + fraisExp;

    document.getElementById("sousTotalRemise").value = sousTotalRemise.toFixed(2);
    document.getElementById("taxeTotale").value = montantTaxe.toFixed(2);
    document.getElementById("soldeFinal").value = solde.toFixed(2) + " €";
}