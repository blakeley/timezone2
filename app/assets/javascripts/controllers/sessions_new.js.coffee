App.SessionsNewController = Ember.Controller.extend
  needs: ['sessions']

  actions:
    signIn: () ->
      credentials = {user: {email: @get('email'), password: @get('password')}}
      Ember.$.post('/api/v1/sessions', credentials).then(
        (response) =>
          App.set('token', response['token'])
          @transitionToRoute 'zones'
      , (error) ->
          console.log 'fail'
        )





