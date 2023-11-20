module Api
  module V1
    module Public
      class SynonymsController < Api::V1::Public::ApplicationController
        def index
          collection = ::Synonym.kept.authorize.order_created_at
          data = ActiveModel::Serializer::CollectionSerializer.new(collection,
                                                                   { serializer: SynonymSerializer }).as_json
          render json: { data: }
        end

        def create
          operation = Synonym::Operation::Create.call(params:)
          if operation.success?
            data = ActiveModelSerializers::SerializableResource.new(operation[:model],
                                                                    { serializer: SynonymSerializer }).as_json
            render json: { success: true, data: }
          else
            errors = operation['contract.default']&.errors&.messages
            render json: { success: false, errors: }
          end
        end
      end
    end
  end
end
