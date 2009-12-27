class FriendlyBuilder < ActionView::Helpers::FormBuilder

  # Adds an "error" class to labels associated with an errornous form field.
  def label(method, text = nil, options = {})
    #object = @template.instance_variable_get "@#{@object_name}"
    #p @object_name
    options[:class] = "input-error" if @object && !options[:hide_errors] &&
      @object.errors.on(method.to_sym)
    super method, text, options
  end

end
