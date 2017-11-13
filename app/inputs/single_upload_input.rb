class SingleUploadInput < SimpleForm::Inputs::Base

  def input(wrapper_options)
    input_group
  end

  def label_target
    attribute_symbol
  end

  private

  def input_group
    template.content_tag(:span, class: 'input-group') do
      template.concat input_group_btn
      template.concat form_control
    end
  end

  def input_group_btn
    template.content_tag(:span, class: 'input-group-btn') do
      template.concat btn_primary
    end
  end

  def btn_primary
    template.content_tag(:label, class: 'btn btn-primary') do
      template.concat I18n.t('simple_form_bootstrap_upload_inputs.upload_file')
      template.concat @builder.file_field attribute_symbol, onchange: "assign_filename(this)"
      template.concat @builder.hidden_field attribute_cache_symbol, value: object.read_attribute(attribute_cache_symbol)
    end
  end

  def form_control
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