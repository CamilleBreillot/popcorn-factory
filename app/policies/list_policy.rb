class ListPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def new?
    create?
  end

  # CAN BE EMPTY AS EDIT IS TAKING UPDATE VALUE ACCORDING TO APPLICATION_POLICY
  def edit?
  end

  def update?
    user == record.user || user.admin
  end

  def create?
    user == record.user || user.admin
  end

  def destroy?
    user == record.user || user.admin
  end

  def destroy_all
    user == record.user || user.admin
  end
end
