module UsersHelper
  def role(user, engagement)
    role = nil
    if engagement.contact == user
        role = 'Client'
    elsif engagement.coach == user
        role = 'Coach'
    elsif engagement.users.include?(user) 
        role='Developer'
    end
  end
end
