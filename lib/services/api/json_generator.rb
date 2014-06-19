module Services
  module Api
    class JsonGenerator
    	attr_reader :list, :type

    	def initialize(opts={})
    	  @list = opts[:list]
    	  @type = opts[:type]
    	end

    	def articles_parser
        @parsed_list = @list.map do |a|
          { :id => a.id, :name => a.name, :description => a.description, :price => a.price, :total_in_shelf => a.total_in_shelf, :total_in_vault => a.total_in_vault, :store_name => a.store.name }
        end
        json_structure
      end

      def stores_parser
        @parsed_list = @list.map do |s|
          { :id => s.id, :name => s.name, :address => s.address }
        end
        json_structure
      end

      def json_structure
        @json_list = Hash.new()

        if @list.count > 1
          @json_list[@type + "s"] = @parsed_list
        else 
          @json_list[@type] = @parsed_list
        end

        @json_list["success"] = true
        @json_list["total_elements"] = @list.count
        return @json_list
      end
    end
  end
end