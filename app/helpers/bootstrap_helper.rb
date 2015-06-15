include ActionView::Helpers::TagHelper
include ActionView::Context

module BootstrapHelper

  class Base
    attr_accessor :id

    def initialize(id=nil, &block)
      @ctx = RequestStore.store.fetch(:current_view_context)
      yield(self)
    end
  end

  class PanelGroup < Base
    attr_accessor :id, :class, :header, :body, :footer

    def initialize(opts={}, &block)
      @ctx = RequestStore.store.fetch(:current_view_context)
      @group  = ''
      yield(self)
    end

    def body(opts={}, &block)
      uuid = UUID.generate
      group_id = opts[:id] || uuid
      group_role = opts[:role]
      group_multiselectable = opts[:multiselectable]

      @group += content_tag :div, nil, {id: group_id, class: "panel-group", role: group_role, aria: {multiselectable: group_multiselectable}} do
        @ctx.capture(&block)
      end
    end

    def to_s
      ret = @group
      ret.html_safe
    end
  end

  class Panel < Base
    attr_accessor :id, :header, :body, :footer

    def initialize(opts={}, &block)
      @uuid         = UUID.generate
      @ctx          = RequestStore.store.fetch(:current_view_context)

      @type_id = opts[:id] || @uuid
      @type_class = opts[:class] || "default"
      @heading_id = ""
      @collapse_id = ""

      @group  = ''
      @heading = ""
      @body = ""
      @footer = ""
      yield(self)
    end

    def heading(opts={}, &block)
      @heading_id = opts[:id] || nil
      heading_role = opts[:role] || nil

      @heading += content_tag :div, nil, {id: @heading_id, class: "panel-heading", role: heading_role} do
        @ctx.capture(&block)
      end
    end

    def title(opts={}, &block)
      title_id = opts[:id] || nil
      title_role = opts[:role] || nil
      title_name = opts[:name] || 'div'

      @heading += content_tag title_name, nil, {id: title_id, class: "panel-title", role: title_role} do
        @ctx.capture(&block)
      end
    end

    def link(opts={}, &block)
      link_id       = opts[:id] || nil
      link_class    = opts[:class] || nil
      link_role     = opts[:role] || nil
      link_parent   = opts[:parent]
      link_expanded = opts[:expanded] || true
      link_controls = opts[:controls]
      link_href     = opts[:href]

      @heading += content_tag opts[:name], nil, {id: link_id, class: link_class, role: link_role, data: {toggle: "collapse", parent: "##{link_parent}"}, aria: {expanded: link_expanded, controls: link_controls}, href: "##{link_href}"} do
        @ctx.capture(&block)
      end
    end

    def collapse(opts={}, &block)
      @collapse_id    = opts[:id]
      collapse_class  = opts[:class] || nil
      collapse_role   = opts[:role]

      @body += content_tag :div, nil, {id: @collapse_id, class: "panel-collapse collapse #{collapse_class}" , role: collapse_role, aria: {labelledby: @heading_id}} do
        @ctx.capture(&block)
      end
    end

    def body(opts={}, &block)
      body_id         = opts[:id]     || nil
      body_class      = opts[:class]  || nil
      body_role       = opts[:role]   || nil

      @body += content_tag :div, nil, {id: body_id, class: "panel-body #{body_class}", role: body_role} do
        @ctx.capture(&block)
      end
    end

    def footer(opts={}, &block)
      uuid = UUID.generate
      footer_id = opts[:id] || uuid
      footer_class = opts[:class] || nil

      @footer = content_tag :div, {id: footer_id, class: "panel-footer #{footer_class}"} do 
        @ctx.capture(&block)
      end
    end

    def to_s
      ret = content_tag :div, nil, {id: @type_id, class: "panel panel-#{@type_class}"} do
        content = @heading.html_safe
        content += @body.html_safe
        content += @footer.html_safe
      end
      ret.html_safe
    end
  end

  class Nav < Base
    def initialize(opts={}, &block)
      @navs = opts[:navs]
      @lis  = ''
      @tabs = ''
      @ctx = RequestStore.store.fetch(:current_view_context)

      @nav_tab_id         = opts[:nav_tab_id]         || UUID.generate
      @nav_tab_class      = opts[:nav_tab_class]      || ''

      @tab_content_id     = opts[:tab_content_id]     || UUID.generate
      @tab_content_class  = opts[:tab_content_class]  || ''

      yield(self)
    end

    def nav_li(opts={}, &block)
      @lis += content_tag :li, { id: opts[:li_id] ? "#{ opts[:li_id] }" : UUID.generate, class: opts[:active] ? "#{ opts[:li_class] } active" : "#{ opts[:li_class] }" } do 
        content_tag :a, { id: opts[:a_id] ? "#{ opts[:a_id] }" : UUID.generate, class: opts[:a_class] ? "#{ opts[:a_class] }" : "", href: opts[:a_href] ? "#{ opts[:a_href] }" : "#",  data: {toggle: "tab"} } do
          @ctx.capture(&block)
        end
      end
    end

    def nav_pane(opts={}, &block)
      @tabs += content_tag :div, { id: opts[:tab_id] ? opts[:tab_id] : UUID.generate, class: opts[:active] ? "tab-pane fade in active #{opts[:tab_class]}" : "tab-pane fade #{opts[:tab_class]}" } do
        @ctx.capture(&block)
      end
    end

    def to_s
      ret = content_tag :ul, { id: @nav_tab_id, class: "nav nav-tabs #{@nav_tab_class}" } do
        @lis.html_safe
      end
      ret += content_tag :div, { id: @tab_content_id, class: "tab-content #{@tab_content_class}" } do
        @tabs.html_safe
      end
      ret.html_safe
    end
  end
end
