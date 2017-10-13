# Simple Form Bootstrap Upload Inputs

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simple_form_bootstrap_upload_inputs', github: 'thiesp/simple_form_bootstrap_upload_inputs'
```

And then execute:

    $ bundle

### Setup

* simple_form
* bootstrap
* cocoon

* It needs [icon_helper](github.com/thiesp/icon-helper-boostrap3-glyphicon-and-bootstrap4-font-awesome) or you can define your on view helper function `bootstrap_icon(icon)` (in this case icon = "trash") which returns html code for your icon. The icon in question here is 'fa fa-trash' or 'glyphicon-trash', depending on which icon library is used.

#### Javascripts

Add the following require to your `application.js`:

```js
//= require simple_form_bootstrap_upload_inputs
```
#### Stylesheets

Add the following import to your `application.scss`:

```scss
@import "simple_form_bootstrap_upload_inputs";
```

## Usage

Generates the single and multiple upload inputs

### Single file upload

```
<%= f.input :upload, as: :single_upload %>
```

where `:upload` is a carrierwave upload attribute.


### Multiple file upload

Multiple upload uses nested forms like this, where document is a nested attribute, with file as carrierwave attribute.

```
  ## _document_fields.html.erb
  <div class="nested-fields" >
    <%= f.input :file, as: :multiple_upload, label: false %>
  </div>
```

and in the main form:

```
  <div id="documents">
    <div class="has-error">
      <%= f.error :documents %>
    </div>
    <% f.object.documents.each do |document| %>
      <%= f.simple_fields_for :documents ,document do |document_f| %>
        <%= render 'document_fields', f: document_f %>
      <% end %>
    <% end %>
    <div class="links">
      <%= link_to_add_association bootstrap_icon('plus'), f, :documents, class: "btn btn-success" %>
    </div>
  </div>
```

for strong parameters allow:

```ruby
documents_attributes: [:id, :file, :file_cache, :_destroy]
```

## Generators

You can generate everything you need to customize and even use the upload fields without this gem loaded.

### Inputs



### Javascripts

### Stylesheets