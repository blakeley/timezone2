App.ZonesNewRoute = Ember.Route.extend

  model: -> @store.createRecord 'zone', {minutesOffset: 0}

  actions: 
    willTransition: (transition) ->
      newZone = @controller.get('model')
      if newZone.get('isNew')
        newZone.deleteRecord()
