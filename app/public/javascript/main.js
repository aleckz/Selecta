
(function() {
    var cx = '016844719156761315131:vmev40tl4gq';
    var gcse = document.createElement('script');
    gcse.type = 'text/javascript';
    gcse.async = true;
    gcse.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') +
        '//cse.google.com/cse.js?cx=' + cx;
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(gcse, s);
})();



function handler(e){
    e.preventDefault();
    if (e.target.nodeName=='B') {
        var embedCode = e.target.parentNode.getAttribute('data-ctorig').split('=')[1];
        console.log(e.target.parentNode.getAttribute('data-ctorig').split('=')[1]);
        $.post('/link', {url: embedCode, user_id: '1'});
        location.reload();
    };
    if(e.target.className=="gs-title" || e.target.className=='gs-image') {
        e.preventDefault();
        // e.stopPropagation();

        var embedCode = e.target.getAttribute('data-ctorig').split('=')[1];
        $.post('/link', {url: embedCode});
        location.reload();
    }
};

document.addEventListener("click", handler, true);
