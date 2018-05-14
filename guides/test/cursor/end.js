seleniumFollowerImg.setAttribute('id', 'selenium_mouse_follower');
seleniumFollowerImg.setAttribute('style', 'position: absolute; z-index: 99999999999; pointer-events: none;');

// Add mouse follower to the web page.
document.body.appendChild(seleniumFollowerImg);

document.onmousemove = function(e) {
    const mousePointer = document.getElementById('selenium_mouse_follower');
    mousePointer.style.left = e.pageX + 'px';
    mousePointer.style.top = e.pageY + 'px';
}
