$(document).ready(function() {

  $('#burger').addClass('hidden');

  $('#chicken').removeClass('hidden');


});

$(function(){

  $(".tab").on("click", function(e){
    // Change active tab
    $(".tab").removeClass('active');
    $(this).addClass('active');
    // Hide all tab-content (use class="hidden")
    $(".category").addClass('hidden');
    // Show target tab-content (use class="hidden")
    $($(this).data('target')).removeClass('hidden');
  });

});
