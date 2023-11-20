module Api
  module V1
    module Admin
      class Synonym::Operation::Delete < Trailblazer::Operation
        step :model!
        step :destroy!

        def model!(ctx, params:, **)
          ctx[:model] = ::Synonym.kept.find_by(id: params[:id])
        end

        def destroy!(_ctx, model:, **)
          model.discard
        end
      end
    end
  end
end
