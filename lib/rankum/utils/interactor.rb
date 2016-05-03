module Rankum
  module Utils
    module Interactor

      def execute
        begin
          yield
          @context.send("success?=",true)
          @context
         rescue Exception => e
          @context.send("fail?=",true)
        end
      end

    end
  end
end
