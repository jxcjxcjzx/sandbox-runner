Module = module.constructor

evalRun =  (script, context = {}) ->  
  compileAndRun = ->    
    eval(script)

  compileAndRun.call(context)

  context

moduleRun = (script, filename = '') ->
  mod = new Module()
  
  mod._compile(script, filename)

  mod.exports


module.exports = 
  run: evalRun
  runAsModule: moduleRun
