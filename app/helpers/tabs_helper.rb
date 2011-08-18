module TabsHelper
    def make_tab(t)
    # creates a navigation tab out of the given information.    
      tab = "<li"
      tab << ' id="current"' if current_page?(t[:options])
      tab << '>'
      tab << link_to(t[:name], t[:options])
      tab << '</li>'
      tab.html_safe
      
#      tab = "%li"
#      tab << "#current" if current_page?(t[:options])
#      tab << link_to(t[:name], t[:options])
#      tab
    end
end