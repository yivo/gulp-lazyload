module.exports = (plugins) ->
  if plugins is null or typeof plugins isnt 'object'
    throw new Error "Invalid plugin list passed.
      Plugin list should be key-value hash containing plugin and module names.
      You passed #{plugins}."

  for plugin, module of plugins
    if global[plugin]
      throw new Error("Property '#{plugin}' exists on global object. Change plugin name to different.")
    do (plugin, module) ->
      Object.defineProperty global, plugin,
        get: -> @['_' + plugin] ||= require(module)
  return