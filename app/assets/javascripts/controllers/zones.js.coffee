App.ZonesController = Ember.ArrayController.extend
  zones: Ember.computed 'search', 'searchedZones', ->
    if @get('search') then @get('searchedZones') else @

  searchedZones: Ember.computed 'search', ->
    search = @get('search').toLowerCase()
    @filter (zone) => zone.get('isOpen') or zone.get('name').toLowerCase().indexOf(search) != -1

  actions:
    newZone: () ->
      @store.createRecord 'zone'

    createZone: ->
      console.log 'creating'
      @get('model').save().then =>
        @transitionToRoute 'zones'

