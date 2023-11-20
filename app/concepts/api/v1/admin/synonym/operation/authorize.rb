module Api
  module V1
    module Admin
      class Synonym::Operation::Authorize < Trailblazer::Operation
        step :model!
        step :authorize!

        def model!(ctx, params:, **)
          ctx[:model] = ::Synonym.kept.draft.find_by(id: params[:id])
        end

        def authorize!(_ctx, model:, **)
          model.authorize!
        end
      end
    end
  end
end
