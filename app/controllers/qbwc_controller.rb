class QbwcController < ApplicationController
  skip_before_action :check_auth
  include QBWC::Controller
end
