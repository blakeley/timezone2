App.SessionsDestroyRoute = Ember.Route.extend

  beforeModel: () ->
    App.set("token", null)
    @store.unloadAll("zone")
    @transitionTo '/'
