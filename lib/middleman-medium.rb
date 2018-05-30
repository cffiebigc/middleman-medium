require "middleman-core"

Middleman::Extensions.register :middleman_medium do
  require "middleman-medium/extension"
  MediumExtension
end
