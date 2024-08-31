document.addEventListener('DOMContentLoaded', (event) => {
    const animateTextElements = document.querySelectorAll('.animate-text');

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.animationPlayState = 'running';
                observer.unobserve(entry.target);
            }
        });
    }, { threshold: 0.1 });

    animateTextElements.forEach(element => {
        observer.observe(element);
    });

    const cards = document.querySelectorAll('.card');
    cards.forEach(card => {
        card.addEventListener('mousemove', (e) => {
            const rect = card.getBoundingClientRect();
            const x = e.clientX - rect.left;
            const y = e.clientY - rect.top;

            card.style.setProperty('--mouse-x', `${x}px`);
            card.style.setProperty('--mouse-y', `${y}px`);
        });
    });
});

document.addEventListener('DOMContentLoaded', (event) => {
    const footerYear = document.querySelector('#footer-year');
    if (footerYear) {
        footerYear.textContent = new Date().getFullYear();
    }
});
