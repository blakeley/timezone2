App.SessionsDestroyRoute = Ember.Route.extend

  activate: () ->
    console.log "sessions destroy route"
    App.set("token", null)
    @transitionTo '/'
