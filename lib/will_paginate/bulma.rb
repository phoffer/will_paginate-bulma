require 'will_paginate'

if defined?(ActionView)
  require "bulma_pagination/action_view"
end

if defined?(Sinatra)
  require "bulma_pagination/sinatra"
end

if defined?(Hanami::View)
  require "bulma_pagination/hanami"
end
