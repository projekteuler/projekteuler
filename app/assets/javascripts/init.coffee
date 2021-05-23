window.App ||= {}

cm = null

loadCodeMirror = ->
  $('#translationNav li:first').addClass('active')
  $("textarea").each ->
    cm = CodeMirror.fromTextArea($(this).get(0), {
      lineNumbers: false,
      lineWrapping: true,
      mode: "text/html"
    })

App.init = ->
  MathJax.Hub.Queue(["Typeset",MathJax.Hub]);
  loadCodeMirror();

$(document).on "turbolinks:load", ->
  App.init()

$(document).on "click", '#translationTab button[data-bs-target="#preview"]', ->
  $('#preview .problem-content').html(cm.getValue())
  MathJax.Hub.Queue(["Typeset",MathJax.Hub]);