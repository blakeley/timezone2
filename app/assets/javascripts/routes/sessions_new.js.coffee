App.SessionsNewRoute = Ember.Route.extend

  setupController: (controller) ->
    controller.set("email", "user@mail.com")
    controller.set("password", "password")
