document.addEventListener("DOMContentLoaded", function(e){
    e.preventDefault();

    document.getElementById("chat-form").addEventListener("submit", function(event){
        // empeche la page de se recharger
        event.preventDefault();
        //récupère les entrées du formulaire
        data = new FormData(this);

        xml = new XMLHttpRequest();
        xml.open("POST", "index.php", true);
        xml.send(data);

    })


});

document.addEventListener("DOMContentLoaded", function (e) {

    e.preventDefault();
    const chatForm = document.querySelector("#chat-form");
    const messageBox = document.querySelector(".chat_body .all_messages");
    const messageInput = chatForm.querySelector("input[name='Message']");
    messageInput.scrollIntoView() ;

// Fonction pour charger les messages
    function loadMessages() {
        const xhr = new XMLHttpRequest();
        xhr.open("POST", "../../utils/getmessages.php", true);
        xhr.onload = function () {
            if (xhr.status === 200) {
                messageBox.innerHTML = xhr.responseText;
            }
        };
        xhr.send();
    }


    document.getElementById("chat-form").addEventListener("submit", function(event){
        // Créer un objet XMLHttpRequest
        var xhr = new XMLHttpRequest();
        const formData = new FormData(chatForm);
        event.preventDefault();

        // Ouvrir une connexion POST vers une URL spécifique
        xhr.open("POST", "../../utils/getmessages.php", true);

        // Définir ce qui doit se passer lorsque la réponse est prête
        xhr.onload = function () {
            if (xhr.readyState === 4 && xhr.status === 200) { // Status 200 signifie "Créé"
                // Récupérer le message envoyé
                let postData = {
                    message: messageInput.value
                };
                if (messageInput.value.length <= 3){
                    alert("Message inférieur à 3 caractères")
                }
                else {
                    ajaxPost(postData, "../../utils/sendmessages.php");
                }
                messageInput.value = "";
                loadMessages()// Afficher les données de la réponse
            }
        };

        // Envoyer la requête avec les données en JSON
        xhr.send(formData);
    })

    loadMessages()
})