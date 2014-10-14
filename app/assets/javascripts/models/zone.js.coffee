App.Zone = DS.Model.extend
  name: DS.attr('string')
  cityName: DS.attr('string')
  minutesOffset: DS.attr('number')

  currentTime: Ember.computed 'minutesOffset', ->
    moment.utc().add(@get('minutesOffset'), 'minutes').format('h:mm a')

  isOpen: Ember.computed 'isEditing', 'isNew', ->
    @get('isEditing') or @get('isNew')
