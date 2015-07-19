$(document).ready(function(){

  $('form').on('click','.remove_fields',function(event){
    event.preventDefault();
    console.log('am i working?');
    $(this).prev('input[type=hidden]').val('1');
    $(this).closest('div').hide();
  });

  $('form').on('click','.add_fields',function(event){
    event.preventDefault();
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
  });
});