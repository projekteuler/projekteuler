# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

cm = null

loadCodeMirror = ->
  $('#translationNav li:first').addClass('active')
  $("textarea").each ->
    cm = CodeMirror.fromTextArea($(this).get(0), {
      lineNumbers: false,
      lineWrapping: true,
      mode: "text/html"
    })

$(document).on "turbolinks:load", loadCodeMirror


$(document).on "click", '#translationNav a[href="#preview"]', ->
  $('#preview .problem-content').html(cm.getValue())