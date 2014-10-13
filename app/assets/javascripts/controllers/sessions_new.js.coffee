App.SessionsNewController = Ember.Controller.extend
  
  actions:
    signIn: () ->
      @set("errorMessage", null)
      credentials = {user: {email: @get('email'), password: @get('password')}}
      Ember.$.post('/api/v1/sessions', credentials).then(
        (response) =>
          App.session.set('token', response['token'])
          @set('email', '')
          @set('password', '')
          @transitionToRoute 'zones'
      , (error) =>
          @set('errorMessage', error.responseJSON.message)
        )





