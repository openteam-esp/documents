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
//= require info_plugin
//= require rails.validations
//= require jquery.scrollto

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
    .bind('ajax:before', function() {
      $('body .main_wrapper .main .document_search .inputs .ajax_loading').addClass('loading');
      $('body .main_wrapper .main .project_search  .inputs .ajax_loading').addClass('loading');
    })
    .bind('ajax:success', function(evt, data, status, xhr) {
      var search_form         = $(this);
      var search_result_block = search_form.siblings('.search_result_block');
      search_result_block.html(xhr.responseText);
      if ($('.paper_list', search_result_block).length) {
        if ($.fn.scrollTo) {
          $.scrollTo(search_form, 1000, { margin: true });
        };
      };
    })
    .bind('ajax:error', function(evt, xhr, status, error) {
      var result = xhr.responseText.replace(/<head>(?:.|\s)*?<\/head>/g, '');
      $('<div id="ajax_error" />')
        .appendTo('body')
        .hide()
        .html(result);
      $('#ajax_error').dialog({
        title: error,
        width: '80%',
        height: '500',
        modal: true,
        resizable: false,
        close: function() {
          $(this).remove();
        }
      });
    })
    .bind('ajax:complete', function(evt, xhr, status){
      $('body .main_wrapper .main .document_search .inputs .ajax_loading').removeClass('loading');
      $('body .main_wrapper .main .project_search  .inputs .ajax_loading').removeClass('loading');
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
      var attached_file_wrapper = $('.attached_file');
      var file_url              = input.val();
      var file_name = decodeURIComponent(file_url).match(/([^\/.]+)(\.(.{3}))?$/);

      attached_file_wrapper
        .children('.wrapper')
        .html('<a href="'+file_url+'" class="'+file_name[3]+'"><span></span>'+file_name[1]+'</a> <a href="#" class="button icon remove danger delete_file">Удалить</a>');

      input.unbind('change');
    });

    return false;
  });
};

function delete_file(){
  $('.delete_file').live('click', function(){
    $('.attached_file .wrapper').html('<span>Файл не выбран</span>');
    $('#file_url').val('');

    return false;
  });
};

$(function(){
  add_datepicker();
  search_documents();
  choose_file();
  delete_file();

  $('.pagination a').live('ajax:success', function(evt, data, status, xhr) {
    $('.search_result_block').html(data);
  });
});

