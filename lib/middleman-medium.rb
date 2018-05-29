require "middleman-core"

Middleman::Extensions.register :middleman-medium do
  require "my-extension/extension"
  MyExtension
end
