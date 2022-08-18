module IncludesLookahead
  module Concern
    extend ActiveSupport::Concern

    class_methods do
      def includes_lookahead(lookahead)
        includes(lookahead_inclusions(lookahead))
      end

      protected

      def lookahead_inclusions(lookahead)
        {}.tap do |inclusions|
          lookahead.selections.each do |selection|
            reflection = reflect_on_association(selection.name)
            if reflection
              inclusions[selection.name] = reflection.klass.lookahead_inclusions(selection)
            end
          end
        end
      end
    end
  end
end
