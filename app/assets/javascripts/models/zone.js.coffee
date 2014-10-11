App.Zone = DS.Model.extend
  name: DS.attr('string')
  cityName: DS.attr('string')
  minutesOffset: DS.attr('number')

  currentTime: ( ->
      return moment.utc().add(-420, 'minutes').format('h:mm a')
    ).property('minutesOffset')