# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def validation_error(message)
    render json: { status: :unprocessable_entity, message: message.to_s, data: {} }
  end

  def response_success(message)
    render json: { status: :ok, message: message.to_s, data: {} }
  end

  def response_created(message)
    render json: { status: :created, message: message.to_s, data: {} }
  end
end
