module Helpers

  def current_user
    @current_user ||= User.get(session[:user_id])
  end

  def search_available_spaces(date_from)
    p __LINE__, date_from
    available_spaces = []
    AvailableDates.all(:available_from_date.gte => date_from).each do |space|
      # p space
      available_spaces << space.space_id
    end
    p __LINE__, available_spaces

    if !available_spaces.empty?
      session[:space_id_array] = available_spaces.uniq
    end
    # p session[:space_id_array]
  end
end
