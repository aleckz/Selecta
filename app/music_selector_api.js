var componentForm = {
  link_url: 'link_url'
};

function initialize() {
  var cx = '016844719156761315131:vmev40tl4gq';
  var gcse = document.createElement('script');
  gcse.type = 'text/javascript';
  gcse.async = true;
  gcse.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') +
      '//cse.google.com/cse.js?cx=' + cx;
  var s = document.getElementsByTagName('script')[0];
  s.parentNode.insertBefore(gcse, s);

  document.addEventListener("click",handler,true);

  function handler(e){
     if(e.target.className=="gs-title" || e.target.className=='gs-image') {
     e.stopPropagation();
     e.preventDefault();
     link = e.target.getAttribute('href').split('=')[1];
     getLink();
   }
  }

  function getLink() {
    var url_id = link;
    for (var component in componentForm) {
      document.getElementById(component).value = '';
      document.getElementById(component).disabled = false;
    }

    var val = componentForm.link_url = url_id;
    document.getElementById('link_url').value = val;
  }
}
