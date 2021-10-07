module Discussions
  class NotificationsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_discussion

    def create
      @discussion.toggle_subscription(Current.user)
      redirect to @discussion
    end

    private

    def set_discussions
      @discussion = Discussion.find(params[:discussion_id])
    end
  end
end
