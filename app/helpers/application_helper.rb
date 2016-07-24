module ApplicationHelper

  def markdown(text) #Allows the ability to render markdown inline. Example: `<%= markdown(@artefact.content) %>`
    options = {
      filter_html:     true,
      hard_wrap:       true,
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true,
      fenced_code_blocks: true
    }

    extensions = {
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: false,
      fenced_code_blocks: true,
      no_intra_emphasis:  true,
      lax_spacing:        true,
      space_after_headers: true,
      tables:             true,
      strikethrough:      true,
      with_toc_data:      true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end
end