+ function(t) {
    "use strict";

    function e() {
        var t = document.createElement("bootstrap"),
            e = {
                WebkitTransition: "webkitTransitionEnd",
                MozTransition: "transitionend",
                OTransition: "oTransitionEnd otransitionend",
                transition: "transitionend"
            };
        for (var i in e)
            if (void 0 !== t.style[i]) return {
                end: e[i]
            };
        return !1
    }
    t.fn.emulateTransitionEnd = function(e) {
        var i = !1,
            s = this;
        t(this).one("bsTransitionEnd", function() {
            i = !0
        });
        var a = function() {
            i || t(s).trigger(t.support.transition.end)
        };
        return setTimeout(a, e), this
    }, t(function() {
        t.support.transition = e(), t.support.transition && (t.event.special.bsTransitionEnd = {
            bindType: t.support.transition.end,
            delegateType: t.support.transition.end,
            handle: function(e) {
                return t(e.target).is(this) ? e.handleObj.handler.apply(this, arguments) : void 0
            }
        })
    })
}(window.jQuery), $(function() {
  var Charts = {
      _HYPHY_REGEX: /-([a-z])/g,
      _cleanAttr: function(t) {
          delete t.chart, delete t.value, delete t.labels
      },
      doughnut: function(element) {
          var attrData = $.extend({}, $(element).data()),
              data = eval(attrData.value);
          Charts._cleanAttr(attrData);
          var options = $.extend({
              responsive: !0,
              animation: !1,
              segmentStrokeColor: "#fff",
              segmentStrokeWidth: 2,
              percentageInnerCutout: 80
          }, attrData);
          new Chart(element.getContext("2d")).Doughnut(data, options)
      }
  };
  $(document).on("redraw.bs.charts", function() {
    $("[data-chart]").each(function() {
      $(this).is(":visible") && Charts[$(this).attr("data-chart")](this)
    })
  }).trigger("redraw.bs.charts")
});
