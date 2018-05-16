class DashboardController < ApplicationController
  def show
    @cities = Job.count_by_city
  end
end
