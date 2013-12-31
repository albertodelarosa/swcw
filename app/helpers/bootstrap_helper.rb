module BootstrapHelper

#=============== EXAMPLE =============== EXAMPLE =============== EXAMPLE ===============
  #= BootstrapHelper::Panel.new(contextual: 'info', title: '', footer: '') do |panel|
    #- panel.header_col(xs:1, sm:2, md:3 lg:4) do 
      #= &block

    #- panel.body do
      #= &block

    #-panel.footer do
      #= &block

  class Panel
    attr_accessor :id, :header, :body, :footer

    def initialize(opts={}, &block)
      @uuid = UUID.generate
      @panel_id = opts[:id] || @uuid
      @panel_class = opts[:class] || ''
      @header_class = opts[:header_class] || ''
      @ctx = RequestStore.store.fetch(:current_view_context)

      @contextual = ((!opts[:contextual]) or (opts[:contextual] == "")) ? @contextual = 'panel-default' : @contextual = opts[:contextual]
      @has_a_footer = opts[:footer] ?  true : false
      @has_a_title = opts[:title] ?  true : false
      @header = ''
      @body = ''
      @footer = ''
      yield(self)
    end

    def header_col(opts={}, &block)
      uuid = UUID.generate
      col_id = "#" + ("#{uuid}")
      col_class = "col-xs-#{opts[:xs]} col-sm-#{opts[:sm]} col-md-#{opts[:md]} col-lg-#{opts[:lg]} #{opts[:class]}"

      @header += content_tag :div, {id: col_id, class: col_class} do
        @ctx.capture(&block)
      end
      @header
    end

    def body(opts={}, &block)
      uuid = UUID.generate
      col_id = "#" + "#{opts[:id]}" || "#{uuid}"
      @body = content_tag :div, {id: col_id, class: "panel-body #{:class}"} do 
        @ctx.capture(&block)
      end
      @body
    end

    def footer(opts={}, &block)
      uuid = UUID.generate
      col_id = "#" + "#{opts[:id]}" || "#{uuid}"
      @footer = content_tag :div, {id: col_id, class: "panel-footer #{opts[:class]}"} do 
        content_tag :div, { class: "row" } do 
          @ctx.capture(&block)
        end
      end
      @footer
    end

    def to_s
      uuid = UUID.generate
      panel_id = "#" + @panel_id || uuid
      ret = content_tag :div, {id: panel_id, class: "panel panel-#{@contextual} #{@panel_class}"} do
        content = content_tag :div, { class: "panel-heading #{@header_class}" } do
          if @has_a_title
            content_tag :div, { class: "panel-title" } do
              content_tag :div, { class: "row" } do
                @header.html_safe
              end
            end
          else
            content_tag :div, { class: "row"} do
              @header.html_safe
            end
          end
        end
        content += @body.html_safe
        @has_a_footer ? content += @footer.html_safe : content.html_safe
      end
      ret.html_safe
    end
  end

  class Nav
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
