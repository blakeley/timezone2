# For more information see: http://emberjs.com/guides/routing/

App.Router.map () ->
  @resource 'sessions', path: '', ->
    @route 'new', path: 'sign-in'
  @resource 'zones', ->
    @route 'new'

  # @resource('posts')

