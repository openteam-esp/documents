// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery-ui
//= require jquery.ui.datepicker.ru.js
//= require jquery_ujs
//= require rails.validations
//= require_tree

function add_datepicker(){
  $('input.ui-date-picker').datepicker({
    yearRange: 'c-33:c+5',
    showOtherMonths: true,
    changeMonth: true,
    changeYear: true
  });
};

function search_documents(){
  $('.document_search, .project_search')
    .bind('ajax:success', function(evt, data, status, xhr){
      var search_form         = $(this);
      var search_result_block = search_form.siblings('.search_result_block');

      search_result_block.html(xhr.responseText);
    })
    .bind('ajax:error', function(evt, xhr, status, error){
    })
    .bind('ajax:complete', function(evt, xhr, status){
    });
};

function choose_file(){
  $('.choose_file').click(function(){
    var link = $(this);
    var origin_id = 'file_url';
    var input = $('#'+origin_id);

    var dialog = link.create_or_return_dialog('elfinder_picture_dialog');

    dialog.attr('id_data', origin_id);

    dialog.load_iframe();

    input.change(function(){
      var file_link = input.parent().parent().find('.file_link');

      if (file_link.length != 0 ){
        file_link.attr('src', input.val());
      }else{
        input.parent().after('<img src="'+input.val()+'" width="200px" />');
      };
      input.unbind('change');
    });

    return false;
  });
};

$(function(){
  add_datepicker();
  search_documents();
  choose_file();
});

