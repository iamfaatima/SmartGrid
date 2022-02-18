const rate_star = () => {
    let elements = document.querySelectorAll('.rating');
    if ( elements.length < 1) return;
    elements.forEach(element => {
        new Starry(element, {
            readOnly: true,
            beginWith: element.dataset.rating
        });    
    });
    
}

window.addEventListener('load', () => {
    rate_star();
})