# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery(($) ->
  $('body').delegate('button.update-changes_btn_show_full', 'click', (e) ->
    $(this).parent().parent().find('.update-changes-full').show()
    $(this).parent().hide()
  )

  $('body').delegate('button.update-changes_btn_show_summarized', 'click', (e) ->
    $(this).parent().parent().find('.update-changes').show()
    $(this).parent().hide()
  )
)
