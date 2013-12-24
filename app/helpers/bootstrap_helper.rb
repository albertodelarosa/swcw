module BootstrapHelper

  #========================== EXAMPLE ==========================
  #= BootstrapHelper::Panel.new(contextual: 'panel-info', title: '', footer: '') do |panel|
    #- panel.header do 
      #Anastacia de la Rosa

    #- panel.body do
      #= render "shared/breadcrumbs"

    #-panel.footer do
      #I too have a footer
  class Panel
    attr_accessor :id, :header, :body, :footer

    def initialize(opts={}, &block)
      @uuid = UUID.generate
      @main_id = opts[:id] || @uuid
      @main_class = opts[:main_class] || ''
      @ctx = RequestStore.store.fetch(:current_view_context)

      @contextual = ((!opts[:contextual]) or (opts[:contextual] == "")) ? @contextual = 'panel-default' : @contextual = opts[:contextual]
      @has_a_footer = opts[:footer] ?  true : false
      @has_a_title = opts[:title] ?  true : false
      @header = ''
      yield(self)
    end

    def header(opts={}, &block)
      @header_class = opts[:header_class] || ''
      @header = @ctx.capture(&block)
      return nil
    end

    def header_col(opts={}, &block)
      col_size  = opts[:col_size]
      col_class = opts[:col_class] || ''
      content   = @ctx.capture(&block)

      @header += <<-END
        <div class="col-xs-#{col_size} col-sm-#{col_size} col-md-#{col_size} col-lg-#{col_size} #{col_class}">#{content}</div>
      END
      @header.html_safe
    end

    def body(opts={}, &block)
      @body = @ctx.capture(&block)
      return nil
    end

    def footer(opts={}, &block)
      @footer = @ctx.capture(&block)
      return nil
    end

    def to_s
      ret = <<-END
        <div id="#{@main_id}" class="panel #{@contextual} #{@main_class}">
      END
      if @has_a_title
        ret += <<-END
          <div class="panel-heading  #{@header_class}">
            <div class="panel-title">
              <div class="row">
              #{@header}
            </div>
            </div>
          </div>
        END
      else
        ret += <<-END
          <div class="panel-heading #{@header_class}">
            <div class="row">
            #{@header}
            </div>
          </div>
        END
      end
      ret += <<-END
          <div class="panel-body">
            #{@body}
          </div>
      END
      if @has_a_footer
        ret += <<-END
            <div class="panel-footer">
              <div class="row">
                #{@footer}
              </div>
            </div>
        END
      end
      ret += <<-END
        </div>
      END
      ret.html_safe
    end
  end

  class Nav

    def initialize(opts={}, &block)
      @navs = opts[:navs]
      @lis  = ''
      @tabs = ''
      @ctx = RequestStore.store.fetch(:current_view_context)

      uuid = UUID.generate
      @nav_tab_id         = opts[:nav_tab_id]         || uuid
      @nav_tab_class      = opts[:nav_tab_class]      || ''

      uuid = UUID.generate
      @tab_content_id     = opts[:tab_content_id]     || uuid
      @tab_content_class  = opts[:tab_content_class]  || ''


      yield(self)
    end

    def nav_li(opts={}, &block)
      uuid = UUID.generate
      li_id     = opts[:li_id]    || uuid
      li_class  = opts[:li_class] || ''

      uuid = UUID.generate
      a_id      = opts[:a_id]     || uuid
      a_class   = opts[:a_class]  || ''
      a_href    = opts[:a_href]   || ''

      anchor_content = @ctx.capture(&block)

      if opts[:active]
        @lis += <<-END
          <li id="#{li_id}" class="#{li_class} active">
            <a id="#{a_id}" class="#{a_class}" href="#{a_href}" data-toggle="tab">
              #{anchor_content}
            </a>
          </li>
        END
      else
        @lis += <<-END
          <li id="#{li_id}" class="#{li_class}">
            <a id="#{a_id}" class="#{a_class}" href="#{a_href}" data-toggle="tab">
              #{anchor_content}
            </a>
          </li>
        END
      end
      @lis.html_safe
    end

    def nav_pane(opts={}, &block)

      uuid = UUID.generate
      tab_id              = opts[:tab_id]             || uuid
      tab_class           = opts[:tab_class]          || ''
      tab_content         = @ctx.capture(&block)

      if opts[:active]
        @tabs += <<-END
          <div class="tab-pane fade in active #{tab_class}" id="#{tab_id}">#{tab_content}</div>
        END
      else
        @tabs += <<-END
          <div class="tab-pane fade #{tab_class}" id="#{tab_id}">#{tab_content}</div>
        END
      end
      @tabs.html_safe
    end

    def to_s
      ret = <<-END
        <ul  id="#{@nav_tab_id}" class="nav nav-tabs #{@nav_tab_class}">
          #{@lis}
        </ul>
        <div id="#{@tab_content_id}" class="tab-content #{@tab_content_class}">
          #{@tabs}
        </div>
      END
      ret.html_safe
    end
  end
end
