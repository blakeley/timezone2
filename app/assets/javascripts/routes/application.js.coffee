App.ApplicationRoute = Ember.Route.extend

  setupController: (controller) ->
    console.log "Signed In?:" + @get("signedIn") 
    @controller.set("email", "")
    @controller.set("password", "")

  actions:
    signIn: () ->
      Ember.$.post('/api/v1/sessions', {user: {email: @controller.get('email'), password: @controller.get('password')}}).then(
        (response) =>
          console.log 'success'
          Ember.$.ajaxSetup
            headers: { 'email': @controller.get('email'), 'token': response['token'] }
          @controller.set("signedIn", true)
          @refresh()
          console.log "Signed In?:" + @get("signedIn") 
      , (error) ->
          console.log 'fail'
        )
