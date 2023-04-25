module ActiveScaffold 
  module Extensions
    module NameOptionForDatetime
      private
      def datetime_selector_with_name(options, html_options)
        options.merge!(:prefix => options[:name].gsub(/\[[^\[]*\]$/,'')) if options[:name]
        datetime_selector_without_name(options, html_options)        
      end
      alias_method_chain :datetime_selector, :name
    end
  end
end

klass = defined?(ActionView::Helpers::InstanceTag) ? ActionView::Helpers::InstanceTag : ActionView::Helpers::Tags::DateSelect
klass.include(ActiveScaffold::DateSelectExtension)
