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

function ajaxify_pagination(){
  $('.pagination a').live('ajax:success', function(evt, data, status, xhr) {
    $('.search_result_block').html(data);
  });
};

function context_categories() {
  var context_id = null;
  select = $('#project_context_id, #document_context_id')
  context_id = select.val();

  select.on('change', function(){
    context_id = $(this).val();
    $.ajax({
      url: '/manage/context/get_categories',
      data: {
        id: context_id,
        paper_type: select.closest('form').attr('class').replace(/formtastic /, '')
      }
    }).success(function(data, state, jqXHR){
      $('#project_categories_input, #document_categories_input').replaceWith($(jqXHR.responseText).find('#project_categories_input, #document_categories_input')[0]);
    })
  })
};

$(function(){
  add_datepicker();
  search_documents();
  ajaxify_pagination();
  context_categories();
});

