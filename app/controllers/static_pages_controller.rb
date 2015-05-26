class StaticPagesController < ApplicationController
  skip_before_filter :require_login

  layout "top"

  def top
  end
end
