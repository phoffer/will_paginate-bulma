require "bulma_pagination/version"

module BulmaPagination
  # Contains functionality shared by all renderer classes.
  module BulmaRenderer

    def to_html
      pages = pagination
      page_prev = pages.delete(:previous_page)
      page_next = pages.delete(:next_page)
      list_items = visible_page_numbers(pages).join(@options[:link_separator])
      content = tag("ul", list_items, class: "pagination-list")
      content.prepend(next_page) if page_next
      content.prepend(previous_page) if page_prev
      tag("nav", content, class: "pagination #{@options[:class]}")
    end

    def container_attributes
      super.except(*[:link_options])
    end

    protected

    def visible_page_numbers(pages)
      if @options[:maximum_links] && pages.size > @options[:maximum_links]
        link_offset = @options[:maximum_links] / 2
        link_start = [(current_page.to_i - link_offset - 1), 0].max
        link_end = current_page.to_i + link_offset - 1
        pages = ([pages.first] + pages[link_start..link_end] + [pages.last]).uniq
        pages = pagination_links_with_gaps(pages)
      else
        pages.map { |page| pagination_link(page) }
      end
    end

    def pagination_links_with_gaps(pages)
      pages_with_gaps = []
      last_page = 0

      pages.each do |page|
        if page - last_page != 1
          pages_with_gaps << gap
        end
        pages_with_gaps << pagination_link(page)
        last_page = page
      end
      pages_with_gaps
    end

    def pagination_link(page)
      link_options = @options[:link_options] || {}
      if page == current_page
        tag :li, tag(:span, page), class: ('pagination-link is-current')
      else
        tag :li, link(page, page, link_options.merge(rel: rel_value(page), class: 'pagination-link'))
      end
    end

    def previous_or_next_page(page, text, classname)
      link_options = @options[:link_options] || {}
      if page
        tag :li, link(text, page, link_options), class: classname
      else
        tag :li, tag(:span, text), class: classname, disabled: true
      end
    end

    def gap
      tag :li, '<span class="pagination-ellipsis">&hellip;</span>'
    end

    def previous_page
      num = @collection.current_page > 1 && @collection.current_page - 1
      previous_or_next_page(num, @options[:previous_label], "pagination-previous")
    end

    def next_page
      num = @collection.current_page < @collection.total_pages && @collection.current_page + 1
      previous_or_next_page(num, @options[:next_label], "pagination-next")
    end

  end
end
