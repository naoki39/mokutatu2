class CommunitiesController < ApplicationController
  def index#データベースからコミュニティを取得
    @community1 = Community.where(name: "ダイエット")
    @community2 = Community.where(name: "トレーニング")
    @community3 = Community.where(name: "資格勉強")
    @community4 = Community.where(name: "創作")
  end
end
