module ApplicationHelper
  def copyright_years(start)
    now_year = Time.now.year
    if start == now_year
      now_year
    else
      "#{start}&mdash;#{now_year}".html_safe
    end
  end

  def pretty_date(time)
    time.strftime("%Y-%m-%d")
  end

  def pretty_time(time)
    time.strftime("%Y-%m-%d %I:%M %p")
  end

end
