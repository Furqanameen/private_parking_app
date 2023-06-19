class ReservationsPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?; end

  def create?; end

  def edit?; end

  def update?; end
end
