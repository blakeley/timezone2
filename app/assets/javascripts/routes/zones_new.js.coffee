App.ZonesNewRoute = Ember.Route.extend

  model: -> @store.createRecord 'zone'
