App.UsersNewController = Ember.Controller.extend
  email: '',
  password: '',
  actions:
    register: () ->
      @set("errorMessage", null)
      account = {user: {email: @get('email'), password: @get('password')}}
      console.log account
      Ember.$.post('/api/v1/users', account).then(
        (response) =>
          App.session.set('token', response['token'])
          @set('email', '')
          @set('password', '')
          @transitionToRoute 'zones'
      , (error) =>
          window.ee = error
          @set('errorMessage', error.responseJSON.errors[0])
        )





