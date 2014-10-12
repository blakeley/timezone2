App.SessionsNewRoute = Ember.Route.extend

  setupController: (controller) ->
    console.log "sessions new route"
    controller.set("email", "user@mail.com")
    controller.set("password", "password")
