App.AuthenticatedRoute = Ember.Route.extend
  beforeModel: (transition) ->
    unless App.session.get('token')
      @transitionTo('sessions.new')

  events:
    error: (reason, transition) ->
      if reason.status == 401
        @transitionTo('sessions.new')
      else
        alert('Something went wrong')


Session = Ember.Object.extend
  token: localStorage.token,
  tokenChanged: Ember.observer 'token', () ->
    if @get('token')
      localStorage.token = @get('token')
    else
      localStorage.removeItem('token')


App.session = Session.create()
