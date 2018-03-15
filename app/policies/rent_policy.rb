class RentPolicy < ApplicationPolicy
  def create?
    record.user_id == user.id 
  end
  def index?
    record.to_a.all? { |rent| rent.user_id == user.id }
  end
  def show? 
    puts record.user_id.to_s + " == " + user.id.to_s
    byebug
    record.user.id == user.id 
  end
  def destroy?
    record.user_id == user.id 
  end
end
