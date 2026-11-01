-- Rex key bindings. Docs: https://www.superlogical.com/rex/docs/customize/keyboard-shortcuts
-- After editing: rex config reload

-- Cmd+S toggles the sidebar instead of Cmd+/
rex.unbind("cmd+/", "client.sidebar.toggle")
rex.bind("cmd+s", "client.sidebar.toggle")
