class DashboardController < ApplicationController
  def show
    @cities = Job.count_by_city
    @top_jobs = Job.count_by_interest
    @top_companies = Company.top_companies_by_interest
  end
end
