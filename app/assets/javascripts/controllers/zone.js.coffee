App.ZoneController = Ember.ObjectController.extend

  actions: 
    remove: ->
      @get('model').destroyRecord()

    save: ->
      window.mm = @get('model')
      @get('model').save().then(
        (response) =>
          @set('isEditing', false)
      , (response) =>
          @set('arror', response.errors)
      )

    edit: ->
      @set('isEditing', true)
