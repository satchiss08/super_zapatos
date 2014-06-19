module Services
  module Api
    class ErrorMessage
      attr_reader :code

      def initialize(opts={})
    	@code = opts[:code]
      end

      def error_generator
        @json_list = Hash.new()

        if @code == 400
          @json_list["error_msg"] = "Bad Request"
          @json_list["error_code"] = 400
        else
          @json_list["error_msg"] = "Record not Found"
          @json_list["error_code"] = 404
        end

        @json_list["success"] = false
        return @json_list
      end
    end
  end
end