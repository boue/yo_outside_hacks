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

    var $btnYo = $('#yo');
    var $btnYoAll = $('#yo-all');
    var $player = $('#player');

    var toggleButton = function($btn) {
      $btn.find('img').toggle();
      $btn.find('span').toggle();
    }

    var preventFormSubmission = function(e) {
      e.preventDefault();
      sendYo('one');
    }

    var sendYo = function(type, e) {
      var btnText;
      var $btnNode;

      if (e) {
        $btnNode = $(e.target).closest('button');
        e.preventDefault();
      }
      else {
        $btnNode = $btnYo;
      }

      if (type === 'all') {
        btnText = 'YO ALL!';
        data = { type: type }
      }
      else {
        btnText = 'YO!';
        data = { type: type, username: $('#username').val() }
      }
      toggleButton($btnNode);

      $.ajax({
        url: '/yo_send',
        type: 'POST',
        data: data
      }).done(function(){
        $player.tubeplayer('play');
        setTimeout(function() {
          toggleButton($btnNode);
          $btnNode.find('span').text('SENT!')
        }, 200);
        setTimeout(function() { $btnNode.find('span').text(btnText) }, 1000)
      });
    }

    $player.tubeplayer({ initialVideo: "QGEh_24Ribo" })
    $btnYoAll.click(sendYo.bind(this, 'all'));
    $btnYo.click(sendYo.bind(this, 'one'));
    $('form').submit(preventFormSubmission);
  }
});