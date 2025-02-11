let difficult = 1;
const difficultSelect = document.getElementById('difficult-select');

let startTime;
let gameDuration = 0;
let interval;  //  timer

// Fonction pour mettre à jour le temps de jeu
function updateGameTime() {
    // Calcule le temps écoulé en secondes
    gameDuration = Math.floor((Date.now() - startTime) / 1000);

    // Affiche le temps
    document.getElementById('game-time').textContent = `Temps de jeu : ${gameDuration} secondes`;
}

const difficults = [
    { value: 1, label: 'Facile' },
    { value: 2, label: 'Moyen' },
    { value: 3, label: 'Difficile' }
];

// Ajouter les options au menu déroulant
difficults.forEach(t => {
    difficultSelect.innerHTML += `<option value="${t.value}">${t.label}</option>`;
});

// Mettre à jour la difficulté lorsque l'utilisateur change la sélection
difficultSelect.addEventListener('change', event => {
    difficult = parseInt(event.target.value);
});

let theme = 1;
const themeSelect = document.getElementById('theme-select');


// Définir les thèmes
const themes = [
    { value: 1, label: 'Jeux Vidéo' },
    { value: 2, label: 'Sport' },
    { value: 3, label: 'Fête' }
];

// Ajouter les options au menu déroulant
themes.forEach(t => {
    themeSelect.innerHTML += `<option value="${t.value}">${t.label}</option>`;
});

// Lorsque l'utilisateur sélectionne un thème
themeSelect.addEventListener('change', event => {
    theme = parseInt(event.target.value);
});


// Fonction de mélange Fisher-Yates
function shuffleArray(array) {
    for (let i = array.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [array[i], array[j]] = [array[j], array[i]];
    }
    return array;
}

// Variables de jeu
let flippedCards = [];
let isFlipping = false;
let pairsFound = 0;
let totalPairs = 0;

// create & screen memory
function generateMemoryGrid(size) {



    const memoryGrid = document.getElementById('memory-grid');
    memoryGrid.innerHTML = '';

    const numberOfCards = size * size;
    totalPairs = numberOfCards / 2;
    pairsFound = 0;
    isFlipping = false;

    const baseImages = [
        "1.png", "2.png", "3.png", "4.png", "5.png", "6.png", "7.png", "8.png",
        "9.png", "10.png", "11.png", "12.png", "13.png", "14.png", "15.png", "16.png",
        "17.png", "18.png", "19.png", "20.png", "21.png", "22.png", "23.png", "24.png",
        "25.png", "26.png", "27.png", "28.png", "29.png", "30.png", "31.png", "32.png",
        "33.png", "34.png", "35.png", "36.png", "37.png", "38.png", "39.png", "40.png",
        "41.png", "42.png", "43.png", "44.png", "45.png", "46.png", "47.png", "48.png",
        "49.png", "50.png"

    ];
    let imagesSubset = [];
    while (imagesSubset.length < totalPairs) {
        imagesSubset = imagesSubset.concat(baseImages);
    }
    imagesSubset = imagesSubset.slice(0, totalPairs);
    const shuffledImages = shuffleArray([...imagesSubset, ...imagesSubset]);

    memoryGrid.style.gridTemplateColumns = `repeat(${size}, 100px)`;

    shuffledImages.forEach(imageName => {
        const label = document.createElement('label');
        label.innerHTML = `
            <input type="checkbox" class="card-checkbox">
            <div class="card">
                <div class="card-front">
                    <img src="/../../assets/images/${theme}/${imageName}" alt="${imageName.split('_')[1]}" class="memory_card">
                </div>
                <div class="card-back">?</div>
            </div>
        `;

        const checkbox = label.querySelector('.card-checkbox');
        checkbox.addEventListener('change', () => handleCardFlip(label, imageName));

        memoryGrid.appendChild(label);
    });

    const winMessage = document.getElementById('win-message');
    winMessage.style.display = 'none';

}

// Fonction de gestion du retournement de carte
function handleCardFlip(label, imageName) {
    if (isFlipping) return;

    const checkbox = label.querySelector('.card-checkbox');
    flippedCards.push({ label, imageName });

    if (flippedCards.length === 2) {
        isFlipping = true;

        // Désactiver temporairement tous les checkboxes pour éviter des clics supplémentaires
        document.querySelectorAll('.card-checkbox').forEach(cb => cb.disabled = true);

        const [firstCard, secondCard] = flippedCards;

        if (firstCard.imageName === secondCard.imageName) {
            pairsFound++;
            flippedCards = [];
            isFlipping = false;

            // Désactiver les checkboxes des cartes appariées pour éviter qu'elles se retournent
            firstCard.label.querySelector('.card-checkbox').disabled = true;
            secondCard.label.querySelector('.card-checkbox').disabled = true;

            // Ajouter une classe CSS pour masquer les checkboxes des cartes appariées
            firstCard.label.querySelector('.card-checkbox').classList.add('matched');
            secondCard.label.querySelector('.card-checkbox').classList.add('matched');

            // Réactiver les checkboxes des autres cartes
            document.querySelectorAll('.card-checkbox:not(.matched)').forEach(cb => cb.disabled = false);

            // Vérifie si toutes les paires ont été trouvées
            if (pairsFound === totalPairs) {
                const http = new XMLHttpRequest();
                const url = '../../utils/sendscore.php';
                const params = 'timer=' + gameDuration + '&difficult=' + difficult;
                http.open('POST', url, true);
                http.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
                http.send(params);
                isFlipping = true;
                const winMessage = document.getElementById('win-message');
                winMessage.style.display = 'flex';
                clearInterval(interval);

                // Désactiver définitivement tous les checkboxes après la victoire
                document.querySelectorAll('.card-checkbox').forEach(cb => cb.disabled = true);
            }
        } else {
            // Si les cartes ne correspondent pas, les retourner après un délai
            setTimeout(() => {
                firstCard.label.querySelector('.card-checkbox').checked = false;
                secondCard.label.querySelector('.card-checkbox').checked = false;
                flippedCards = [];
                isFlipping = false;

                // Réactiver tous les checkboxes
                document.querySelectorAll('.card-checkbox:not(.matched)').forEach(cb => cb.disabled = false);
            }, 1000);
        }
    }
}


// Événement pour lancer le jeu avec le bouton "Lancer"
const boutonLancer = document.getElementById('button_start');
boutonLancer.addEventListener('click', () => {
    startTime = Date.now();
    interval = setInterval(updateGameTime, 1000);

    switch (difficult) {
        case 1:
            generateMemoryGrid(4);
            break;
        case 2:
            generateMemoryGrid(6);
            break;
        case 3:
            generateMemoryGrid(10);
            break;
        default:
            generateMemoryGrid(4);
            break;
    }
});