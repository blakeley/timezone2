App.SessionsDestroyRoute = Ember.Route.extend

  beforeModel: () ->
    App.session.set("token", null)
    @store.unloadAll("zone")
    @transitionTo '/'
