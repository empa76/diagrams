class ApplicationController < ActionController::API
  include ActionController::Serialization

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end
end
