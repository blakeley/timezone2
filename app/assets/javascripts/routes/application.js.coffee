App.ApplicationRoute = Ember.Route.extend

  enter: () ->
    unless App.ApplicationStore.authToken
      @transitionTo('sessions.new')

  setupController: (controller) ->
    @controller.set("signedIn", true)
    console.log "Signed In?: " + @controller.get("signedIn") 
