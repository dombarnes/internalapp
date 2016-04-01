I18n.backend = I18n::Backend::Chain.new(I18n.backend)
I18n::Backend::Chain.send(:include, I18n::Backend::Fallbacks)
I18n.fallbacks[:'en-GB'] << :en

require "i18n/backend/pluralization" 
I18n::Backend::Chain.send(:include, I18n::Backend::Pluralization)
