module Api
  module V1
    module Public
      class Synonym::Contract::Create < Reform::Form
        property :word
        property :synonym

        validation do
          params do
            required(:word).filled
            required(:synonym).filled
          end

          rule(:synonym) do
            key.failure('must be unique') if [values[:word], values[:word]].all?(&:present?) && ::Synonym.kept.exists?(
              word: values[:word], synonym: values[:synonym]
            )
          end
        end
      end
    end
  end
end
