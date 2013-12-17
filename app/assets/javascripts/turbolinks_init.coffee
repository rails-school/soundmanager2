# Namespacing.
window.Radio ||= {}

# Creates an Angular app
Radio.App = angular.module('YTapp', [])

# Init for angular when used with trubolinks
$(document).on 'page:load', ->
  angular.bootstrap($("html"), ['Radio'])
$ ->
  $(document).trigger "page:load"