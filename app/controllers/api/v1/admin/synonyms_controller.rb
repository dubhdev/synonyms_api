module Api
  module V1
    module Admin
      class SynonymsController < Api::V1::Admin::ApplicationController
        def index
          collection = ::Synonym.kept.order_created_at
          data = ActiveModel::Serializer::CollectionSerializer.new(collection,
                                                                   { serializer: SynonymSerializer }).as_json
          render json: { data: }
        end

        def authorize
          operation = Synonym::Operation::Authorize.call(params:)
          if operation.success?
            data = ActiveModelSerializers::SerializableResource.new(operation[:model],
                                                                    { serializer: SynonymSerializer }).as_json
            render json: { success: true, data: }
          else
            render json: { success: false }
          end
        end

        def destroy
          operation = Synonym::Operation::Delete.call(params:)
          if operation.success?
            render json: { success: true }
          else
            render json: { success: false }
          end
        end
      end
    end
  end
end
