App.AuthenticatedRoute = Ember.Route.extend
  beforeModel: (transition) ->
    unless App.get("token")
      @transitionTo('sessions.new')