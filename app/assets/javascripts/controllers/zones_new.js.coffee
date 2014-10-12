App.ZonesNewController = Ember.Controller.extend

  actions:

    createZone: ->
      @get('model').save().then =>
        @transitionToRoute 'zones'

