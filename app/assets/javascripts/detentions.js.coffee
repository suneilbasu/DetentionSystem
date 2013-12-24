# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $("#create-detention, #add-detention-modal .modal-close").click ->
    $("#add-detention-modal").fadeToggle 100

  $("#add-to-pen, #add-to-pen-modal .modal-close").click ->
    $("#add-to-pen-modal").fadeToggle 100

  $(".detention ul").sortable
    connectWith: ".detention ul"
    handle: ".move"
    cursorAt:
      right: 15
      top: 25
    placeholder: "sortable-placeholder"
    tolerance: "intersect"
    opacity: 0.95
    axis: "y"

  $("#sidebar ul").sortable
    connectWith: ".detention ul"
    placeholder: "sortable-placeholder"
    cursorAt:
      left: 28
      top: 28
    handle: ".move"

  $("#new_detention").on("ajax:beforeSend", ->
    $(this).find("input[type=submit]").addClass "loading"
  ).on("ajax:success", (e, data, status, xhr) ->
    $("#add-detention-modal").fadeToggle 100
    id = "#" + $("#detention_date_1i").val() + $("#detention_date_2i").val() +
        $("#detention_date_3i").val() + $("#detention_time").val()
    $(id).append(xhr.responseText).fadeIn 1000
  ).on("ajax:error", (e, xhr, status, error) ->
    $("#error_explanation").remove()
    $(this).parent().prepend('<div id="error_explanation"></div>')
    $("#error_explanation")
        .text "The detention could not be saved. Check the errors."
    $.each(xhr.responseJSON, (key,val) ->
      $("#detention_" + key).addClass "error"
    )
  ).on("ajax:complete", ->
    $(this).find("input[type=submit]").removeClass "loading"
  )