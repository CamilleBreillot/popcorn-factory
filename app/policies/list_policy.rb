class ListPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def show?
    true
  end

  # def new?
  #   true
  # end

  def create?
    true
  end

  def destroy?
    user == record.user
  end
end
