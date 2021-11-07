class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery
  include Pundit
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def transfer_guest_to_user
    # At this point you have access to:
    #   * current_user - the user they've just logged in as
    #   * guest_user - the guest user they were previously identified by
    #
    # After this block runs, the guest_user will be destroyed!

    guest_user.carbon_footprints.update_all(user_id: current_user.id)
  end
end
