# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $("#create-detention, #add-detention-modal .modal-close").click ->
    $("#add-detention-modal").fadeToggle 100

  $("#add-to-pen, #add-to-pen-modal .modal-close").click ->
    $("#add-to-pen-modal").fadeToggle 100

  $("input[type=submit]").click (e) ->
    e.preventDefault()
    $(this).addClass "loading"

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
