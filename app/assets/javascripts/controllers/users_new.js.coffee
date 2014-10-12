App.UsersNewController = Ember.Controller.extend
  actions:
    register: () ->
      credentials = {user: {email: @get('email'), password: @get('password')}}
      Ember.$.post('/api/v1/users', credentials).then(
        (response) =>
          console.log response['token']
          App.set('token', response['token'])
          @transitionToRoute 'zones'
      , (error) ->
          console.log 'fail'
        )





