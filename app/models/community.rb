class Community < ApplicationRecord
  def index
    @community1 = Community.find_by_id(1)
    @community2 = Community.find_by_id(2)
    @community3 = Community.find_by_id(3)
    @community4 = Community.find_by_id(4)
  end
end
