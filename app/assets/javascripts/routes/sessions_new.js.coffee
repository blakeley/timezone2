App.SessionsNewRoute = Ember.Route.extend

  setupController: (controller) ->
    console.log "new session"
    @controller.set("email", "user@mail.com")
    @controller.set("password", "password")

  actions:
    signIn: () ->
      Ember.$.post('/api/v1/sessions', {user: {email: @controller.get('email'), password: @controller.get('password')}}).then(
        (response) =>
          console.log 'token: ' + response['token']
          Ember.$.ajaxSetup
            headers: { 'AUTHORIZATION': response['token'] }
          App.ApplicationStore.authToken = response['token']
          @transitionTo 'zones'
      , (error) ->
          console.log 'fail'
        )
