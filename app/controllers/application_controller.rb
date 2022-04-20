# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def validation_error(message)
    return render json: { status: :unprocessable_entity, message: message.to_s, data: {} }
  end

  def response_success(message)
    return render json: { status: :ok, message: message.to_s, data: {} }
  end
end
