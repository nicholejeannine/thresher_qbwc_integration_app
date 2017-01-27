class PublicController < ApplicationController
  layout 'public'
  skip_before_action :check_auth
  #TODO: Dry out this controller
  # def page
  #   render params[:page]
  # end
  def index
    @title = 'Thresher Communication & Productivity'
  end

  def about
    @title = 'About Us'
  end

  def av_design
    @title = "AV Design Renderings"
  end

  def careers
    @title = "Careers at Thresher"
  end

  def contact
    @title = 'Contact Us'
  end

  def press
    @title = "Press Release"
  end

  def services
    @title = 'Services'
  end

  def sitemap
    @title = "Sitemap"
  end

  def team
    @title = "Meet The Team"
  end

end
