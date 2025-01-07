# frozen_string_literal: true

class EmailsController < ApplicationController # rubocop:disable Style/Documentation
  def create
    draw = Draw.where(id: params[:id]).first
    secret_friend = MatchFriend.where(draw_id: draw)
    p '__________________draw__________________'
    p draw
    p '__________________secret__________________'
    p secret_friend
    UserMailer.send_secret_friend(participant1, participant2)
  end
end
