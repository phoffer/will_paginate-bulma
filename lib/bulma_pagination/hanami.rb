require "will_paginate/view_helpers/hanami"
require "bulma_pagination/bulma_renderer"

module BulmaPagination
  # A custom renderer class for WillPaginate that produces markup suitable for use with Bulma CSS.
  class Hanami < WillPaginate::Hanami::LinkRenderer
    include BulmaRenderer
  end
end
