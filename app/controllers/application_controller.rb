class ApplicationController < ActionController::API
  include ActionController::Serialization

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  rescue_from ActiveRecord::RecordNotFound do
    render json: { error: I18n.t('errors.messages.record_not_found') }, status: :not_found
  end
end
