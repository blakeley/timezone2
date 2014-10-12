App.SessionsNewController = Ember.Controller.extend
  actions:
    signIn: () ->
      account = {user: {email: @get('email'), password: @get('password')}}
      Ember.$.post('/api/v1/sessions', account).then(
        (response) =>
          App.session.set('token', response['token'])
          @transitionToRoute 'zones'
      , (error) ->
          console.log 'fail'
        )





