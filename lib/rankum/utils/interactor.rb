require "ostruct"

module Rankum
  module Utils
    module Interactor

      def initialize context={}
        @context = OpenStruct.new(context)
      end

      def execute
        begin
          yield
          exit if @context.fail?
          success!
         rescue Exception => e
           fail!
        end

        @context
      end

      def organize *interactors
        interactors.each do |interactor|
          context_hash = @context.to_h
          context = interactor.run(context_hash)

          @context = OpenStruct.new(context_hash.merge!(context.to_h))
        end

        @context
      end

      def context
        @context
      end

      def fail!
        @context.send("success?=",false)
        @context.send("fail?=",true)
      end

      def success!
        @context.send("success?=",true)
        @context.send("fail?=",false)
      end

    end
  end
end
