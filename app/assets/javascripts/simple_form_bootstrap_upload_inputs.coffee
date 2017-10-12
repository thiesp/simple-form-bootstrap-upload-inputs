@assign_filename = (file_input) ->
  filename = get_file_name(file_input)
  get_text_input(file_input).val(filename) if filename

get_text_input = (file_input) ->
  $(file_input).parents("span.input-group").find("input.form-control")

get_file_name = (file_input) ->
  $(file_input).val().replace(/\\/g, '/').replace(/.*\//, '')