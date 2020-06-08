# will_paginate-bulma

![Bulma Pagination Component](https://raw.github.com/phoffer/will_paginate-bulma/master/pagination.png)

This gem integrates the [Bulma](http://bulma.io) [pagination component](http://bulma.io/documentation/components/pagination/) with the [will_paginate](https://github.com/mislav/will_paginate) pagination gem.

## Supports Bulma 0.4.2-0.9.0

## Install

  * `gem install will_paginate-bulma`, *or*
  * For projects using Bundler, add `gem 'will_paginate-bulma'` to your `Gemfile` (and then run `bundle install`).

## Usage

### Hanami

  1. To work with Hanami, you'll need to bundle a fork of will_paginate at [phoffer/will_paginate](https://github.com/phoffer/will_paginate) with the `hanami` branch. (Hopefully it will be merged soon!)
  2. Add the helper to the app you want to use will_paginate in application.rb. This enables will_pagination in Hanami.
  3. To render, use `BulmaPagination::Hanami` as the renderer.

```
# apps/web/application.rb
view.prepare do
  ...
  include WillPaginate::Hanami
end
# rendering
<%= will_paginate collection, renderer: BulmaPagination::Hanami %>
```

### Rails

  1. Load the Bulma CSS in your template.
  2. In your view, use the `renderer: BulmaPagination::Rails` option with the `will_paginate` helper, for example:

```
<%= will_paginate @collection, renderer: BulmaPagination::Rails %>
```

### Sinatra

  1. Load the Bulma CSS in your template.
  2. `require "will_paginate-bulma"` in your Sinatra app.
  3. In your view, use the `renderer: BulmaPagination::Sinatra` option with the `will_paginate` helper, for example:

```
<%= will_paginate @collection, renderer: BulmaPagination::Sinatra %>
```

## Configuration
Any of the above usage scenarios will accept configuration options, allowing the user to change the [pagination components](https://bulma.io/documentation/components/pagination/) appearance with Bulma modifier classes. For example, the following will render the pagination component centered on the page:

```
<%= will_paginate @collection, renderer: BulmaPagination::Rails, class: 'is-centered' %>
```

The supported configuration options are as follows:
* `class` applies a class to the top level pagination nav element
* `link_separator` text or html to insert between pagination-link elements
* `link_options` a hash of attributes added to active pagination-link elements _(note, classes added here will be overwritten)_
* `previous_label` text or html to replace the inner content of the link within the pagination-previous element
* `next_label` text or html to replace the inner content of the link within the pagination-next element


Contributing
------------

1. Fork it.
2. Create a branch (`git checkout -b my_markup`)
3. Commit your changes (`git commit -am "Cool new feature"`)
4. Push to the branch (`git push origin my_markup`)
5. Open a [Pull Request][1]

### Special Thanks

This gem code was based on [will_paginate-foundation](https://github.com/acrogenesis/will_paginate-foundation) by Adrian Rangel ([@acrogenesis](https://github.com/acrogenesis)).

License
------------
The MIT License (MIT)
