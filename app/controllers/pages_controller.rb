class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def home
    render inertia: 'InertiaExample', props: {
      guest: current_or_guest_user.guest?,
      name: 'World'
    }
  end
end
