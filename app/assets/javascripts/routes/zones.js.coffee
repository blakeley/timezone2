App.ZonesRoute = App.AuthenticatedRoute.extend

  model: -> @store.find 'zone'
