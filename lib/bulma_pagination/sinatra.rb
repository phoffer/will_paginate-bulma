require "will_paginate/view_helpers/sinatra"
require "bulma_pagination/bulma_renderer"

module BulmaPagination
  # A custom renderer class for WillPaginate that produces markup suitable for use with Bulma CSS.
  class Sinatra < WillPaginate::Sinatra::LinkRenderer
    include BulmaRenderer
  end
end
