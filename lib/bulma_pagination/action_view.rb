require "will_paginate/view_helpers/action_view"
require "bulma_pagination/bulma_renderer"

module BulmaPagination
  # A custom renderer class for WillPaginate that produces markup suitable for use with Zurb Foundation.
  class Rails < WillPaginate::ActionView::LinkRenderer
    include BulmaRenderer
  end
end
