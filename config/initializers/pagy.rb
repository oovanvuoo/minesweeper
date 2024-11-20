require 'pagy/extras/bootstrap'  # Use this if you are using Bootstrap
require "pagy/extras/array"
require "pagy/extras/overflow"
# Pagy::I18n.load(locale: 'vi', filepath: 'config/locales/pagy/vi.yml')
Pagy::DEFAULT[:items] = 20       # Default number of items per page
