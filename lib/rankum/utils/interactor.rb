module Rankum
  module Utils
    module Interactor

      def initialize context={}
        @context = OpenStruct.new(context)
      end

      def execute
        begin
          yield
          @context.send("success?=",true)
          @context.send("fail?=",false)
         rescue Exception => e
          @context.send("success?=",false)
          @context.send("fail?=",true)
        end

        @context
      end

      def context
        @context
      end

    end
  end
end
