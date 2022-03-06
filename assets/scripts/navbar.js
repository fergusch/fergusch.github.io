document.getElementById('menu-button').onclick = function() {
    document.getElementById('navbar-mobile-overlay').style.display = 'block';
}
document.getElementById('menu-button').ontouchstart = function(e) {
    e.preventDefault();
    e.target.onclick();
}

document.getElementById('menu-close').onclick = function() {
    document.getElementById('navbar-mobile-overlay').style.display = 'none';
}
document.getElementById('menu-close').ontouchstart = function(e) {
    e.preventDefault();
    e.target.onclick();
}
