App.SessionsNewController = Ember.Controller.extend
  
  actions:
    signIn: () ->
      credentials = {user: {email: @get('email'), password: @get('password')}}
      Ember.$.post('/api/v1/sessions', credentials).then(
        (response) =>
          App.session.set('token', response['token'])
          @transitionToRoute 'zones'
      , (error) =>
          @set('errorMessage', error.responseJSON.message)
        )





