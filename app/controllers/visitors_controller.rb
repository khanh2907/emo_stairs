class VisitorsController < ApplicationController
  def index
    @sandra = get_sandra
  end

  def sandra
    render json: get_sandra
  end

  def statistics
    hourly_count = [] # for highcharts data series
    daily_count = []
    weekly_count = []

    hour_groups = Reading.where(['created_at >= ?', DateTime.now.beginning_of_day]).order(created_at: :asc).group_by {|r| r.created_at.beginning_of_hour}
    day_groups = Reading.all.order(created_at: :asc).group_by {|r| r.created_at.beginning_of_day}
    week_groups = Reading.all.order(created_at: :asc).group_by {|r| r.created_at.beginning_of_week}

    hour_groups.each_key do |h|
      hourly_count.push([h.to_f * 1000, hour_groups[h].count])
    end

    day_groups.each_key do |h|
      daily_count.push([h.to_f * 1000, day_groups[h].count])
    end

    week_groups.each_key do |h|
      weekly_count.push([h.to_f * 1000, week_groups[h].count])
    end

    render json: {hourlyCount: hourly_count, dailyCount: daily_count, weeklyCount: weekly_count}

  end

  private
  def get_sandra
    hourly_count = Reading.where(['created_at >= ?', 30.seconds.ago]).count

    if hourly_count >= 22
      return SANDRA[22]
    else
      sandra = SANDRA[hourly_count]
      if sandra[:img] == 'avatar point.png'
        sandra[:dialogue] = sandra.dialogue.gsub('%d', Reading.where(['created_at >= ?', DateTime.now.beginning_of_day]).count)
      end
      return sandra
    end
  end
end
