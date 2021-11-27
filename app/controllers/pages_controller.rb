class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def home
    render inertia: 'InertiaExample', props: {
      name: 'World'
    }
  end
end
