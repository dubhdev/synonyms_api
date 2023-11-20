module Api
  module V1
    module Public
      class SynonymSerializer < Api::V1::ApplicationSerializer
        attributes :id, :word, :synonym
      end
    end
  end
end
