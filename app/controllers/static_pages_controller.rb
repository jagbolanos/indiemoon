class StaticPagesController < ApplicationController
  def home
    @events = Event.week_events_byday_and_ongoing
  end

  def info
  end

  def about
  end
end
