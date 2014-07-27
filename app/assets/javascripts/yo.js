$(function() {
  var ref = new Firebase("https://YO-OUTSIDE-HACKS.firebaseio.com/");
  var yosRef = ref.child("yos");

  // initial load
  yosRef.on("child_added", function (yo) {
    console.log(yo)
    var yo = yo.val();
    var $yoNode = $('<li>').text(yo.username);

    $('ul').prepend($yoNode);
  });

  // start animating the addition
  // setTimeout(addAnimations, 2000);

  // function() {
  //   $('body').addClass('animate');
  // }
});