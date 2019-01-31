# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  after_action :set_greeting, only: :create


  private

  def set_greeting
    flash[:notice] = "Greetings, #{current_user.name}"
  end
end
