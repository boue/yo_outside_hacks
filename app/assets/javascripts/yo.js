$(function() {
  var ref = new Firebase("https://YO-OUTSIDE-HACKS.firebaseio.com/");
  var yosRef = ref.child("yos");
  var $btnText = $('span');

  // initial load
  yosRef.on("child_added", function (yo) {
    var yo = yo.val();
    var $yoNode = $('<li>').text(yo.username);

    $('ul').prepend($yoNode);
    $yoNode.slideDown();
  });

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

  // start animating the addition
  setTimeout(addAnimations, 2000);

  function addAnimations() {
    $('body').addClass('animate');
    $('li').addClass('dont-animate');
  }

  function toggleButton() {
    $('img').toggle();
    $btnText.toggle();
  }
});