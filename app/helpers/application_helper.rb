module ApplicationHelper

  def sets_div_class_value(errors)
    if errors.any?
      return 'form-group has-error'
    else
      return 'form-group'
    end
  end

  def markdown(text)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render text).html_safe
  end

end
