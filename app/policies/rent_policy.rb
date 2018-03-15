class RentPolicy < ApplicationPolicy
  def create?
    record.user_id == user.id
  end

  def index?
    record.to_a.all? { |rent| rent.user_id == user.id }
  end
end
