GoSnippetsView = require './go-snippets-view'
{CompositeDisposable} = require 'atom'

module.exports = GoSnippets =
  goSnippetsView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @goSnippetsView = new GoSnippetsView(state.goSnippetsViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @goSnippetsView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'go-snippets:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @goSnippetsView.destroy()

  serialize: ->
    goSnippetsViewState: @goSnippetsView.serialize()

  toggle: ->
    console.log 'GoSnippets was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
