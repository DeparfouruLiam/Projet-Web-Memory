function ajaxPost(postData,url) {
    // Créer un objet XMLHttpRequest
    var xhr = new XMLHttpRequest();

    // Ouvrir une connexion POST vers une URL spécifique
    xhr.open("POST", url, true);

    // Définir le type de contenu envoyé
    xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

    // Définir ce qui doit se passer lorsque la réponse est prête
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) { // Status 201 signifie "Créé"
            // Traiter la réponse JSON
            console.log(data); // Afficher les données de la réponse
        }
    };

    // Envoyer la requête avec les données en JSON
    xhr.send(JSON.stringify(postData));
    return xhr
}