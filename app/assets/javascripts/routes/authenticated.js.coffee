App.AuthenticatedRoute = Ember.Route.extend
  beforeModel: (transition) ->
    unless App.session.get('token')
      @transitionTo('sessions.new')



Session = Ember.Object.extend
  token: localStorage.token,
  tokenChanged: Ember.observer 'token', () ->
    localStorage.token = @get('token')


App.session = Session.create()
