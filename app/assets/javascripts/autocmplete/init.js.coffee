@init_document_context_autocomplete = ->

  autocomplete_field = $('#document_context_title')
  context_field = $('#document_context_id')

  items = []
  $('option', context_field).each ->
    return unless $(this).val().length
    items.push({id: $(this).val(), value: $(this).text().trim(), label: $(this).text().trim()})
    return

  console.log items
  autocomplete_field.autocomplete
    minLength: 2
    source: items
    select: (event, ui) ->
      context_field.val(ui.item.id)
      return

  return

@init_project_context_autocomplete = ->

  autocomplete_field = $('#project_context_title')
  context_field = $('#project_context_id')

  items = []
  $('option', context_field).each ->
    return unless $(this).val().length
    items.push({id: $(this).val(), value: $(this).text().trim(), label: $(this).text().trim()})
    return

  console.log items
  autocomplete_field.autocomplete
    minLength: 2
    source: items
    select: (event, ui) ->
      context_field.val(ui.item.id)
      return

  return
