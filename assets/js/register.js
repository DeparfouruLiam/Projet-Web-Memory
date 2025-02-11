// Sélectionner le champ d'entrée
const inputField = document.getElementById('password');
const progressBar = document.getElementById('progress-bar');

// detect champ
const specialCharPattern = /[!@#$%^&*(),.?":{}|<>]/;
const uppercasePattern = /[A-Z]/;
const numberPattern = /[0-9]/;

// event
inputField.addEventListener('input', function() {
    const length = inputField.value.length;
    const containsSpecialChar = specialCharPattern.test(inputField.value);
    const containsUppercase = uppercasePattern.test(inputField.value);
    const containsNumber = numberPattern.test(inputField.value);


    if (length === 0) {
        progressBar.value = 0;
        progressBar.classList.remove('low');
        progressBar.classList.remove('medium');
        progressBar.classList.remove('high');
    }
    if (length <= 8 && length > 0) {
        progressBar.classList.remove('medium');
        progressBar.classList.remove('high');
        progressBar.classList.add('low');
        progressBar.value = 30;
        console.log('Mot de passe faible')


    }
    else {inputField.classList.remove('low');}

    if (length > 8) {
        if (!containsSpecialChar && containsUppercase && containsNumber) {
            progressBar.value = 60;
            progressBar.classList.add('medium');
            console.log('Mot de passe moyen')

        }
        else {progressBar.classList.remove('medium');}
        if (containsSpecialChar && containsUppercase && containsNumber) {
            progressBar.value = 100;
            progressBar.classList.add('high');
            console.log('Mot de passe fort')
        }
        else {
            progressBar.classList.remove('high');
            progressBar.classList.add('medium');
        }
    }






});
