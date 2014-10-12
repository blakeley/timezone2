App.IndexRoute = Ember.Route.extend

  beforeModel: () ->
    if App.session.get('token')
      @transitionTo('zones')
    else
      @transitionTo('sessions.new')
