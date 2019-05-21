class RelationshipsController < ApplicationController
  def index
    @relations = Relationship.where(company_id: current_user.id).or(Relationship.where(friend_id: current_user.id))
  end

  def show
    if request.referer.include?("/companies/")
      friend = Company.find(params[:id])
      @relation = Relationship.find_by(company_id: current_user.id, friend_id: friend.id) || Relationship.find_by(company_id: friend.id, friend_id: current_user.id)
    elsif request.referer.include?("/relationships")
      @relation = Relationship.find(params[:id])
    end
    
    @chats = Chat.where(relationship_id: @relation.id)
    
  end

  def create
    company = Company.find(params[:id])
    current_user.relate(company)
    redirect_to action: 'show'
  end

  def destroy
  end
end
