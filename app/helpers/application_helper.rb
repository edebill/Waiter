module ApplicationHelper
  def copyright_years(start)
    now_year = Time.now.year
    if start == now_year
      now_year
    else
      "#{start}&mdash;#{now_year}".html_safe
    end
  end
end
