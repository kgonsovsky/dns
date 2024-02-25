
document.addEventListener('DOMContentLoaded', function() {
    // Create the panel element
    const panel = document.createElement('div');
    panel.className = 'panel';
    panel.innerText = 'Hello, world';
    document.body.appendChild(panel);

    // Apply CSS styles to the panel
    panel.style.position = 'fixed';
    panel.style.top = (document.querySelectorAll('.panel').length - 1) * 100 + 'px';
    panel.style.left = '0';
    panel.style.width = '100%';
    panel.style.height = '100px';
    panel.style.backgroundColor = 'green';
    panel.style.color = 'white';
    panel.style.textAlign = 'center';
    panel.style.lineHeight = '100px';
    panel.style.zIndex = '1000';

    // Move the content down to make space for the panel
    document.body.style.marginTop = document.querySelectorAll('.panel').length * 100 + 'px';


});



    // Create the panel element
    const panel = document.createElement('div');
    panel.className = 'panel';
    panel.innerText = 'Hello, world';
    document.body.appendChild(panel);

    // Apply CSS styles to the panel
    panel.style.position = 'fixed';
    panel.style.top = (document.querySelectorAll('.panel').length - 1) * 100 + 'px';
    panel.style.left = '0';
    panel.style.width = '100%';
    panel.style.height = '100px';
    panel.style.backgroundColor = 'green';
    panel.style.color = 'white';
    panel.style.textAlign = 'center';
    panel.style.lineHeight = '100px';
    panel.style.zIndex = '1000';

    // Move the content down to make space for the panel
    document.body.style.marginTop = document.querySelectorAll('.panel').length * 100 + 'px';

