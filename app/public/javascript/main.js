
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
    if(e.target.className=="gs-title" || e.target.className=='gs-image') {
        e.preventDefault();
        // e.stopPropagation();

        var embedCode = e.target.getAttribute('data-ctorig').split('=')[1];
        $.post('/link', {url: embedCode, user_id: '1'});
    }
};

document.addEventListener("click", handler, true);


$('.wrap').on('mouseover', function() {
  $(this).find('img').attr('src', 'img/vinyl2.png');
});

$('.wrap').on('mouseout', function() {
  $(this).find('img').attr('src', 'img/vinyl1.png');
});


$('#sign_up_button').click( function () {
    var email = $('#email').val();
    var username = $('#username').val();
    var password = $('#password').val();
    var passwConf = $('#passw_conf').val();

    $.post('/user', {
        username:              username,
        email:                 email,
        password:              password,
        password_confirmation: passwConf
    }, function(data) {
        if (data.userCreated) {
            window.location.href= '/';
        } else {
            $('#error').html('Error fuck it!!!');
        }
    })
});







