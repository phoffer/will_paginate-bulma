require "sinatra"
require "will_paginate-bulma"
require "will_paginate/collection"

$template = <<EOHTML
<html>
<head>
<title>will_paginate-bulma Example App</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.4.2/css/bulma.min.css" rel="stylesheet">
</head>
<body>
</br>
<div style='width: 800px; margin-left: 50px;'>
  <%= will_paginate @collection, renderer: BulmaPagination::Sinatra, class: 'is-centered' %>
</div>
</body>
</html>
EOHTML

def build_collection
  page = if params[:page].to_i > 0
    params[:page].to_i
  else
    1
  end

  @collection = WillPaginate::Collection.new page, 10, 100000
end

get "/" do
  build_collection
  erb $template
end
