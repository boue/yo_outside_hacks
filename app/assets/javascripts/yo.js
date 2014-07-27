$(function() {

  var $body = $('body');

  if ( $body.hasClass('welcome') ) {
    var ref = new Firebase("https://YO-OUTSIDE-HACKS.firebaseio.com/");
    var yosRef = ref.child("yos");
    var counter = 0;
    var $counterNode = $('#counter span');
    var addAnimations = function() {
      $body.addClass('animate');
      $('li').addClass('dont-animate');
    }

    $('#yo-container').addClass('rotate');

    // initial load
    yosRef.on("child_added", function (yo) {
      var yo = yo.val();
      var $yoNode = $('<li>').text(yo.username);

      $counterNode.text(++counter);
      $('ul').prepend($yoNode);
      $yoNode.slideDown();
    });

    // start animating the addition
    setTimeout(addAnimations, 2000);
  }
  else if ( $body.hasClass('admins') ) {
    var toggleButton = function() {
      $('img').toggle();
      $('span').toggle();
    }

    var sendYo = function(type, e) {
      var btnText;
      var $btnTextNode = $(e.target).closest('button');

      if (type === 'all') {
        btnText = 'YO ALL!';
      }
      else {
        btnText = 'YO!';
      }
      toggleButton();
      $.ajax({
        url: '/yo_send',
        type: 'POST',
        data: { type: type }
      }).done(function(){
        toggleButton();
        $btnTextNode.text('SENT!')
        setTimeout(function() { $btnTextNode.text(btnText) }, 1000)
      });
    }

    $("#yo-all").click(sendYo.bind(this, 'all'));
    $("#yo").click(sendYo.bind(this, 'one'));
  }
});