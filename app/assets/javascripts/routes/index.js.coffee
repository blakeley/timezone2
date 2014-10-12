App.IndexRoute = Ember.Route.extend

  beforeModel: () ->
    console.log "this is dumb"
    if App.get("token")
      @transitionTo('zones')
    else
      @transitionTo('sessions.new')
