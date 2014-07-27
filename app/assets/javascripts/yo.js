$(function() {

  var $body = $('body');

  if ( $body.hasClass('welcome') ) {
    var ref = new Firebase("https://YO-OUTSIDE-HACKS.firebaseio.com/");
    var yosRef = ref.child("yos");
    var addAnimations = function() {
      $body.addClass('animate');
      $('li').addClass('dont-animate');
    }

    // initial load
    yosRef.on("child_added", function (yo) {
      var yo = yo.val();
      var $yoNode = $('<li>').text(yo.username);

      $('ul').prepend($yoNode);
      $yoNode.slideDown();
    });

    // start animating the addition
    setTimeout(addAnimations, 2000);
  }
  else if ( $body.hasClass('admins') ) {
    var $btnText = $('span');
    var toggleButton = function() {
      $('img').toggle();
      $('span').toggle();
    }

    $("#yo-all").click(function() {
      toggleButton();
      $.ajax({
        url: '/yo_send',
        type: 'POST',
        data: { type: 'all' }
      }).done(function(){
        toggleButton();
        $btnText.text('SENT!')
        setTimeout(function() { $btnText.text('YO ALL!') }, 1000)
      });
    });
  }
});