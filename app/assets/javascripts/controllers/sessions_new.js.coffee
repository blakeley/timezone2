App.SessionsNewController = Ember.Controller.extend
  
  actions:
    signIn: () ->
      @set("errorMessage", null)
      account = {user: {email: @get('email'), password: @get('password')}}
      Ember.$.post('/api/v1/sessions', account).then(
        (response) =>
          App.session.set('token', response['token'])
          @transitionToRoute 'zones'
      , (error) =>
          @set('errorMessage', error.responseJSON.message)
        )





