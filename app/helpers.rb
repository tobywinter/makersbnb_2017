module Helpers

  def current_user
    @current_user ||= User.get(session[:user_id])
  end

  def search_available_spaces(date_from)
    date = Date.parse(date_from)
    available_spaces = []
    AvailableDates.all.each do |space|
      available_spaces << space
    end
    spaces_ids = []
    available_spaces.each do |space|
      if (space.available_from_date <= date)
        spaces_ids << space.space_id
      end
    end
    if !spaces_ids.empty?
      session[:space_id_array] = spaces_ids.uniq
    end
  end
end
