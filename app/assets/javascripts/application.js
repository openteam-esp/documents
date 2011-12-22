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

$(function(){
  add_datepicker();
  search_documents();
});
