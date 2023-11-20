module Api
  module V1
    module Public
      class Synonym::Operation::Create < Trailblazer::Operation
        step Model(::Synonym, :new)
        step Contract::Build(constant: Synonym::Contract::Create)
        step Contract::Validate(key: :data)
        step Contract::Persist()
      end
    end
  end
end
