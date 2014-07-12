require('./spec_helper')

describe 'sandbox', ->
  
  describe 'run', ->
    it 'should run', ->
      snippet = """
      this.result = 'hello world';
      """

      context = Sandbox.run snippet

      expect(context).to.be.ok
      context.result.should.equal 'hello world'

    it 'should use provided context', ->
      snippet = """
      function hello(name) { return "Hello " + name + '!'; }
      this.result = hello(this.name);
      """

      context = 
        name: 'timnew'
        result: ''

      returnedContext = Sandbox.run snippet, context

      expect(returnedContext).to.equal context
      context.result.should.equal 'Hello timnew!'

    it 'should yield exception', ->
      snippet = """
        throw new Error("test");
      """    

      expect ->
        Sandbox.run snippet
      .to.throw(Error, 'test')

    it 'should isolate local variables', ->
      snippet = """
        this.result = variable;
      """

      variable = 'test'

      expect ->
        Sandbox.run snippet
      .to.throw ReferenceError, 'variable is not defined'
      
  describe 'runAsModule', ->
    it 'should run', ->
      snippet = """
      module.exports.result = 'hello world'
      """

      context = Sandbox.runAsModule snippet
      context.should.has.keys 'result'
      context.result.should.equal 'hello world'