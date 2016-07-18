module ApplicationHelper
def concur(vacancy, user)
    "(#{ (vacancy.skills & user.skills).count} из #{ vacancy.skills.count })"
  end
end
