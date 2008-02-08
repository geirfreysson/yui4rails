module Yui4Rails
  module IncludeExtension
	  def add_datatable_includes
			@yui_stylesheets << "fonts/fonts-min"
			@yui_stylesheets << "datatable/assets/skins/sam/datatable"
			@yui_javascript << "utilities/utilities"
			@yui_javascript << "datasource/datasource-beta-min"
			@yui_javascript << "datatable/datatable-beta-min"	
	  end

	  def add_charts_includes
			@yui_javascript << "utilities/utilities"
			@yui_javascript << "datasource/datasource-beta-min"
			@yui_javascript << "json/json-beta-min"
			@yui_javascript << "charts/charts-experimental-min"	
	  end
	
		def include_yui(*args)
			options = args.last.is_a?(Hash) ? args.pop : {} 
			@yui_stylesheets = []
			@yui_javascript = []
			yui_includes = []
			
			add_container_includes if args.include?(:container)
			add_datatable_includes if args.include?(:datatable)
			add_charts_includes if args.include?(:charts)
			
		
			yui_includes << @yui_stylesheets.uniq.map{|ss| stylesheet_link_tag("/yui/#{ss}")}
			yui_includes << @yui_javascript.uniq.map{|js| javascript_include_tag("/yui/#{js}")}
			yui_includes.flatten.join("\n")
		end
		
		def add_container_includes
			@yui_stylesheets << "container/assets/container"
			@yui_javascript << "yahoo-dom-event/yahoo-dom-event"
			@yui_javascript << "animation/animation-min"
			@yui_javascript << "container/container-min"	
		end	
  end
end