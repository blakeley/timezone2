# For more information see: http://emberjs.com/guides/routing/

App.Router.map () ->

  @resource 'sessions', ->#, path: '', ->
    @route 'new'#, path: 'login'
    @route 'destroy'#, path: 'logout'
  @resource 'zones', ->
    @route 'edit', path: '/:id'
  @resource 'users', ->
    @route 'new'

