module ApplicationHelper
  def render_markdown(mkd)
    pipeline = HTML::Pipeline.new [
      HTML::Pipeline::MarkdownFilter,
    ]
    pipeline.call(mkd)[:output].to_s.html_safe
  end
end
