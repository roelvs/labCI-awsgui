; (function () {
    'use strict';
    //ASAP
    var editMode = false;

    var theme = "System";
    var body = document.getElementsByTagName('BODY')[0];


    window.addEventListener('load', function () {
        if (window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches)
            setNightmode(true)
        else
            setNightmode(false)
    });

    function setNightmode(status) {
        if (status) {
            if (!body.classList.contains('dark_theme'))
                body.classList.add('dark_theme');
        } else {
            if (body.classList.contains('dark_theme'))
                body.classList.remove('dark_theme');
        }
    }
})();