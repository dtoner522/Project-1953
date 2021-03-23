class SwapRequestsController < ApplicationController
  def create
    @swap_request = SwapRequest.create(swap_request_params)
  end

  private

  def swap_request_params
    params.require(:swap_request).permit(:user, :library_book)
  end
end
