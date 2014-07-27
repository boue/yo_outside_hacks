$(function() {
  var ref = new Firebase("https://YO-OUTSIDE-HACKS.firebaseio.com/");
  var yosRef = ref.child("yos");

  // initial load
  yosRef.on("child_added", function (yo) {
    console.log(yo)
    var yo = yo.val();
    var $yoNode = $('<li>').text(yo.username);

    $('ul').prepend($yoNode);
    $yoNode.slideDown();
  });

  $("#yo-all").click(function() {
    $.ajax({
      url: '/yo_send',
      type: 'POST',
      data: { type: 'all' }
    });
  });

  // start animating the addition
  setTimeout(addAnimations, 2000);

  function addAnimations() {
    $('body').addClass('animate');
    $('li').addClass('dont-animate');
  }
});