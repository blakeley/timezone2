App.ZonesEditController = Ember.Controller.extend

  actions:

    editZone: ->
      @get('model').save().then =>
        @transitionToRoute 'zones'

