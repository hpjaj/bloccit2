module ApplicationHelper

  def adds_error_value_to_div_class(errors)
    if errors.any?
      return 'has-error'
    else
      return ''
    end
  end

  def markdown(text)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render text).html_safe
  end

end
