App.ZoneController = Ember.ObjectController.extend

  actions: 
    remove: ->
      @get('model').destroyRecord()

    create: ->
      @get('model').save()

