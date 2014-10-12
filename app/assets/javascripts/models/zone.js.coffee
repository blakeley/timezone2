App.Zone = DS.Model.extend
  name: DS.attr('string')
  cityName: DS.attr('string')
  minutesOffset: DS.attr('number')

  currentTime: ( ->
      return moment.utc().add(@get('minutesOffset'), 'minutes').format('h:mm a')
    ).property('minutesOffset')

