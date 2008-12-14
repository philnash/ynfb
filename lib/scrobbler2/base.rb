module Scrobbler2
  
  API_KEY     = 'c12218ef9ed9520675b99a92dc4fc569'
  API_URL     = "http://ws.audioscrobbler.com/2.0/"
  
  class Base
    class << self
      def connection
        @connection ||= REST::Connection.new(API_URL,API_KEY)
      end
      
      def fetch_and_parse(resource,params=nil)
        Hpricot::XML(connection.get(resource,params))
      end
    end
    
    private
      def get_instance(api_method, params, instance_name, element, force=false)
        scrobbler_class = "scrobbler2/#{element.to_s}".camelize.constantize
        if instance_variable_get("@#{instance_name}").nil? || force
          doc      = self.class.fetch_and_parse("#{api_method}",params)
          elements = (doc/element).inject([]) do |elements, el| 
            elements << scrobbler_class.new_from_xml(el, doc)
            elements
          end
          instance_variable_set("@#{instance_name}", elements)
        end
        instance_variable_get("@#{instance_name}")
      end
  end
end