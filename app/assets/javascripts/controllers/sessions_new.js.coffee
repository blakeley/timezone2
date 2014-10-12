App.SessionsNewController = Ember.Controller.extend
  actions:
    signIn: () ->
      account = {user: {email: @get('email'), password: @get('password')}}
      console.log @get('email')
      Ember.$.post('/api/v1/sessions', account).then(
        (response) =>
          App.set('token', response['token'])
          @transitionToRoute 'zones'
      , (error) ->
          console.log 'fail'
        )





