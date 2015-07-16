
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
        var embedCode = e.target.getAttribute('data-ctorig').split('=')[1];
        $.post('/link', {url: embedCode, user_id: '1'});
        location.reload();
    } else if (e.target.nodeName=='B') {
        e.preventDefault();
        var embedCode = e.target.parentNode.getAttribute('data-ctorig').split('=')[1];
        $.post('/link', {url: embedCode, user_id: '1'});
        location.reload();
    }
}

document.addEventListener("click", handler, true);

$('.wrap').on('mouseover', function() {
  $(this).find('img').attr('src', 'img/vinyl2.png');
});

$('.wrap').on('mouseout', function() {
  $(this).find('img').attr('src', 'img/vinyl1.png');
});


$('#sign_up_button').click( function () {
    var email     = $('#signup_email').val();
    var username  = $('#signup_username').val();
    var password  = $('#signup_password').val();
    var passwConf = $('#signup_passw_conf').val();

    $.post('/user', {
        username:              username,
        email:                 email,
        password:              password,
        password_confirmation: passwConf
    }, function(data) {
        if (data.userCreated) {
            window.location.href= '/';
        } else {
            $('.error_display').append('<p>Error</p>');
        }
    });
});


$('#log_in_button').click( function () {
    var username = $('#username').val();
    var password = $('#password').val();

    $.post('/session', {
        username:              username,
        password:              password,
    }, function(data) {
        if (data.userRetrieved) {
            window.location.href= '/';
        } else {
            $('.error_display_log_in').append('<p>Error</p>');
        }
    });
});


$('.vinyl').click( function (e) {
    e.preventDefault();
    console.log(e.target.id);
    $.post("/like", { link_id: e.target.id }, function(data) {
    })
    location.reload();
});









