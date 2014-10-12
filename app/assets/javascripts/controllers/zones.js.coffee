App.ZonesController = Ember.ArrayController.extend
  sortProperties: ['minutesOffset']

  zones: ( ->
    if @get('search') then @get('searchedZones') else @
  ).property('search', 'searchedZones')

  searchedZones: ( ->
    search = @get('search').toLowerCase()
    @filter (zone) => zone.get('name').toLowerCase().indexOf(search) != -1
  ).property('search', '@each.name')
