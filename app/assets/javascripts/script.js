$(function(){

  //alert('hello');

  $('.js-delete').on('click', function(e){
        e.preventDefault();
        var btn = $(this)
        $.ajax({
          url: btn.attr('href'),
          method: 'DELETE'
        }).done(function(post){
            $('.js-delete').html(post);
        }).error(function(err){
          alert('something broke.');
      });

  });

});

