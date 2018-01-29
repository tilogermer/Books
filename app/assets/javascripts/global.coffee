jQuery(document).on 'turbolinks:load', ->
  loans = $('#loans')
  count = loans.find('.count > span')

  recount = -> count.text loans.find('.nested-fields').size()

  loans.on 'cocoon:before-insert', (e, el_to_add) ->
    el_to_add.fadeIn(1000)

  loans.on 'cocoon:after-insert', (e, added_el) ->
    added_el.effect('highlight', {}, 500)
    recount()

  loans.on 'cocoon:before-remove', (e, el_to_remove) ->
    $(this).data('remove-timeout', 1000)
    el_to_remove.fadeOut(1000)

  loans.on 'cocoon:after-remove', (e, removed_el) ->
    recount()