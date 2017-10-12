class MultipleUploadInput < SimpleForm::Inputs::Base

  def input(wrapper_options)
    template.content_tag(:span, class: 'input-group') do
      template.concat input_group_choose
      template.concat filename_field
      template.concat input_group_btn_delete
    end
  end

  private

  def input_group_choose
    template.content_tag(:span, class: 'input-group-btn') do
      template.concat choose_button
    end
  end

  def input_group_btn_delete
    template.content_tag(:span, class: 'input-group-btn') do
      template.concat delete_button
    end
  end

  def delete_button
    # Inspired by Cocoon::ViewHelpers link_to_remove_association
    template.concat template.hidden_field_tag("#{object_name}[_destroy]", object._destroy)

    is_dynamic = object.new_record?

    classes = ["remove_fields","btn","btn-danger"]
    classes << (is_dynamic ? 'dynamic' : 'existing')
    classes << 'destroyed' if object.marked_for_destruction?

    template.link_to template.bootstrap_icon('trash'), "#", class: classes.compact.join(' ')
  end

  def choose_button
    template.content_tag(:label, class: 'btn btn-primary') do
      template.concat I18n.t('single_upload.upload_file')
      template.concat @builder.file_field attribute_symbol, onchange: "assign_filename(this)"
      template.concat @builder.hidden_field attribute_cache_symbol, value: object.read_attribute(attribute_cache_symbol)
    end
  end

  def filename_field
    template.content_tag(:input,nil,class: 'form-control', disabled: true, value: filename)
  end

  def attribute_symbol
    attribute_name.to_sym
  end

  def attribute_cache_symbol
    "#{attribute_name}_cache".to_sym
  end

  def attribute_identifier_symbol
    "#{attribute_name}_identifier".to_sym
  end

  def filename
    (object.send(attribute_cache_symbol) && object.send(attribute_cache_symbol).filename) || object.send(attribute_identifier_symbol)
  end
end