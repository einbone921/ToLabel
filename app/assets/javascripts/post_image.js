document.addEventListener("turbolinks:load"
,function(){
  $('#post_image_post_image').change(function() {
    var fr = new FileReader();
    fr.onload = function() {
      $(".attachment").attr('src', fr.result);
    };
    fr.readAsDataURL(this.files[0]);
  });
});
