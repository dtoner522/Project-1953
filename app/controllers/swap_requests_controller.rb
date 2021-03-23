class SwapRequestsController < ApplicationController
  def mark_as_swapped
    @chatroom = Chatroom.find(params[:id])
    @swap_request = @chatroom.swap_request
    @swap_request.status = 'accepted'
    @swap_request.save

    @library_book = @swap_request.library_book
    @library_book.status = 'swapped'
    @library_book.save

    redirect_to chatroom_path(@chatroom)
  end
end
