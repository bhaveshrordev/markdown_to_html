module NotesHelper
  def markdown(text)
    # extensions = [ :highlight ]
    extensions = %i[
      hard_wrap autolink no_intra_emphasis tables fenced_code_blocks
      disabled_intended_code_blocks strikethrough lax_spacing space_after_headers
      quote footnotes highlight underline
    ]
    Markdown.new(text, *extensions).to_html
  end

  def advanced_markdown(text)
    render_options = { no_links: false, hard_wrap: true, link_attributes: { target: '_blank'} }
    extensions = { highlight: true, hard_wrap: true }

    renderer = Redcarpet::Render::HTML.new(render_options)
    Redcarpet::Markdown.new(renderer, extensions).render(text)
  end

end
