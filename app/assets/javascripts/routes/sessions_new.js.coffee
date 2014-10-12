App.SessionsNewRoute = Ember.Route.extend

  setupController: (controller) ->
    console.log "sessions route"
    controller.set("email", "user@mail.com")
    controller.set("password", "password")
