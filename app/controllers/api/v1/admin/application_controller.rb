module Api
  module V1
    module Admin
      class ApplicationController < ApplicationController
        http_basic_authenticate_with(name: ENV.fetch('BASIC_AUTH_USER', nil),
                                     password: ENV.fetch('BASIC_AUTH_PASS', nil))
      end
    end
  end
end
