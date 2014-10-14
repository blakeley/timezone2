App.ZoneController = Ember.ObjectController.extend

  actions: 
    remove: ->
      @get('model').destroyRecord()

    save: ->
      @get('model').save().then =>
        @set('isEditing', false)

    edit: ->
      @set('isEditing', true)
