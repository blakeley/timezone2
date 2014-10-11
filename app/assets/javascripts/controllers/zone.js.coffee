App.ZoneController = Ember.ObjectController.extend

  actions: 
    remove: ->
      zone = @get('model')
      zone.deleteRecord()
      zone.save()

