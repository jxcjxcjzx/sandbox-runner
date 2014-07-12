(function() {
  var Module, evalRun, moduleRun;

  Module = module.constructor;

  evalRun = function(script, context) {
    var compileAndRun;
    if (context == null) {
      context = {};
    }
    compileAndRun = function() {
      return eval(script);
    };
    compileAndRun.call(context);
    return context;
  };

  moduleRun = function(script, filename) {
    var mod;
    if (filename == null) {
      filename = '';
    }
    mod = new Module();
    mod._compile(script, filename);
    return mod.exports;
  };

  module.exports = {
    run: evalRun,
    runAsModule: moduleRun
  };

}).call(this);
