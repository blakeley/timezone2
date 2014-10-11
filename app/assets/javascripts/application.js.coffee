#= require jquery
#= require jquery_ujs
#= require handlebars
#= require ember
#= require ember-data
#= require_self
#= require app
#= require moment

# for more details see: http://emberjs.com/guides/application/
window.App = Ember.Application.create()
  #LOG_TRANSITIONS: true
  #LOG_TRANSITIONS_INTERNAL: true
  #LOG_VIEW_LOOKUPS: true

DS.RESTAdapter.reopen
  namespace: 'api/v1'

