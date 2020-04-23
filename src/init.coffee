# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"
# atom.workspaceView.command 'editor:insert-def-snippet', ->
  # snippetBody = 'def ${1:fname}(${2:arg}):\n\t${3:pass}'
  # atom.packages.activePackages.snippets?.mainModule?.insert snippetBody

atom.commands.add 'atom-text-editor', 'editor:insert-snippet-python-def': ->
  snippetBody = "def ${1:fname}(${2:arg}):\n\t${3:pass}"
  atom.packages.activePackages.snippets?.mainModule?.insert snippetBody

atom.commands.add 'atom-text-editor', 'editor:insert-snippet-scrapy-meta': ->
  snippetBody = "from ..spiders.basic_base_spider_with_meta import MetaBaseSpider\n\nclass ${1:className}(MetaBaseSpider):\n\t\"\"\" website : ${2:websiteName} (${3:url}) \"\"\"\n\tname = '${4:name}'\n\tallowed_domains = ['${5:domain}']\n\n\tstart_data = (\n\t\t{'url': '${6:urlToVisit}', 'data': {'${7:transaction_type}': '${8:for_sale}'}},\n\t)"
  atom.packages.activePackages.snippets?.mainModule?.insert snippetBody

atom.commands.add 'atom-text-editor', 'editor:insert-snippet-scrapy-response-css': ->
  snippetBody = "response.css('${1:selector}').extract()"
  atom.packages.activePackages.snippets?.mainModule?.insert snippetBody

atom.commands.add 'atom-text-editor', 'editor:insert-snippet-scrapy-item-add-css': ->
  snippetBody = "item.add_css('${1:fieldName}', '${2:selector}')"
  atom.packages.activePackages.snippets?.mainModule?.insert snippetBody

atom.commands.add 'atom-text-editor', 'editor:insert-snippet-scrapy-item-add-xpath': ->
  snippetBody = "item.add_xpath('${1:fieldName}', '${2:selector}')"
  atom.packages.activePackages.snippets?.mainModule?.insert snippetBody

atom.commands.add 'atom-text-editor', 'editor:insert-snippet-scrapy-item-add-value': ->
  snippetBody = "item.add_value('${1:fieldName}', '${2:selector}')"
  atom.packages.activePackages.snippets?.mainModule?.insert snippetBody

atom.commands.add 'atom-text-editor', 'editor:insert-snippet-scrapy-colour-log': ->
  snippetBody = "def colour_log(log):\n\tdebug_string = f'\x1b[31m\n=>\x1b[36m\n{log}\x1b[0m'\n\tlogging.debug(debug_string)\n\treturn debug_string\n"
  atom.packages.activePackages.snippets?.mainModule?.insert snippetBody
