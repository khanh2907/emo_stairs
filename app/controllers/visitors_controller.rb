class VisitorsController < ApplicationController
  def index
    @sandra = get_sandra
  end

  def sandra
    render json: get_sandra
  end

  private
  def get_sandra
    day_count = Reading.where(['created_at >= ?', DateTime.now.beginning_of_day]).count

    hourly_count = Reading.where(['created_at >= ?', 30.minutes.ago]).count

    if day_count == 0
      return SANDRA[(0..2).to_a.sample]
    elsif hourly_count > 19
      return SANDRA[(21..23).to_a.sample]
    else
      return SANDRA[hourly_count+3]
    end
  end
end
