include ActionView::Helpers::TagHelper
include ActionView::Context

module WelcomeHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def li_nested_ul(title="", &block )
    if title.empty?
      return content_tag( :li, content_tag( :ul,  block ) )
    else
      return content_tag :li do
        content_tag :ul do
          content_tag( :p, title )
          block
        end
      end
    end
  end

  def li_content ( li )
     return content_tag( :li, content_tag( :p, li ) )
  end

  def li_lead_content ( small, p )
     return content_tag :li do
       content_tag( :p, nil, { class: "lead" }, content_tag( :small, small ) )
       content_tag( :p, p )
     end
  end

end
