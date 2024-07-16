class GroupsController < ApplicationController
    before_action :authenticate_user!
    def index
        @groups = GroupUserInfo.where(user_id: current_user.id)
    end

    def new
    end

    def show
        params.permit(:id)
        @group_to_be_shown = Group.find_by(id: params[:id])
        @messages = Message.where(group_id: params[:id])
        @group_user_infos = GroupUserInfo.where(group_name: @group_to_be_shown.group_name)
    end

    def create
        params.permit(:group_name)
        @group = Group.new(group_name: params[:group_name],group_owner: current_user.id)
        @group.save
        @group_user_info = GroupUserInfo.new(group_name: params[:group_name], user_id: current_user.id, group_owner: @group.group_owner)
        @group_user_info.save
    end

    def destroy
        params.permit(:id)
        @group = Group.find_by(id: params[:id])
        GroupUserInfo.where(group_name: @group.group_name).each do |elem|
            elem.destroy
        end
        Message.where(group_id: @group.id).each do |elem|
            elem.destroy
        end
        @group.destroy
        redirect_to groups_path
    end

    def add
        params.permit(:id)
        @group = Group.find_by(id: params[:id])
    end

    def update_group
        params.permit(:user,:id)
        @group_user_info = GroupUserInfo.new(
            group_name: Group.find_by(id: params[:id]).group_name,
            user_id: User.find_by(email: params[:user]).id,
            group_owner: Group.find_by(id: params[:id]).group_owner
        )
        @group_user_info.save
    end

    def exit
        params.permit(:id)
        @message = Message.new(body: "Left the group", group_id:params[:id],user_id: current_user.id)
        @message.save
        @group_user_info = GroupUserInfo.where(group_name: Group.find_by(id: params[:id]).group_name).find_by(user_id: current_user.id)
        @group_user_info.destroy
        redirect_to groups_path
    end
end