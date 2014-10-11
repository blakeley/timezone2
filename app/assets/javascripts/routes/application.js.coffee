App.ApplicationRoute = Ember.Route.extend

  enter: () ->
    if App.ApplicationStore.authToken
      @transitionTo('zones')
    else
      @transitionTo('sessions.new')
