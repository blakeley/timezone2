App.ZoneRoute = Ember.Route.extend

  model: (params) -> @store.find 'zone', params.id
