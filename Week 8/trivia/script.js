document.addEventListener('DOMContentLoaded', function() {
    let choices = document.querySelectorAll('.choice');
    let feedback1 = document.getElementById('feedback1');

    choices.forEach(function(button) {
        button.addEventListener('click', function() {
            if (button.classList.contains('correct')) {
                button.style.backgroundColor = 'green';
                feedback1.textContent = 'Correct!';
            } else {
                button.style.backgroundColor = 'red';
                feedback1.textContent = 'Incorrect';
            }
        });
    });
    let checkButton = document.getElementById('check');
    let freeResponse = document.getElementById('free-response');
    let feedback2 = document.getElementById('feedback2');

    checkButton.addEventListener('click', function() {
        if (freeResponse.value.toLowerCase() === '1945') {
            freeResponse.style.backgroundColor = 'green';
            feedback2.textContent = 'Correct!';
        } else {
            freeResponse.style.backgroundColor = 'red';
            feedback2.textContent = 'Incorrect';
        }
    });
});
