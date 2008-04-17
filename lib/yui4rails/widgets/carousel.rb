module Yui4Rails
	module Widgets
	  class Carousel
	    def initialize(carousel_id, collection, options = {})	
				@carousel_id = carousel_id
				@collection = collection
				@options = defaults.merge(options)
				@options[:size] = @collection.size
	    end
    
	    def render
	      <<-PAGE
<script type="text/javascript"> 
   YAHOO.util.Event.addListener(window, "load", function() 
{
	carousel = new YAHOO.extension.Carousel("#{@carousel_id}", 
		{#{@options.keys.map{|key| optional_value(key)}.join(", ")}}
	);
});
</script> 
	      PAGE
	    end
	
			private
			# TODO - make a way to take a app-wide options to merge into these defaults
			def defaults
				{
					:numVisible => 3,
					:animationSpeed => 0.5,
					:scrollInc => 3,
					:navMargin => 60,
					:prevElement => "prev_arrow",
					:nextElement => "next_arrow",
					:wrap => true
				}
			end
			
			def optional_value(option, carousel_key = nil)
				carousel_key ||= option
				if @options.has_key?(option) && !@options[option].nil? 
					%\#{carousel_key}: #{@options[option].is_a?(String) ? "'#{@options[option]}'" : @options[option] }\
				else
					""
				end	
			end
	  end
	end
end