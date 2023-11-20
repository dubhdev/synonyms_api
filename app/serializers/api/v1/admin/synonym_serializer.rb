module Api
  module V1
    module Admin
      class SynonymSerializer < Api::V1::ApplicationSerializer
        attributes :id, :word, :synonym, :created_at, :status
      end
    end
  end
end
