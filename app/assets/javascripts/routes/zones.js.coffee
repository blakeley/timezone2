App.ZonesRoute = Ember.Route.extend

  model: -> @store.find 'zone'
