App.ZoneController = Ember.ObjectController.extend

  isEditing: false

  isOpen: Ember.computed 'isEditing', 'isNew', ->
    @get('isEditing') or @get('isNew')

  actions: 
    remove: ->
      @get('model').destroyRecord()

    save: ->
      @get('model').save().then =>
        @set('isEditing', false)

    edit: ->
      @set('isEditing', true)
